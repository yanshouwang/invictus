import 'package:clover/clover.dart';
import 'package:invictus/invictus.dart';
import 'package:invictus_example/models.dart';
import 'package:logging/logging.dart';
import 'package:permission_handler/permission_handler.dart';

Logger get _logger => Logger('ConnectivityViewModel');

class ConnectivityViewModel extends ViewModel {
  final ConnectivityManager _connectivityManager;

  final Map<Network, String> _ssids;
  final Map<Network, NetworkStatus> _wifiStatuses;
  final Map<Network, NetworkStatus> _ethernetStatuses;
  late final ConnectivityManager$NetworkCallback _wifiCallback;
  late final ConnectivityManager$NetworkCallback _ethernetCallback;

  Map<String, NetworkStatus> get statuses => {
    ...wifiStatuses,
    ...ethernetStatuses,
  };

  Map<String, WifiStatus> get wifiStatuses => Map.fromIterable(
    _wifiStatuses.entries,
    key: (e) {
      final entry = e as MapEntry<Network, NetworkStatus>;
      return entry.value.iface;
    },
    value: (e) {
      final entry = e as MapEntry<Network, NetworkStatus>;
      final ssid = _ssids[entry.key];
      final status = entry.value;
      return WifiStatus(
        iface: status.iface,
        ssid: ssid,
        linkAddress: status.linkAddress,
        gateway: status.gateway,
        dnsServers: status.dnsServers,
        domains: status.domains,
      );
    },
  );

  Map<String, NetworkStatus> get ethernetStatuses => Map.fromIterable(
    _ethernetStatuses.entries,
    key: (e) {
      final entry = e as MapEntry<Network, NetworkStatus>;
      return entry.value.iface;
    },
    value: (e) {
      final entry = e as MapEntry<Network, NetworkStatus>;
      final status = entry.value;
      return status;
    },
  );

  ConnectivityViewModel()
    : _connectivityManager = ConnectivityManager(),
      _ssids = {},
      _wifiStatuses = {},
      _ethernetStatuses = {} {
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
          _logger.warning('info is $info');
          return;
        }
        final ssid = info.ssid.replaceAll('"', '');
        _ssids[network] = ssid;
        notifyListeners();
      },
      onLinkPropertiesChanged: (network, linkProperties) {
        _logger.info('wifi onLinkPropertiesChanged');
        final status = linkProperties.networkStatus;
        if (status == null) {
          _logger.warning('status is null');
          return;
        }
        _wifiStatuses[network] = status;
        notifyListeners();
      },
      onBlockedStatusChanged: (network, blocked) {
        _logger.fine('wifi onBlockedStatusChanged, $blocked');
      },
      onLosing: (network, maxMsToLive) {
        _logger.info('wifi onLosing');
      },
      onLost: (network) {
        _logger.info('wifi onLost');
        _ssids.remove(network);
        _wifiStatuses.remove(network);
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
        final status = linkProperties.networkStatus;
        if (status == null) {
          _logger.warning('status is null');
          return;
        }
        _ethernetStatuses[network] = status;
        notifyListeners();
      },
      onBlockedStatusChanged: (network, blocked) {
        _logger.fine('ethernet onBlockedStatusChanged, $blocked');
      },
      onLosing: (network, maxMsToLive) {
        _logger.info('ethernet onLosing');
      },
      onLost: (network) async {
        _logger.info('ethernet onLost');
        _ethernetStatuses.remove(network);
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
