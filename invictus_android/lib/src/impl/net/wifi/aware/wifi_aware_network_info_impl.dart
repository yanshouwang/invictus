import 'package:invictus_android/src/api.dart';
import 'package:invictus_android/src/impl.dart';
import 'package:invictus_android/src/jni.dart' as jni;

final class WifiAwareNetworkInfoImpl extends TransportInfoImpl
    implements WifiAwareNetworkInfo {
  @override
  final jni.WifiAwareNetworkInfo api;

  WifiAwareNetworkInfoImpl.internal(this.api);
}
