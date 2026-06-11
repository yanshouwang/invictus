import 'package:invictus_android/src/impl.dart';
import 'package:invictus_android/src/jni.dart' as jni;
import 'package:invictus_api/invictus_api.dart';

final class OnObbStateChangeListenerImpl extends ObjectImpl
    implements OnObbStateChangeListener {
  @override
  final jni.OnObbStateChangeListener api;

  OnObbStateChangeListenerImpl.internal(this.api);
}

final class OnObbStateChangeListenerChannelImpl
    extends OnObbStateChangeListenerChannel {
  @override
  OnObbStateChangeListener createOnObbStateChangeListener({
    required void Function(String path, OnObbStateChangeListener$State state)
    onObbStateChange,
  }) {
    final api = jni.JniOnObbStateChangeListenerImpl(
      jni.JniOnObbStateChangeListener.implement(
        jni.$JniOnObbStateChangeListener(
          onObbStateChange: (path, state) => onObbStateChange(
            path.impl,
            state.onObbStateChangeListener$StateImpl,
          ),
        ),
      ),
    );
    return OnObbStateChangeListenerImpl.internal(api);
  }
}

extension Invictus$OnObbStateChangeListenerX on OnObbStateChangeListener {
  jni.OnObbStateChangeListener get api {
    final impl = this;
    if (impl is! OnObbStateChangeListenerImpl) throw TypeError();
    return impl.api;
  }
}

extension Invictus$JOnObbStateChangeListener$intX on int {
  OnObbStateChangeListener$State get onObbStateChangeListener$StateImpl {
    switch (this) {
      case jni.OnObbStateChangeListener.MOUNTED:
        return .mounted;
      case jni.OnObbStateChangeListener.UNMOUNTED:
        return .unmounted;
      case jni.OnObbStateChangeListener.ERROR_INTERNAL:
        return .internal;
      case jni.OnObbStateChangeListener.ERROR_COULD_NOT_MOUNT:
        return .couldNotMount;
      case jni.OnObbStateChangeListener.ERROR_COULD_NOT_UNMOUNT:
        return .couldNotUnmount;
      case jni.OnObbStateChangeListener.ERROR_NOT_MOUNTED:
        return .notMounted;
      case jni.OnObbStateChangeListener.ERROR_ALREADY_MOUNTED:
        return .alreadyMounted;
      default:
        throw ArgumentError.value(this, 'onObbStateChangeListener\$State');
    }
  }
}
