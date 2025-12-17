import 'package:invictus_api/invictus_api.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

abstract interface class UsbManager {
  factory UsbManager() => UsbManagerChannel.instance.create();

  List<UsbAccessory> getAccessoryList();
  Map<String, UsbDevice> getDeviceList();
  bool hasAccessoryPermission(UsbAccessory accessory);
  bool hasDevicePermission(UsbDevice device);
  // ParcelFileDescriptor openAccessory(UsbAccessory accessory);
  // InputStream openAccessoryInputStream(UsbAccessory accessory);
  // OutputStream openAccessoryOutputStream(UsbAccessory accessory);
  // UsbDeviceConnection openDevice(UsbDevice device);
  // void requestAccessoryPermission(UsbAccessory accessory, PendingIntent pi);
  // void requestDevicePermission(UsbDevice device, PendingIntent pi);
}

abstract base class UsbManagerChannel extends PlatformInterface {
  /// Constructs a [UsbManagerChannel].
  UsbManagerChannel() : super(token: _token);

  static final Object _token = Object();

  static UsbManagerChannel? _instance;

  /// The default instance of [UsbManagerChannel] to use.
  static UsbManagerChannel get instance =>
      ArgumentError.checkNotNull(_instance, 'instance');

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [UsbManagerChannel] when
  /// they register themselves.
  static set instance(UsbManagerChannel instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  UsbManager create();
}
