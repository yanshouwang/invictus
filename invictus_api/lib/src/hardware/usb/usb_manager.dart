import 'package:invictus_api/src/hardware.dart';
import 'package:invictus_api/src/io.dart';
import 'package:invictus_api/src/os.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

abstract interface class UsbManager$UsbAccessoryListener {
  factory UsbManager$UsbAccessoryListener({
    required void Function(UsbAccessory accessory) onAttached,
    required void Function(UsbAccessory accessory) onDetached,
  }) => UsbManagerChannel.instance.createAccessoryListener(
    onAttached: onAttached,
    onDetached: onDetached,
  );
}

abstract interface class UsbManager$UsbDeviceListener {
  factory UsbManager$UsbDeviceListener({
    required void Function(UsbDevice device) onAttached,
    required void Function(UsbDevice device) onDetached,
  }) => UsbManagerChannel.instance.createDeviceListener(
    onAttached: onAttached,
    onDetached: onDetached,
  );
}

abstract interface class UsbManager {
  factory UsbManager() => UsbManagerChannel.instance.create();

  void registerAccessoryListener(UsbManager$UsbAccessoryListener listener);
  void unregisterAccessoryListener(UsbManager$UsbAccessoryListener listener);
  void registerDeviceListener(UsbManager$UsbDeviceListener listener);
  void unregisterDeviceListener(UsbManager$UsbDeviceListener listener);
  List<UsbAccessory> getAccessoryList();
  Map<String, UsbDevice> getDeviceList();
  bool hasAccessoryPermission(UsbAccessory accessory);
  bool hasDevicePermission(UsbDevice device);
  ParcelFileDescriptor openAccessory(UsbAccessory accessory);
  InputStream openAccessoryInputStream(UsbAccessory accessory);
  OutputStream openAccessoryOutputStream(UsbAccessory accessory);
  UsbDeviceConnection openDevice(UsbDevice device);
  Future<bool> requestAccessoryPermission(UsbAccessory accessory);
  Future<bool> requestDevicePermission(UsbDevice device);
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
  UsbManager$UsbAccessoryListener createAccessoryListener({
    required void Function(UsbAccessory accessory) onAttached,
    required void Function(UsbAccessory accessory) onDetached,
  });
  UsbManager$UsbDeviceListener createDeviceListener({
    required void Function(UsbDevice device) onAttached,
    required void Function(UsbDevice device) onDetached,
  });
}
