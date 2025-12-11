import 'dart:typed_data';

abstract interface class WifiSsid {
  factory WifiSsid.fromBytes(Uint8List bytes) => throw UnimplementedError();

  Uint8List get bytes;
}
