import 'dart:typed_data';

import 'package:invictus_api/src/hardware.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

abstract interface class UsbRequest {
  factory UsbRequest() => UsbRequestChannel.instance.create();

  // Object get clientData;
  // set clientData(Object value);
  UsbEndpoint? get endpoint;

  bool cancel();
  void close();
  bool initialize(UsbDeviceConnection connection, UsbEndpoint endpoint);
  bool queue(Uint8List? buffer, [int? length]);
}

abstract base class UsbRequestChannel extends PlatformInterface {
  /// Constructs a [UsbRequestChannel].
  UsbRequestChannel() : super(token: _token);

  static final Object _token = Object();

  static UsbRequestChannel? _instance;

  /// The default instance of [UsbRequestChannel] to use.
  static UsbRequestChannel get instance =>
      ArgumentError.checkNotNull(_instance, 'instance');

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [UsbRequestChannel] when
  /// they register themselves.
  static set instance(UsbRequestChannel instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  UsbRequest create();
}
