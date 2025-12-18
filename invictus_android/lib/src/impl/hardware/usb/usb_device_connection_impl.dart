import 'dart:typed_data';

import 'package:invictus_android/src/impl.dart';
import 'package:invictus_android/src/jni.dart' as jni;
import 'package:invictus_api/invictus_api.dart';

final class UsbDeviceConnectionImpl extends ObjectImpl
    implements UsbDeviceConnection {
  @override
  final jni.UsbDeviceConnection api;

  UsbDeviceConnectionImpl.internal(this.api);

  @override
  int get fileDescriptor => api.getFileDescriptor();

  @override
  Uint8List get rawDescriptors {
    final rawDescriptorsApiOrNull = api.getRawDescriptors();
    final rawDescriptorsApi = ArgumentError.checkNotNull(
      rawDescriptorsApiOrNull,
      'rawDescriptorsApi',
    );
    return rawDescriptorsApi.impl;
  }

  @override
  String? get serial => api.getSerial()?.impl;

  @override
  int bulkTransfer({
    required UsbEndpoint endpoint,
    required Uint8List buffer,
    int? offset,
    required int length,
    required int timeout,
  }) => offset == null
      ? api.bulkTransfer(endpoint.api, buffer.byteArrayApi, length, timeout)
      : api.bulkTransfer$1(
          endpoint.api,
          buffer.byteArrayApi,
          offset,
          length,
          timeout,
        );

  @override
  bool claimInterface(UsbInterface intf, bool force) =>
      api.claimInterface(intf.api, force);

  @override
  void close() => api.close();

  @override
  int controlTransfer({
    required int requestType,
    required int request,
    required int value,
    required int index,
    required Uint8List? buffer,
    int? offset,
    required int length,
    required int timeout,
  }) => offset == null
      ? api.controlTransfer(
          requestType,
          request,
          value,
          index,
          buffer?.byteArrayApi,
          length,
          timeout,
        )
      : api.controlTransfer$1(
          requestType,
          request,
          value,
          index,
          buffer?.byteArrayApi,
          offset,
          length,
          timeout,
        );

  @override
  bool releaseInterface(UsbInterface intf) => api.releaseInterface(intf.api);

  @override
  UsbRequest requestWait([int? timeout]) {
    final requestApiOrNull = timeout == null
        ? api.requestWait()
        : api.requestWait$1(timeout);
    final requestApi = ArgumentError.checkNotNull(
      requestApiOrNull,
      'requestApi',
    );
    return requestApi.impl;
  }

  @override
  bool setConfiguration(UsbConfiguration configuration) =>
      api.setConfiguration(configuration.api);

  @override
  bool setInterface(UsbInterface intf) => api.setInterface(intf.api);
}

extension Invictus$UsbDeviceConnectionX on UsbDeviceConnection {
  jni.UsbDeviceConnection get api {
    final impl = this;
    if (impl is! UsbDeviceConnectionImpl) throw TypeError();
    return impl.api;
  }
}

extension Invictus$JUsbDeviceConnectionX on jni.UsbDeviceConnection {
  UsbDeviceConnection get impl => UsbDeviceConnectionImpl.internal(this);
}
