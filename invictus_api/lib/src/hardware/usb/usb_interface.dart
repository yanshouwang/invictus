import 'package:invictus_api/src/hardware.dart';

abstract interface class UsbInterface {
  int get alternateSetting;
  UsbEndpoint getEndpoint(int index);
  int get endpointCount;
  int get id;
  int get interfaceClass;
  int get interfaceProtocol;
  int get interfaceSubclass;
  String? get name;
}
