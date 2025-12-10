import 'package:invictus_android/src/api.dart';
import 'package:invictus_android/src/jni.dart' as jni;

final class WifiConfigurationImpl implements WifiConfiguration {
  final jni.WifiConfiguration api;

  WifiConfigurationImpl.internal(this.api);

  factory WifiConfigurationImpl() {
    final api = jni.WifiConfiguration();
    return WifiConfigurationImpl.internal(api);
  }

  @override
  String get bssid {
    final bssidApiOrNull = api.BSSID;
    final bssidApi = ArgumentError.checkNotNull(bssidApiOrNull, 'bssidApi');
    return bssidApi.impl;
  }

  @override
  String get fqdn {
    final fqdnApiOrNull = api.FQDN;
    final fqdnApi = ArgumentError.checkNotNull(fqdnApiOrNull, 'fqdnApi');
    return fqdnApi.impl;
  }

  @override
  bool get hiddenSSID => api.hiddenSSID;

  @override
  int get networkId => api.networkId;

  @override
  String get ssid {
    final ssidApiOrNull = api.SSID;
    final ssidApi = ArgumentError.checkNotNull(ssidApiOrNull, 'ssidApi');
    return ssidApi.impl;
  }

  @override
  WifiConfiguration$Status get status =>
      api.status.wifiConfiguration$StatusImpl;
}

extension Invictus$JWifiConfiguration$intX on int {
  WifiConfiguration$Status get wifiConfiguration$StatusImpl {
    final api = this;
    switch (api) {
      case jni.WifiConfiguration$Status.CURRENT:
        return WifiConfiguration$Status.current;
      case jni.WifiConfiguration$Status.DISABLED:
        return WifiConfiguration$Status.disabled;
      case jni.WifiConfiguration$Status.ENABLED:
        return WifiConfiguration$Status.enabled;
      default:
        throw ArgumentError.value(api, 'api');
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
