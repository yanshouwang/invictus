import 'package:invictus_android/src/impl.dart';
import 'package:invictus_android/src/jni.dart' as jni;
import 'package:invictus_api/invictus_api.dart';

final class UsbAccessoryImpl extends InvictusObjectImpl
    implements UsbAccessory {
  @override
  final jni.UsbAccessory api;

  UsbAccessoryImpl.internal(this.api);
}

extension Invictus$UsbAccessoryX on UsbAccessory {
  jni.UsbAccessory get api {
    final impl = this;
    if (impl is! UsbAccessoryImpl) throw TypeError();
    return impl.api;
  }
}

extension Invictus$JUsbAccessoryX on jni.UsbAccessory {
  UsbAccessory get impl => UsbAccessoryImpl.internal(this);
}
