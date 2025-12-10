import 'package:invictus_android/src/api.dart';
import 'package:invictus_android/src/jni.dart' as jni;

final class SocketImpl implements Socket {
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
