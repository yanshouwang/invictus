import 'dart:typed_data';

import 'package:invictus_android/src/api.dart';
import 'package:invictus_android/src/impl.dart';
import 'package:invictus_android/src/jni.dart' as jni;

final class IpPrefixImpl implements IpPrefix {
  final jni.IpPrefix api;

  IpPrefixImpl.internal(this.api);

  @override
  InetAddress get address => api.getAddress().impl;

  @override
  int get prefixLength => api.getPrefixLength();

  @override
  Uint8List get rawAddress => api.getRawAddress().impl;

  @override
  bool contains(InetAddress address) => api.contains(address.api);
}

extension Invictus$IpPrefixX on IpPrefix {
  jni.IpPrefix get api {
    final impl = this;
    if (impl is! IpPrefixImpl) throw TypeError();
    return impl.api;
  }
}

extension Invictus$JIpPrefixX on jni.IpPrefix {
  IpPrefix get impl => IpPrefixImpl.internal(this);
}
