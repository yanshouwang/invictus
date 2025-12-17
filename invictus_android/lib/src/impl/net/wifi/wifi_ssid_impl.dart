import 'dart:typed_data';

import 'package:invictus_android/src/impl.dart';
import 'package:invictus_android/src/jni.dart' as jni;
import 'package:invictus_api/invictus_api.dart';

final class WifiSsidImpl extends InvictusObjectImpl implements WifiSsid {
  @override
  final jni.WifiSsid api;

  WifiSsidImpl.internal(this.api);

  @override
  Uint8List get bytes => api.getBytes().impl;
}

final class WifiSsidChannelImpl extends WifiSsidChannel {
  @override
  WifiSsid createFromBytes(Uint8List bytes) {
    final api = jni.WifiSsid.fromBytes(bytes.api);
    return WifiSsidImpl.internal(api);
  }
}

extension Invictus$JWifiSsidX on jni.WifiSsid {
  WifiSsid get impl => WifiSsidImpl.internal(this);
}
