import 'package:invictus_android/src/api.dart';
import 'package:invictus_android/src/impl.dart';
import 'package:invictus_android/src/jni.dart' as jni;

abstract base class TransportInfoImpl implements TransportInfo {
  // jni.TransportInfo get api;
  jni.JObject get api;
}

extension Invictus$JTransportInfoX on jni.TransportInfo {
  TransportInfo get impl {
    final api = this;
    final isWifiInfo = api.isInstanceOf(jni.WifiInfo.type.jClass);
    if (isWifiInfo) {
      final wifiInoApi = api.as(jni.WifiInfo.type);
      return WifiInfoImpl.internal(wifiInoApi);
    }
    final isWifiAwareNetworkInfo = api.isInstanceOf(
      jni.WifiAwareNetworkInfo.type.jClass,
    );
    if (isWifiAwareNetworkInfo) {
      final wifiAwareNetworkInfoApi = api.as(jni.WifiAwareNetworkInfo.type);
      return WifiAwareNetworkInfoImpl.internal(wifiAwareNetworkInfoApi);
    }
    throw TypeError();
  }
}
