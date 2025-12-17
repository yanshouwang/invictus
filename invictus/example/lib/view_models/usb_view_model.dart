import 'package:clover/clover.dart';
import 'package:invictus/invictus.dart';

class UsbViewModel extends ViewModel {
  final UsbManager _usbManager;
  final List<UsbAccessory> _usbAccessories;
  final Map<String, UsbDevice> _usbDevices;

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
  }
}
