import 'package:invictus_android/src/impl.dart';
import 'package:invictus_android/src/jni.dart' as jni;
import 'package:invictus_api/invictus_api.dart';

final class UsbDeviceConnectionImpl extends InvictusObjectImpl
    implements UsbDeviceConnection {
  @override
  final jni.UsbDeviceConnection api;

  UsbDeviceConnectionImpl.internal(this.api);
}
