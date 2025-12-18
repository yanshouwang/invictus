import 'package:invictus_android/src/impl.dart';
import 'package:invictus_android/src/jni.dart' as jni;
import 'package:invictus_api/invictus_api.dart';

final class SocketKeepalive$CallbackImpl extends ObjectImpl
    implements SocketKeepalive$Callback {
  @override
  jni.SocketKeepalive$Callback api;

  SocketKeepalive$CallbackImpl.internal(this.api);
}

final class SocketKeepaliveImpl extends ObjectImpl implements SocketKeepalive {
  @override
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
