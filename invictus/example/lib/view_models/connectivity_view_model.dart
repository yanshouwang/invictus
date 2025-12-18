import 'package:clover/clover.dart';
import 'package:invictus/invictus.dart';
import 'package:invictus_example/models.dart';
import 'package:logging/logging.dart';
import 'package:permission_handler/permission_handler.dart';

Logger get _logger => Logger('ConnectivityViewModel');

class ConnectivityViewModel extends ViewModel {
  final ConnectivityManager _connectivityManager;

  final Map<String, WifiModel> _wifiModels;
  final Map<String, NetworkModel> _ethernetModels;
  late final ConnectivityManager$NetworkCallback _wifiCallback;
  late final ConnectivityManager$NetworkCallback _ethernetCallback;

  Map<String, NetworkModel> get wifiModels => _wifiModels;
  Map<String, NetworkModel> get ethernetModels => _ethernetModels;

  ConnectivityViewModel()
    : _connectivityManager = ConnectivityManager(),
      _wifiModels = {},
      _ethernetModels = {} {
    _initialize();
  }

  void _initialize() async {
    final isGranted = await Permission.locationWhenInUse.isGranted;
    if (!isGranted) {
      final status = await Permission.locationWhenInUse.request();
      _logger.info('location when use status: $status');
    }
    _wifiCallback = ConnectivityManager$NetworkCallback(
      includeLocationInfo: true,
      onAvailable: (network) {
        _logger.info('wifi onAvailable');
      },
      onCapabilitiesChanged: (network, networkCapabilities) {
        _logger.info('wifi onCapabilitiesChanged');
        final info = networkCapabilities.transportInfo;
        if (info is! WifiInfo) {
          _logger.warning('$info is! WifiInfo');
          return;
        }
        final linkProperties = _connectivityManager.getLinkProperties(network);
        if (linkProperties == null) {
          _logger.warning('linkProperties is null');
          return;
        }
        final iface = linkProperties.interfaceName;
        if (iface == null) {
          _logger.warning('iface is null');
          return;
        }
        final model = _wifiModels[iface];
        if (model == null) {
          _logger.warning('model is null');
          return;
        }
        _wifiModels[iface] = model.copyWIth(ssid: info.ssid);
        notifyListeners();
      },
      onLinkPropertiesChanged: (network, linkProperties) {
        _logger.info('wifi onLinkPropertiesChanged');
        final networkCapabilities = _connectivityManager.getNetworkCapabilities(
          network,
        );
        if (networkCapabilities == null) {
          _logger.warning('networkCapabilities is null');
          return;
        }
        final info = networkCapabilities.transportInfo;
        if (info is! WifiInfo) {
          _logger.warning('$info is! WifiInfo');
          return;
        }
        final model = linkProperties.getNetworkModel();
        if (model == null) {
          _logger.warning('wifi model is null');
          return;
        }
        _wifiModels[model.iface] = WifiModel.fromNetworkModel(
          model,
          ssid: info.ssid,
        );
        notifyListeners();
      },
      onLosing: (network, maxMsToLive) {
        _logger.info('wifi onLosing');
      },
      onLost: (network) {
        _logger.info('wifi onLost');
        _wifiModels.clear();
        notifyListeners();
      },
    );
    _ethernetCallback = ConnectivityManager$NetworkCallback(
      onAvailable: (network) {
        _logger.info('ethernet onAvailable');
      },
      onCapabilitiesChanged: (network, networkCapabilities) {
        _logger.info('ethernet onCapabilitiesChanged');
      },
      onLinkPropertiesChanged: (network, linkProperties) {
        _logger.info('ethernet onLinkPropertiesChanged');
        final model = linkProperties.getNetworkModel();
        if (model == null) {
          _logger.warning('ethernet model is null');
          return;
        }
        _ethernetModels[model.iface] = model;
        notifyListeners();
      },
      onLosing: (network, maxMsToLive) {
        _logger.info('ethernet onLosing');
      },
      onLost: (network) async {
        _logger.info('ethernet onLost');
        _ethernetModels.clear();
        notifyListeners();
      },
    );
    _connectivityManager.registerNetworkCallback(
      NetworkRequest(transportTypes: [NetworkCapabilities$Transport.wifi]),
      _wifiCallback,
    );
    _connectivityManager.registerNetworkCallback(
      NetworkRequest(transportTypes: [NetworkCapabilities$Transport.ethernet]),
      _ethernetCallback,
    );
  }

  @override
  void dispose() {
    _connectivityManager.unregisterNetworkCallback(_wifiCallback);
    _connectivityManager.unregisterNetworkCallback(_ethernetCallback);
    super.dispose();
  }
}

extension on LinkProperties {
  NetworkModel? getNetworkModel() {
    final iface = interfaceName;
    if (iface == null) return null;
    final inetAddresses = getAddressModels();
    final inetAddress = inetAddresses.firstOrNull;
    final gateway = getGatewayModel();
    final dnsServers = getDnsServerModels();
    return NetworkModel(
      iface: iface,
      ipAddress: inetAddress?.$1,
      netmask: inetAddress?.$2,
      gateway: gateway,
      dnsServers: dnsServers,
    );
  }

  List<(String, String)> getAddressModels() {
    return linkAddresses
        .map((e) {
          final inetAddress = e.address;
          if (inetAddress is! Inet4Address) return null;
          final ipAddress = inetAddress.hostAddress;
          if (ipAddress == null) return null;
          final prefixLength = e.prefixLength;
          final netmaskInt = NetworkUtil.prefixLengthToNetmaskInt(prefixLength);
          final netmask = NetworkUtil.intToInetAddress(netmaskInt).hostAddress;
          return (ipAddress, netmask);
        })
        .whereType<(String, String)>()
        .toList();
  }

  String? getGatewayModel() {
    return routes
        .map((e) {
          final isDefault = e.isDefaultRoute;
          if (isDefault) {
            final inetGateway = e.gateway;
            if (inetGateway is! Inet4Address) return null;
            final gateway = inetGateway.hostAddress;
            return gateway;
          } else {
            return null;
          }
        })
        .whereType<String>()
        .toList()
        .firstOrNull;
  }

  List<String> getDnsServerModels() {
    return dnsServers
        .map((e) => e is Inet4Address ? e.hostAddress : null)
        .whereType<String>()
        .toList();
  }
}
