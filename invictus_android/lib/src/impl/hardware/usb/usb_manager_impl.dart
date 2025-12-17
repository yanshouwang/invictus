import 'package:invictus_android/src/impl.dart';
import 'package:invictus_android/src/jni.dart' as jni;
import 'package:invictus_api/invictus_api.dart';

final class UsbManagerImpl extends InvictusObjectImpl implements UsbManager {
  @override
  final jni.UsbManager api;

  UsbManagerImpl.internal(this.api);

  @override
  List<UsbAccessory> getAccessoryList() =>
      api.getAccessoryList()?.nonNulls.map((e) => e.impl).toList() ?? [];

  @override
  Map<String, UsbDevice> getDeviceList() {
    final devicesApiOrNull = api.getDeviceList();
    final devicesApi = ArgumentError.checkNotNull(
      devicesApiOrNull,
      'devicesApi',
    );
    return devicesApi
        .as(jni.JMap.type(jni.JString.type, jni.UsbDevice.type))
        .map((key, value) => MapEntry(key.impl, value.impl));
  }

  @override
  bool hasAccessoryPermission(UsbAccessory accessory) =>
      api.hasPermission(accessory.api);

  @override
  bool hasDevicePermission(UsbDevice device) => api.hasPermission$1(device.api);

  // @override
  // ParcelFileDescriptor openAccessory(UsbAccessory accessory);

  // @override
  // InputStream openAccessoryInputStream(UsbAccessory accessory);

  // @override
  // OutputStream openAccessoryOutputStream(UsbAccessory accessory);

  // @override
  // UsbDeviceConnection openDevice(UsbDevice device);

  // @override
  // void requestAccessoryPermission(UsbAccessory accessory, PendingIntent pi);

  // @override
  // void requestDevicePermission(UsbDevice device, PendingIntent pi);
}

final class UsbManagerChannelImpl extends UsbManagerChannel {
  @override
  UsbManager create() {
    final apiOrNull = jni.ContextCompat.getSystemService(
      jni.context,
      jni.UsbManager.type.jClass,
      T: jni.UsbManager.type,
    );
    final api = ArgumentError.checkNotNull(apiOrNull, 'api');
    return UsbManagerImpl.internal(api);
  }
}
