import 'package:invictus_android/src/impl.dart';
import 'package:invictus_android/src/jni.dart' as jni;
import 'package:invictus_api/invictus_api.dart';

final class UsbInterfaceImpl extends InvictusObjectImpl
    implements UsbInterface {
  @override
  final jni.UsbInterface api;

  UsbInterfaceImpl.internal(this.api);
}

extension Invictus$JUsbInterfaceX on jni.UsbInterface {
  UsbInterface get impl => UsbInterfaceImpl.internal(this);
}
