import 'package:invictus_android/src/impl.dart';
import 'package:invictus_android/src/jni.dart' as jni;
import 'package:invictus_api/invictus_api.dart';

final class WifiConfigurationImpl extends ObjectImpl
    implements WifiConfiguration {
  @override
  final jni.WifiConfiguration api;
  final jni.InvictusWifiConfiguration invictusApi;

  WifiConfigurationImpl.internal(this.api)
    : invictusApi = jni.InvictusWifiConfiguration(api);

  @override
  String get bssid => ArgumentError.checkNotNull(api.BSSID, 'bssidApi').impl;
  @override
  set bssid(String value) => api.BSSID = value.api;

  @override
  String get fqdn => ArgumentError.checkNotNull(api.FQDN, 'fqdnApi').impl;
  @override
  set fqdn(String value) => api.FQDN = value.api;

  @override
  bool get hiddenSSID => api.hiddenSSID;
  @override
  set hiddenSSID(bool value) => api.hiddenSSID = value;

  @override
  int get networkId => api.networkId;
  @override
  set networkId(int value) => api.networkId = value;

  @override
  String get ssid => ArgumentError.checkNotNull(api.SSID, 'ssidApi').impl;
  @override
  set ssid(String value) => api.SSID = value.api;

  @override
  WifiConfiguration$Status get status =>
      api.status.wifiConfiguration$StatusImpl;
  @override
  set status(WifiConfiguration$Status value) => api.status = value.api;

  @override
  BitSet get allowedAuthAlgorithms => api.allowedAuthAlgorithms.impl;
  @override
  set allowedAuthAlgorithms(BitSet value) =>
      api.allowedAuthAlgorithms = value.api;

  @override
  BitSet get allowedGroupCiphers => api.allowedGroupCiphers.impl;
  @override
  set allowedGroupCiphers(BitSet value) => api.allowedGroupCiphers = value.api;

  @override
  BitSet get allowedKeyManagement => api.allowedKeyManagement.impl;
  @override
  set allowedKeyManagement(BitSet value) =>
      api.allowedKeyManagement = value.api;

  @override
  BitSet get allowedPairwiseCiphers => api.allowedPairwiseCiphers.impl;
  @override
  set allowedPairwiseCiphers(BitSet value) =>
      api.allowedPairwiseCiphers = value.api;

  @override
  BitSet get allowedProtocols => api.allowedProtocols.impl;
  @override
  set allowedProtocols(BitSet value) => api.allowedProtocols = value.api;

  @override
  WifiEnterpriseConfig get enterpriseConfig =>
      ArgumentError.checkNotNull(api.enterpriseConfig, 'enterpriseConfig').impl;
  @override
  set enterpriseConfig(WifiEnterpriseConfig value) =>
      api.enterpriseConfig = value.api;

  @override
  bool get isPasspoint => api.isPasspoint;

  @override
  String get preSharedKey =>
      ArgumentError.checkNotNull(api.preSharedKey, 'preSharedKey').impl;
  @override
  set preSharedKey(String value) => api.preSharedKey = value.api;

  @override
  int get priority => api.priority;
  @override
  set priority(int value) => api.priority = value;

  @override
  String get providerFriendlyName => ArgumentError.checkNotNull(
    api.providerFriendlyName,
    'providerFriendlyName',
  ).impl;
  @override
  set providerFriendlyName(String value) =>
      api.providerFriendlyName = value.api;

  @override
  List<int> get roamingConsortiumIds => ArgumentError.checkNotNull(
    api.roamingConsortiumIds,
    'roamingConsortiumIds',
  ).asDart();
  @override
  set roamingConsortiumIds(List<int> value) =>
      api.roamingConsortiumIds = value.longArrayApi;

  @override
  List<String> get wepKeys => ArgumentError.checkNotNull(
    api.wepKeys,
    'wepKeys',
  ).asDart().nonNulls.map((e) => e.impl).toList();
  @override
  set wepKeys(List<String> value) => api.wepKeys = value.api;

  @override
  int get wepTxKeyIndex => api.wepTxKeyIndex;
  @override
  set wepTxKeyIndex(int value) => api.wepTxKeyIndex = value;

  @override
  ProxyInfo? get httpProxy => api.httpProxy?.impl;
  @override
  set httpProxy(ProxyInfo? value) => api.httpProxy = value?.api;

  @override
  IpConfiguration$IpAssignment get ipAssignment =>
      invictusApi.ipAssignment.impl;
  @override
  set ipAssignment(IpConfiguration$IpAssignment value) =>
      invictusApi.ipAssignment = value.api;

  @override
  IpConfiguration get ipConfiguration => invictusApi.ipConfiguration.impl;
  @override
  set ipConfiguration(IpConfiguration? value) =>
      invictusApi.ipConfiguration = value?.api;

  @override
  StaticIpConfiguration? get staticIpConfiguration =>
      invictusApi.staticIpConfiguration?.impl;
  @override
  set staticIpConfiguration(StaticIpConfiguration? value) =>
      invictusApi.staticIpConfiguration = value?.api;
}

final class WifiConfigurationChannelImpl extends WifiConfigurationChannel {
  @override
  WifiConfiguration create() {
    final api = jni.WifiConfiguration();
    return WifiConfigurationImpl.internal(api);
  }
}

final class WifiConfiguration$KeyMgmtChannelImpl
    extends WifiConfiguration$KeyMgmtChannel {
  @override
  int get ieee8021x => jni.WifiConfiguration$KeyMgmt.IEEE8021X;
  @override
  int get none => jni.WifiConfiguration$KeyMgmt.NONE;
  @override
  List<String> get strings => ArgumentError.checkNotNull(
    jni.WifiConfiguration$KeyMgmt.strings,
    'strings',
  ).asDart().nonNulls.map((e) => e.impl).toList();
  @override
  String get varName => ArgumentError.checkNotNull(
    jni.WifiConfiguration$KeyMgmt.varName,
    'varName',
  ).impl;
  @override
  int get wpaEap => jni.WifiConfiguration$KeyMgmt.WPA_EAP;
  @override
  int get wpaPsk => jni.WifiConfiguration$KeyMgmt.WPA_PSK;
}

extension Invictus$WifiConfiguration$StatusX on WifiConfiguration$Status {
  int get api {
    switch (this) {
      case .current:
        return jni.WifiConfiguration$Status.CURRENT;
      case .disabled:
        return jni.WifiConfiguration$Status.DISABLED;
      case .enabled:
        return jni.WifiConfiguration$Status.ENABLED;
    }
  }
}

extension Invictus$JWifiConfiguration$intX on int {
  WifiConfiguration$Status get wifiConfiguration$StatusImpl {
    switch (this) {
      case jni.WifiConfiguration$Status.CURRENT:
        return WifiConfiguration$Status.current;
      case jni.WifiConfiguration$Status.DISABLED:
        return WifiConfiguration$Status.disabled;
      case jni.WifiConfiguration$Status.ENABLED:
        return WifiConfiguration$Status.enabled;
      default:
        throw ArgumentError.value(this, 'wifiConfiguration\$Status');
    }
  }
}

extension Invictus$WifiConfigurationX on WifiConfiguration {
  jni.WifiConfiguration get api {
    final impl = this;
    if (impl is! WifiConfigurationImpl) throw TypeError();
    return impl.api;
  }
}

extension Invictus$JWifiConfigurationX on jni.WifiConfiguration {
  WifiConfiguration get impl => WifiConfigurationImpl.internal(this);
}
