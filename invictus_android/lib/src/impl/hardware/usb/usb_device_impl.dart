import 'package:invictus_android/src/impl.dart';
import 'package:invictus_android/src/jni.dart' as jni;
import 'package:invictus_api/invictus_api.dart';

final class UsbDeviceImpl extends ObjectImpl implements UsbDevice {
  @override
  final jni.UsbDevice api;

  UsbDeviceImpl.internal(this.api);

  @override
  int get configurationCount => api.getConfigurationCount();

  @override
  int get deviceClass => api.getDeviceClass();

  @override
  int get deviceId => api.getDeviceId();

  @override
  String get deviceName => api.getDeviceName().impl;

  @override
  int get deviceProtocol => api.getDeviceProtocol();

  @override
  int get deviceSubclass => api.getDeviceSubclass();

  @override
  int get interfaceCount => api.getInterfaceCount();

  @override
  String? get manufacturerName => api.getManufacturerName()?.impl;

  @override
  int get productId => api.getProductId();

  @override
  String? get productName => api.getProductName()?.impl;

  @override
  String? get serialNumber => api.getSerialNumber()?.impl;

  @override
  int get vendorId => api.getVendorId();

  @override
  String get version => api.getVersion().impl;

  @override
  UsbConfiguration getConfiguration(int index) =>
      api.getConfiguration(index).impl;

  @override
  UsbInterface getInterface(int index) => api.getInterface(index).impl;
}

final class UsbDeviceChannelImpl extends UsbDeviceChannel {
  @override
  int getDeviceId(String name) => jni.UsbDevice.getDeviceId$1(name.api);

  @override
  String getDeviceName(int id) {
    final deviceNameApiOrNull = jni.UsbDevice.getDeviceName$1(id);
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
