import 'package:invictus_android/src/impl.dart';
import 'package:invictus_android/src/jni.dart' as jni;
import 'package:invictus_api/invictus_api.dart';

final class SocketImpl extends InvictusObjectImpl implements Socket {
  @override
  final jni.Socket api;

  SocketImpl.internal(this.api);
}

extension Invictus$SocketX on Socket {
  jni.Socket get api {
    final impl = this;
    if (impl is! SocketImpl) throw TypeError();
    return impl.api;
  }
}
