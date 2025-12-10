import 'package:invictus_android/src/impl.dart';

enum WifiConfiguration$Status {
  current, // 0
  disabled, // 1
  enabled, // 2
}

abstract interface class WifiConfiguration {
  factory WifiConfiguration() => WifiConfigurationImpl();

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
