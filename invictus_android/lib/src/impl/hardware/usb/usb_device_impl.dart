import 'package:invictus_android/src/impl.dart';
import 'package:invictus_android/src/jni.dart' as jni;
import 'package:invictus_api/invictus_api.dart';

final class UsbDeviceImpl extends ObjectImpl implements UsbDevice {
  @override
  final jni.UsbDevice api;

  UsbDeviceImpl.internal(this.api);

  @override
  int get configurationCount => api.configurationCount;

  @override
  int get deviceClass => api.deviceClass;

  @override
  int get deviceId => api.deviceId;

  @override
  String get deviceName => api.deviceName.impl;

  @override
  int get deviceProtocol => api.deviceProtocol;

  @override
  int get deviceSubclass => api.deviceSubclass;

  @override
  int get interfaceCount => api.interfaceCount;

  @override
  String? get manufacturerName => api.manufacturerName?.impl;

  @override
  int get productId => api.productId;

  @override
  String? get productName => api.productName?.impl;

  @override
  String? get serialNumber => api.serialNumber?.impl;

  @override
  int get vendorId => api.vendorId;

  @override
  String get version => api.version.impl;

  @override
  UsbConfiguration getConfiguration(int index) =>
      api.getConfiguration(index).impl;

  @override
  UsbInterface getInterface(int index) => api.getInterface(index).impl;
}

final class UsbDeviceChannelImpl extends UsbDeviceChannel {
  @override
  int getDeviceId(String name) => jni.UsbDevice.getDeviceId(name.api);

  @override
  String getDeviceName(int id) {
    final deviceNameApiOrNull = jni.UsbDevice.getDeviceName(id);
    final deviceNameApi = ArgumentError.checkNotNull(
      deviceNameApiOrNull,
      'deviceNameApi',
    );
    return deviceNameApi.impl;
  }
}

extension Invictus$UsbDeviceX on UsbDevice {
  jni.UsbDevice get api {
    final impl = this;
    if (impl is! UsbDeviceImpl) throw TypeError();
    return impl.api;
  }
}

extension Invictus$JUsbDeviceX on jni.UsbDevice {
  UsbDevice get impl => UsbDeviceImpl.internal(this);
}
