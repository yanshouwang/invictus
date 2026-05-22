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

  ProxyInfo? get httpProxy;
  set httpProxy(ProxyInfo? value);

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

  IpConfiguration get ipConfiguration;
  set ipConfiguration(IpConfiguration? value);

  StaticIpConfiguration? get staticIpConfiguration;
  set staticIpConfiguration(StaticIpConfiguration? value);

  IpConfiguration$IpAssignment get ipAssignment;
  set ipAssignment(IpConfiguration$IpAssignment value);

  // IpConfiguration$ProxySettings get proxySettings;
  // set proxySettings(IpConfiguration$ProxySettings value);

  // void setProxy(ProxySettings settings, ProxyInfo proxyInfo);
}

abstract interface class WifiConfiguration$KeyMgmt {
  // static int get dpp => WifiConfiguration$KeyMgmtChannel.instance..dpp;
  // static int get filsSha256 => WifiConfiguration$KeyMgmtChannel.instance.filsSha256;
  // static int get filsSha384 => WifiConfiguration$KeyMgmtChannel.instance.filsSha384;
  // static int get ftEap => WifiConfiguration$KeyMgmtChannel.instance.ftEap;
  // static int get ftPsk => WifiConfiguration$KeyMgmtChannel.instance.ftPsk;
  static int get ieee8021x =>
      WifiConfiguration$KeyMgmtChannel.instance.ieee8021x;
  static int get none => WifiConfiguration$KeyMgmtChannel.instance.none;
  // static int get osen => WifiConfiguration$KeyMgmtChannel.instance.osen;
  // static int get owe => WifiConfiguration$KeyMgmtChannel.instance.owe;
  // static int get sae => WifiConfiguration$KeyMgmtChannel.instance.sae;
  // static int get suiteB192 => WifiConfiguration$KeyMgmtChannel.instance.suiteB192;
  // static int get wapiCert => WifiConfiguration$KeyMgmtChannel.instance.wapiCert;
  // static int get wapiPsk => WifiConfiguration$KeyMgmtChannel.instance.wapiPsk;
  // static int get wpa2Psk => WifiConfiguration$KeyMgmtChannel.instance.wpa2Psk;
  static int get wpaEap => WifiConfiguration$KeyMgmtChannel.instance.wpaEap;
  // static int get wpaEapSha256 => WifiConfiguration$KeyMgmtChannel.instance.wpaEapSha256;
  static int get wpaPsk => WifiConfiguration$KeyMgmtChannel.instance.wpaPsk;
  // static int get wpaPskSha256 => WifiConfiguration$KeyMgmtChannel.instance.wpaPskSha256;
  static String get varName =>
      WifiConfiguration$KeyMgmtChannel.instance.varName;
  static List<String> get strings =>
      WifiConfiguration$KeyMgmtChannel.instance.strings;
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

abstract base class WifiConfiguration$KeyMgmtChannel extends PlatformInterface {
  /// Constructs a [WifiConfiguration$KeyMgmtChannel].
  WifiConfiguration$KeyMgmtChannel() : super(token: _token);

  static final Object _token = Object();

  static WifiConfiguration$KeyMgmtChannel? _instance;

  /// The default instance of [WifiConfiguration$KeyMgmtChannel] to use.
  static WifiConfiguration$KeyMgmtChannel get instance =>
      ArgumentError.checkNotNull(_instance, 'instance');

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [WifiConfiguration$KeyMgmtChannel] when
  /// they register themselves.
  static set instance(WifiConfiguration$KeyMgmtChannel instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  // int get dpp;
  // int get filsSha256;
  // int get filsSha384;
  // int get ftEap;
  // int get ftPsk;
  int get ieee8021x;
  int get none;
  // int get osen;
  // int get owe;
  // int get sae;
  // int get suiteB192;
  // int get wapiCert;
  // int get wapiPsk;
  // int get wpa2Psk;
  int get wpaEap;
  // int get wpaEapSha256;
  int get wpaPsk;
  // int get wpaPskSha256;
  String get varName;
  List<String> get strings;
}
