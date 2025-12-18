import 'package:invictus_android/src/impl.dart';
import 'package:invictus_android/src/jni.dart' as jni;
import 'package:invictus_api/invictus_api.dart';

final class UsbConfigurationImpl extends ObjectImpl
    implements UsbConfiguration {
  @override
  final jni.UsbConfiguration api;

  UsbConfigurationImpl.internal(this.api);

  @override
  int get id => api.getId();

  @override
  int get interfaceCount => api.getInterfaceCount();

  @override
  int get maxPower => api.getMaxPower();

  @override
  String? get name => api.getName()?.impl;

  @override
  bool get isRemoteWakeup => api.isRemoteWakeup();

  @override
  bool get isSelfPowered => api.isSelfPowered();

  @override
  UsbInterface getInterface(int index) => api.getInterface(index).impl;
}

extension Invictus$UsbConfigurationX on UsbConfiguration {
  jni.UsbConfiguration get api {
    final impl = this;
    if (impl is! UsbConfigurationImpl) throw TypeError();
    return impl.api;
  }
}

extension Invictus$JUsbConfigurationX on jni.UsbConfiguration {
  UsbConfiguration get impl => UsbConfigurationImpl.internal(this);
}
