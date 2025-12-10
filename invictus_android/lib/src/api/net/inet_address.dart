import 'dart:typed_data';

import 'package:invictus_android/src/api.dart';
import 'package:invictus_android/src/impl.dart';

abstract interface class InetAddress {
  static List<InetAddress> getAllByName(String? host) =>
      InetAddressImpl.getAllByName(host);

  factory InetAddress.byAddress({String? host, required Uint8List addr}) =>
      InetAddressImpl.getByAddress(host: host, addr: addr);

  factory InetAddress.byName(String? host) => InetAddressImpl.getByName(host);

  factory InetAddress.localHost() => InetAddressImpl.getLocalHost();

  factory InetAddress.loopbackAddress() => InetAddressImpl.getLoopbackAddress();

  Uint8List get address;
  String get canonicalHostName;
  String? get hostAddress;
  String get hostName;
  bool get isAnyLocalAddress;
  bool get isLinkLocalAddress;
  bool get isLoopbackAddress;
  bool get isMulticastAddress;
  bool get isSiteLocalAddress;
  bool get isMcGlobal;
  bool get isMcLinkLocal;
  bool get isMcNodeLocal;
  bool get isMcOrgLocal;
  bool get isMcSiteLocal;

  bool isReachableWithTimeout(int timeout);
  bool isReachableWithNetworkTtlTimeout({
    NetworkInterface? netif,
    required int ttl,
    required int timetout,
  });
}
