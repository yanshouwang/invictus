import 'package:plugin_platform_interface/plugin_platform_interface.dart';

enum WifiConfiguration$Status {
  current, // 0
  disabled, // 1
  enabled, // 2
}

abstract interface class WifiConfiguration {
  factory WifiConfiguration() => WifiConfigurationChannel.instance.create();

  // ProxyInfo getHttpProxy();
  // String getKey();
  // int getMacRandomizationSetting();
  // MacAddress getRandomizedMacAddress();
  // bool isDppConfigurator();
  // bool isPasspoint();
  // void setHttpProxy(PorxyInfo httpProxy);
  // void setIpConfiguration(IpConfiguration ipConfiguration);
  // void setMacRandomizationSetting(int macRandomizationSetting);
  // void setSecurityParams(int securityType);

  String get bssid;
  String get fqdn;
  String get ssid;
  // BitSet get allowedAuthAlgorithms;
  // BitSet get allowedGroupCiphers;
  // BitSet get allowedGroupManagementCiphers;
  // BitSet get allowedKeyManagement;
  // BitSet get allowedPairwiseCiphers;
  // BitSet get allowedProtocols;
  // BitSet get allowedSuiteBCiphers;
  // WifiEnterpriseConfig get enterpriseConfig;
  bool get hiddenSSID;
  // bool get isHomeProviderNetwork;
  int get networkId;
  // String get preSharedKey;
  // int get priority;
  // String get providerFriendlyName;
  // List<int> get roamingConsortiumIds;
  WifiConfiguration$Status get status;
  // List<String> get wepKeys;
  // int get wepTxKeyIndex;
}

abstract base class WifiConfigurationChannel extends PlatformInterface {
  /// Constructs a [WifiConfigurationChannel].
  WifiConfigurationChannel() : super(token: _token);

  static final Object _token = Object();

  static WifiConfigurationChannel? _instance;

  /// The default instance of [WifiConfigurationChannel] to use.
  static WifiConfigurationChannel get instance =>
      ArgumentError.checkNotNull(_instance, 'instance');

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [WifiConfigurationChannel] when
  /// they register themselves.
  static set instance(WifiConfigurationChannel instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  WifiConfiguration create();
}
