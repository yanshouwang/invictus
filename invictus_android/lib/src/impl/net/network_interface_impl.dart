import 'package:invictus_android/src/api.dart';
import 'package:invictus_android/src/jni.dart' as jni;

final class NetworkInterfaceImpl implements NetworkInterface {
  final jni.NetworkInterface api;

  NetworkInterfaceImpl.internal(this.api);
}

extension Invictus$NetworkInterfaceX on NetworkInterface {
  jni.NetworkInterface get api {
    final impl = this;
    if (impl is! NetworkInterfaceImpl) throw TypeError();
    return impl.api;
  }
}
