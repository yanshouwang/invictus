import 'package:invictus_api/src/net.dart';
import 'package:invictus_api/src/util.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

enum WifiConfiguration$Status {
  current, // 0
  disabled, // 1
  enabled, // 2
}

abstract interface class WifiConfiguration {
  factory WifiConfiguration() => WifiConfigurationChannel.instance.create();

  // ProxyInfo get httpProxy;
  // set httpProxy(ProxyInfo value);

  // String get key;

  // int get macRandomizationSetting;
  // set macRandomizationSetting(int value);

  // MacAddress get randomizedMacAddress;

  // bool get isAllowedToUpdateByOtherUsers;
  // set isAllowedToUpdateByOtherUsers(bool value);

  // bool get isDppConfigurator;
  bool get isPasspoint;
  // void setIpConfiguration(IpConfiguration ipConfiguration);
  // void setSecurityParams(int securityType);

  String get bssid;
  set bssid(String value);
  String get fqdn;
  set fqdn(String value);
  String get ssid;
  set ssid(String value);
  // bool get allowAutojoin;
  // set allowAutojoin(bool value);
  BitSet get allowedAuthAlgorithms;
  set allowedAuthAlgorithms(BitSet value);
  BitSet get allowedGroupCiphers;
  set allowedGroupCiphers(BitSet value);
  // BitSet get allowedGroupManagementCiphers;
  // set allowedGroupManagementCiphers(BitSet value);
  BitSet get allowedKeyManagement;
  set allowedKeyManagement(BitSet value);
  BitSet get allowedPairwiseCiphers;
  set allowedPairwiseCiphers(BitSet value);
  BitSet get allowedProtocols;
  set allowedProtocols(BitSet value);
  // BitSet get allowedSuiteBCiphers;
  // set allowedSuiteBCiphers(BitSet value);
  WifiEnterpriseConfig get enterpriseConfig;
  set enterpriseConfig(WifiEnterpriseConfig value);
  bool get hiddenSSID;
  set hiddenSSID(bool value);
  // bool get isHomeProviderNetwork;
  // set isHomeProviderNetwork(bool value);
  int get networkId;
  set networkId(int value);
  String get preSharedKey;
  set preSharedKey(String value);
  @Deprecated('This field does not exist anymore.')
  int get priority;
  set priority(int value);
  String get providerFriendlyName;
  set providerFriendlyName(String value);
  List<int> get roamingConsortiumIds;
  set roamingConsortiumIds(List<int> value);
  // bool get shared;
  // set shared(bool value);
  WifiConfiguration$Status get status;
  set status(WifiConfiguration$Status value);
  @Deprecated(
    'Due to security and performance limitations, use of WEP networks is discouraged.',
  )
  List<String> get wepKeys;
  set wepKeys(List<String> value);
  @Deprecated(
    'Due to security and performance limitations, use of WEP networks is discouraged.',
  )
  int get wepTxKeyIndex;
  set wepTxKeyIndex(int value);
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
