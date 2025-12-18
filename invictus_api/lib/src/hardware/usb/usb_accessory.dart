abstract interface class UsbAccessory {
  String? get description;
  String get manufacturer;
  String get model;
  String? get serial;
  String? get uri;
  String? get version;
}
