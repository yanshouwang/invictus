import 'dart:typed_data';

import 'package:invictus_api/src/net.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

enum ConnectivityManager$Type {
  mobile,
  wifi,
  mobileMms,
  mobileSupl,
  mobileDun,
  mobileHipri,
  wimax,
  bluetooth,
  dummy,
  ethernet,
  vpn,
}

enum ConnectivityManager$RestrictBackgroundStatus {
  disabled,
  whitelisted,
  enabled,
}

abstract interface class ConnectivityManager$NetworkCallback {
  factory ConnectivityManager$NetworkCallback({
    bool includeLocationInfo = false,
    void Function(Network network)? onAvailable,
    void Function(Network network, bool blocked)? onBlockedStatusChanged,
    void Function(Network network, NetworkCapabilities networkCapabilities)?
    onCapabilitiesChanged,
    void Function(Network network, LinkProperties linkProperties)?
    onLinkPropertiesChanged,
    void Function(Network network, int maxMsToLive)? onLosing,
    void Function(Network network)? onLost,
    void Function(NetworkCapabilities networkCapabilities)? onReserved,
    void Function()? onUnavailable,
  }) => ConnectivityManagerChannel.instance.createNetworkCallback(
    includeLocationInfo: includeLocationInfo,
    onAvailable: onAvailable,
    onBlockedStatusChanged: onBlockedStatusChanged,
    onCapabilitiesChanged: onCapabilitiesChanged,
    onLinkPropertiesChanged: onLinkPropertiesChanged,
    onLosing: onLosing,
    onLost: onLost,
    onReserved: onReserved,
    onUnavailable: onUnavailable,
  );
}

abstract interface class ConnectivityManager$OnNetworkActiveListener {
  factory ConnectivityManager$OnNetworkActiveListener({
    required void Function() onNetworkActive,
  }) => ConnectivityManagerChannel.instance.createOnNetworkActiveListener(
    onNetworkActive: onNetworkActive,
  );
}

abstract interface class ConnectivityManager {
  static bool isNetworkTypeValid(ConnectivityManager$Type networkType) =>
      ConnectivityManagerChannel.instance.isNetworkTypeValid(networkType);
  static Network? getProcessDefaultNetwork() =>
      ConnectivityManagerChannel.instance.getProcessDefaultNetwork();
  static bool setProcessDefaultNetwork(Network? network) =>
      ConnectivityManagerChannel.instance.setProcessDefaultNetwork(network);

  factory ConnectivityManager() => ConnectivityManagerChannel.instance.create();

  Network? get activeNetwork;
  NetworkInfo? get activeNetworkInfo;
  List<NetworkInfo> get allNetworkInfo;
  List<Network> get allNetworks;
  bool get backgroundDataSetting;
  Network? get boundNetworkForProcess;
  ProxyInfo? get defaultProxy;
  int get networkPreference;
  set networkPreference(int preference);
  Uint8List? get networkWatchlistConfigHash;
  ConnectivityManager$RestrictBackgroundStatus get restrictBackgroundStatus;
  bool get isActiveNetworkMetered;
  bool get isDefaultNetworkActive;

  void addDefaultNetworkActiveListener(
    ConnectivityManager$OnNetworkActiveListener listener,
  );
  void removeDefaultNetworkActiveListener(
    ConnectivityManager$OnNetworkActiveListener listener,
  );

  void registerBestMatchingNetworkCallback(
    NetworkRequest request,
    ConnectivityManager$NetworkCallback networkCallback,
  );
  void registerDefaultNetworkCallback(
    ConnectivityManager$NetworkCallback networkCallback,
  );
  void registerNetworkCallback(
    NetworkRequest request,
    ConnectivityManager$NetworkCallback networkCallback,
  );
  void unregisterNetworkCallback(
    ConnectivityManager$NetworkCallback networkCallback,
  );

  bool bindProcessToNetwork(Network network);
  SocketKeepalive createSocketKeepalive(
    Network network,
    IpSecManager$UdpEncapsulationSocket socket,
    InetAddress source,
    InetAddress destination,
    SocketKeepalive$Callback callback,
  );
  int getConnectionOwnerUid(
    int protocol,
    InetSocketAddress local,
    InetSocketAddress remote,
  );
  LinkProperties? getLinkProperties(Network network);
  int getMultipathPreference(Network network);
  NetworkCapabilities? getNetworkCapabilities(Network network);
  NetworkInfo? getNetworkInfoOfType(ConnectivityManager$Type networkType);
  NetworkInfo? getNetworkInfoOfNetwork(Network network);
  void reportBadNetwork(Network network);
  void reportNetworkConnectivity(Network network, bool hasConnectivity);
  bool requestBandwidthUpdate(Network network);
  void requestNetwork(
    NetworkRequest request,
    ConnectivityManager$NetworkCallback networkCallback, [
    int? timeoutMs,
  ]);
  void reserveNetwork(
    NetworkRequest request,
    ConnectivityManager$NetworkCallback networkCallback,
  );
}

abstract base class ConnectivityManagerChannel extends PlatformInterface {
  /// Constructs a [ConnectivityManagerChannel].
  ConnectivityManagerChannel() : super(token: _token);

  static final Object _token = Object();

  static ConnectivityManagerChannel? _instance;

  /// The default instance of [ConnectivityManagerChannel] to use.
  static ConnectivityManagerChannel get instance =>
      ArgumentError.checkNotNull(_instance, 'instance');

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [ConnectivityManagerChannel] when
  /// they register themselves.
  static set instance(ConnectivityManagerChannel instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  bool isNetworkTypeValid(ConnectivityManager$Type networkType);
  Network? getProcessDefaultNetwork();
  bool setProcessDefaultNetwork(Network? network);

  ConnectivityManager create();
  ConnectivityManager$NetworkCallback createNetworkCallback({
    bool includeLocationInfo = false,
    void Function(Network network)? onAvailable,
    void Function(Network network, bool blocked)? onBlockedStatusChanged,
    void Function(Network network, NetworkCapabilities networkCapabilities)?
    onCapabilitiesChanged,
    void Function(Network network, LinkProperties linkProperties)?
    onLinkPropertiesChanged,
    void Function(Network network, int maxMsToLive)? onLosing,
    void Function(Network network)? onLost,
    void Function(NetworkCapabilities networkCapabilities)? onReserved,
    void Function()? onUnavailable,
  });
  ConnectivityManager$OnNetworkActiveListener createOnNetworkActiveListener({
    required void Function() onNetworkActive,
  });
}
