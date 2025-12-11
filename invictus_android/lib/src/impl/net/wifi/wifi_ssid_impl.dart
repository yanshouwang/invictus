import 'dart:typed_data';

import 'package:invictus_android/src/api.dart';
import 'package:invictus_android/src/impl.dart';
import 'package:invictus_android/src/jni.dart' as jni;

final class WifiSsidImpl extends InvictusObjectImpl implements WifiSsid {
  @override
  final jni.WifiSsid api;

  WifiSsidImpl.internal(this.api);

  factory WifiSsidImpl.fromBytes(Uint8List bytes) {
    final api = jni.WifiSsid.fromBytes(bytes.api);
    return WifiSsidImpl.internal(api);
  }

  @override
  Uint8List get bytes => api.getBytes().impl;
}

extension Invictus$JWifiSsidX on jni.WifiSsid {
  WifiSsid get impl => WifiSsidImpl.internal(this);
}
