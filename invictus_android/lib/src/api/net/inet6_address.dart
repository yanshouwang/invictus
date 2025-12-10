import 'dart:typed_data';

import 'package:invictus_android/src/api.dart';
import 'package:invictus_android/src/impl.dart';

abstract interface class Inet6Address implements InetAddress {
  factory Inet6Address() => Inet6AddressImpl();

  factory Inet6Address.byAddressScopeId(
    String host,
    Uint8List addr,
    int scopeId,
  ) => Inet6AddressImpl.getByAddressScopeId(host, addr, scopeId);

  factory Inet6Address.byAddressNetwork(
    String host,
    Uint8List addr,
    NetworkInterface nif,
  ) => Inet6AddressImpl.getByAddressNetwork(host, addr, nif);

  bool get isIPv4CompatibleAddress;
}
