import 'package:invictus_api/src/hardware.dart';

abstract interface class UsbConfiguration {
  int get id;
  int get interfaceCount;
  int get maxPower;
  String? get name;
  bool get isRemoteWakeup;
  bool get isSelfPowered;

  UsbInterface getInterface(int index);
}
