import 'dart:typed_data';

import 'package:invictus_android/src/api.dart';
import 'package:invictus_android/src/impl.dart';
import 'package:invictus_android/src/jni.dart' as jni;

final class Inet6AddressImpl extends InetAddressImpl implements Inet6Address {
  static Inet6Address getByAddressScopeId(
    String host,
    Uint8List addr,
    int scopeId,
  ) {
    final apiOrNull = jni.Inet6Address.getByAddress$2(
      host.api,
      addr.api,
      scopeId,
    );
    final api = ArgumentError.checkNotNull(apiOrNull, 'api');
    return api.impl;
  }

  static Inet6Address getByAddressNetwork(
    String host,
    Uint8List addr,
    NetworkInterface nif,
  ) {
    final apiOrNull = jni.Inet6Address.getByAddress$3(
      host.api,
      addr.api,
      nif.api,
    );
    final api = ArgumentError.checkNotNull(apiOrNull, 'api');
    return api.impl;
  }

  @override
  final jni.Inet6Address api;

  Inet6AddressImpl.internal(this.api);

  factory Inet6AddressImpl() {
    final invictusApi = jni.InvictusInet6Address.new$1();
    final api = invictusApi.getObj();
    return Inet6AddressImpl.internal(api);
  }

  @override
  bool get isIPv4CompatibleAddress => api.isIPv4CompatibleAddress();
}

extension Invictus$Inet6AdressX on Inet6Address {
  jni.Inet6Address get api {
    final impl = this;
    if (impl is! Inet6AddressImpl) throw TypeError();
    return impl.api;
  }
}

extension Invictus$JInet6AddressX on jni.Inet6Address {
  Inet6Address get impl => Inet6AddressImpl.internal(this);
}
