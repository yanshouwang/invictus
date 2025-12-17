import 'dart:typed_data';

import 'package:invictus_api/invictus_api.dart';

abstract interface class IpPrefix {
  InetAddress get address;
  int get prefixLength;
  Uint8List get rawAddress;

  bool contains(InetAddress address);
}
