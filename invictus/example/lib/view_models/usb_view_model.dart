import 'package:clover/clover.dart';
import 'package:invictus/invictus.dart';
import 'package:logging/logging.dart';

Logger get _logger => Logger('UsbViewModel');

class UsbViewModel extends ViewModel {
  final UsbManager _usbManager;
  final List<UsbAccessory> _usbAccessories;
  final Map<String, UsbDevice> _usbDevices;

  late final UsbManager$UsbAccessoryListener _accessoryListener;
  late final UsbManager$UsbDeviceListener _deviceListener;

  List<UsbAccessory> get usbAccessories => _usbAccessories;
  Map<String, UsbDevice> get usbDevices => _usbDevices;

  UsbViewModel()
    : _usbManager = UsbManager(),
      _usbAccessories = [],
      _usbDevices = {} {
    _initialize();
  }

  void _initialize() {
    final usbAccessories = _usbManager.getAccessoryList();
    final usbDevices = _usbManager.getDeviceList();
    _usbAccessories.addAll(usbAccessories);
    _usbDevices.addAll(usbDevices);
    notifyListeners();
    _accessoryListener = UsbManager$UsbAccessoryListener(
      onAttached: (accessory) {
        _usbAccessories.add(accessory);
        notifyListeners();
      },
      onDetached: (accessory) {
        _usbAccessories.remove(accessory);
        notifyListeners();
      },
    );
    _deviceListener = UsbManager$UsbDeviceListener(
      onAttached: (device) {
        _usbDevices[device.deviceName] = device;
        notifyListeners();
      },
      onDetached: (device) {
        _usbDevices.remove(device.deviceName);
        notifyListeners();
      },
    );
    _usbManager.registerAccessoryListener(_accessoryListener);
    _usbManager.registerDeviceListener(_deviceListener);
  }

  void requestAccessoryPermission(UsbAccessory accessory) async {
    final isGranted = await _usbManager.requestAccessoryPermission(accessory);
    _logger.info('requestAccessoryPermission: $isGranted');
  }

  void requestDevicePermission(UsbDevice device) async {
    final isGranted = await _usbManager.requestDevicePermission(device);
    _logger.info('requestDevicePermission: $isGranted');
  }

  @override
  void dispose() {
    _usbManager.unregisterAccessoryListener(_accessoryListener);
    _usbManager.unregisterDeviceListener(_deviceListener);
    super.dispose();
  }
}
