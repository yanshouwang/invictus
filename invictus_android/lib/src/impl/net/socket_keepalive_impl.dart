import 'package:invictus_android/src/api.dart';
import 'package:invictus_android/src/jni.dart' as jni;

final class SocketKeepalive$CallbackImpl implements SocketKeepalive$Callback {
  jni.SocketKeepalive$Callback api;

  SocketKeepalive$CallbackImpl.internal(this.api);
}

final class SocketKeepaliveImpl implements SocketKeepalive {
  final jni.SocketKeepalive api;

  SocketKeepaliveImpl.internal(this.api);
}

extension Invictus$SocketKeepalive$CallbackX on SocketKeepalive$Callback {
  jni.SocketKeepalive$Callback get api {
    final impl = this;
    if (impl is! SocketKeepalive$CallbackImpl) throw TypeError();
    return impl.api;
  }
}

extension Invictus$JSocketKeepaliveX on jni.SocketKeepalive {
  SocketKeepalive get impl => SocketKeepaliveImpl.internal(this);
}
