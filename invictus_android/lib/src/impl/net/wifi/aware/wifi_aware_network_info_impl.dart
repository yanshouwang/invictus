import 'package:invictus_android/src/jni.dart' as jni;
import 'package:invictus_android/src/impl.dart';
import 'package:invictus_api/invictus_api.dart';

final class WifiAwareNetworkInfoImpl extends TransportInfoImpl
    implements WifiAwareNetworkInfo {
  @override
  final jni.WifiAwareNetworkInfo api;

  WifiAwareNetworkInfoImpl.internal(this.api);
}
