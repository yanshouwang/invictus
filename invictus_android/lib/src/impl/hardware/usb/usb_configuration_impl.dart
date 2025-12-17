import 'package:invictus_android/src/impl.dart';
import 'package:invictus_android/src/jni.dart' as jni;
import 'package:invictus_api/invictus_api.dart';

final class UsbConfigurationImpl extends InvictusObjectImpl
    implements UsbConfiguration {
  @override
  final jni.UsbConfiguration api;

  UsbConfigurationImpl.internal(this.api);
}

extension Invictus$JUsbConfigurationX on jni.UsbConfiguration {
  UsbConfiguration get impl => UsbConfigurationImpl.internal(this);
}
