import 'package:invictus_android/src/impl.dart';
import 'package:invictus_android/src/jni.dart' as jni;
import 'package:invictus_api/invictus_api.dart';

final class UsbAccessoryImpl extends ObjectImpl implements UsbAccessory {
  @override
  final jni.UsbAccessory api;

  UsbAccessoryImpl.internal(this.api);

  @override
  String? get description => api.description?.impl;

  @override
  String get manufacturer => api.manufacturer.impl;

  @override
  String get model => api.model.impl;

  @override
  String? get serial => api.serial?.impl;

  @override
  String? get uri => api.uri?.impl;

  @override
  String? get version => api.version?.impl;
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
