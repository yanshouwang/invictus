import 'package:invictus_api/src/hardware.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

abstract interface class UsbDevice {
  static int getDeviceId(String name) =>
      UsbDeviceChannel.instance.getDeviceId(name);

  static String getDeviceName(int id) =>
      UsbDeviceChannel.instance.getDeviceName(id);

  int get configurationCount;
  int get deviceClass;
  int get deviceId;
  String get deviceName;
  int get deviceProtocol;
  int get deviceSubclass;
  int get interfaceCount;
  String? get manufacturerName;
  int get productId;
  String? get productName;
  String? get serialNumber;
  int get vendorId;
  String get version;

  UsbConfiguration getConfiguration(int index);
  UsbInterface getInterface(int index);
}

abstract base class UsbDeviceChannel extends PlatformInterface {
  /// Constructs a [UsbDeviceChannel].
  UsbDeviceChannel() : super(token: _token);

  static final Object _token = Object();

  static UsbDeviceChannel? _instance;

  /// The default instance of [UsbDeviceChannel] to use.
  static UsbDeviceChannel get instance =>
      ArgumentError.checkNotNull(_instance, 'instance');

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [UsbDeviceChannel] when
  /// they register themselves.
  static set instance(UsbDeviceChannel instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  int getDeviceId(String name);
  String getDeviceName(int id);
}
