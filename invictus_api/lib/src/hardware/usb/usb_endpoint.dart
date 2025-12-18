import 'package:invictus_api/src/hardware.dart';

abstract interface class UsbEndpoint {
  int get address;
  int get attributes;
  UsbDir get direction;
  int get endpointNumber;
  int get interval;
  int get maxPacketSize;
  UsbEndpointXfer get type;
}
