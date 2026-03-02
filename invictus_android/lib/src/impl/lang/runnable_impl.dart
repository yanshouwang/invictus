import 'package:invictus_android/src/impl.dart';
import 'package:invictus_android/src/jni.dart' as jni;
import 'package:invictus_api/invictus_api.dart';

final class RunnableImpl extends ObjectImpl implements Runnable {
  @override
  final jni.Runnable api;

  RunnableImpl.internal(this.api);
}

final class RunnableChannelImpl extends RunnableChannel {
  @override
  Runnable create({required void Function() run}) {
    final api = jni.Runnable.implement(jni.$Runnable(run: run));
    return RunnableImpl.internal(api);
  }
}

extension Invictus$RunnableX on Runnable {
  jni.Runnable get api {
    final impl = this;
    if (impl is! RunnableImpl) throw TypeError();
    return impl.api;
  }
}
