import 'package:invictus_android/src/impl.dart';
import 'package:invictus_android/src/jni.dart' as jni;
import 'package:invictus_api/invictus_api.dart';

final class NetworkInterfaceImpl extends InvictusObjectImpl
    implements NetworkInterface {
  @override
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
