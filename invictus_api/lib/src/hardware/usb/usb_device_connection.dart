import 'dart:typed_data';

import 'package:invictus_api/src/hardware.dart';

abstract interface class UsbDeviceConnection {
  int get fileDescriptor;
  Uint8List get rawDescriptors;
  String? get serial;

  int bulkTransfer({
    required UsbEndpoint endpoint,
    required Uint8List buffer,
    int? offset,
    required int length,
    required int timeout,
  });
  bool claimInterface(UsbInterface intf, bool force);
  void close();
  int controlTransfer({
    required int requestType,
    required int request,
    required int value,
    required int index,
    required Uint8List? buffer,
    int? offset,
    required int length,
    required int timeout,
  });
  bool releaseInterface(UsbInterface intf);
  UsbRequest requestWait([int? timeout]);
  bool setConfiguration(UsbConfiguration configuration);
  bool setInterface(UsbInterface intf);
}

extension Invictus$UsbDeviceConnectionX on UsbDeviceConnection {
  set configuration(UsbConfiguration value) {
    final ok = setConfiguration(value);
    if (ok) return;
    throw StateError('setConfiguration failed');
  }

  set interface(UsbInterface value) {
    final ok = setInterface(value);
    if (ok) return;
    throw StateError('setInterface failed');
  }
}
