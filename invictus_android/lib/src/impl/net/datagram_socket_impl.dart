import 'package:invictus_android/src/impl.dart';
import 'package:invictus_android/src/jni.dart' as jni;
import 'package:invictus_api/invictus_api.dart';

final class DatagramSocketImpl extends InvictusObjectImpl
    implements DatagramSocket {
  @override
  final jni.DatagramSocket api;

  DatagramSocketImpl.internal(this.api);
}

extension Invictus$DatagramSocketX on DatagramSocket {
  jni.DatagramSocket get api {
    final impl = this;
    if (impl is! DatagramSocketImpl) throw TypeError();
    return impl.api;
  }
}
