import 'dart:typed_data';

import 'package:invictus_android/src/impl.dart';
import 'package:invictus_android/src/jni.dart' as jni;
import 'package:invictus_api/invictus_api.dart';

final class UsbRequestImpl extends ObjectImpl implements UsbRequest {
  @override
  final jni.UsbRequest api;

  UsbRequestImpl.internal(this.api);

  @override
  UsbEndpoint? get endpoint => api.getEndpoint()?.impl;

  @override
  bool cancel() => api.cancel();

  @override
  void close() => api.cancel();

  @override
  bool initialize(UsbDeviceConnection connection, UsbEndpoint endpoint) =>
      api.initialize(connection.api, endpoint.api);

  @override
  bool queue(Uint8List? buffer, [int? length]) => length == null
      ? api.queue(buffer?.byteBufferApi)
      : api.queue$1(buffer?.byteBufferApi, length);
}

final class UsbRequestChannelImpl extends UsbRequestChannel {
  @override
  UsbRequest create() {
    final api = jni.UsbRequest();
    return UsbRequestImpl.internal(api);
  }
}

extension Invictus$JUsbRequestX on jni.UsbRequest {
  UsbRequest get impl => UsbRequestImpl.internal(this);
}
