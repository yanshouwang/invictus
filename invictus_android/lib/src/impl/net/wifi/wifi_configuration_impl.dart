import 'package:invictus_android/src/impl.dart';
import 'package:invictus_android/src/jni.dart' as jni;
import 'package:invictus_api/invictus_api.dart';

final class WifiConfigurationImpl extends ObjectImpl
    implements WifiConfiguration {
  @override
  final jni.WifiConfiguration api;

  WifiConfigurationImpl.internal(this.api);

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
  String get ssid => ArgumentError.checkNotNull(api.SSID, 'ssidApi').impl;
  @override
  set ssid(String value) => api.SSID = value.api;

  @override
  WifiConfiguration$Status get status =>
      api.status.wifiConfiguration$StatusImpl;
  @override
  set status(WifiConfiguration$Status value) => api.status = value.api;

  @override
  BitSet allowedAuthAlgorithms;

  @override
  BitSet allowedGroupCiphers;

  @override
  BitSet allowedKeyManagement;

  @override
  BitSet allowedPairwiseCiphers;

  @override
  BitSet allowedProtocols;

  @override
  WifiEnterpriseConfig enterpriseConfig;

  @override
  bool isPasspoint;

  @override
  String preSharedKey;

  @override
  int priority;

  @override
  String providerFriendlyName;

  @override
  List<int> roamingConsortiumIds;

  @override
  List<String> wepKeys;

  @override
  int wepTxKeyIndex;
}

final class WifiConfigurationChannelImpl extends WifiConfigurationChannel {
  @override
  WifiConfiguration create() {
    final api = jni.WifiConfiguration();
    return WifiConfigurationImpl.internal(api);
  }
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
