import 'dart:typed_data';

import 'package:invictus_api/invictus_api.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

abstract interface class InetAddress {
  static List<InetAddress> getAllByName(String? host) =>
      InetAddressChannel.instance.getAllByName(host);

  factory InetAddress.byAddress({String? host, required Uint8List addr}) =>
      InetAddressChannel.instance.createByAddress(host: host, addr: addr);

  factory InetAddress.byName(String? host) =>
      InetAddressChannel.instance.createByName(host);

  factory InetAddress.localHost() =>
      InetAddressChannel.instance.createLocalHost();

  factory InetAddress.loopbackAddress() =>
      InetAddressChannel.instance.createLoopbackAddress();

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

abstract base class InetAddressChannel extends PlatformInterface {
  /// Constructs a [InetAddressChannel].
  InetAddressChannel() : super(token: _token);

  static final Object _token = Object();

  static InetAddressChannel? _instance;

  /// The default instance of [InetAddressChannel] to use.
  static InetAddressChannel get instance =>
      ArgumentError.checkNotNull(_instance, 'instance');

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [InetAddressChannel] when
  /// they register themselves.
  static set instance(InetAddressChannel instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  List<InetAddress> getAllByName(String? host);

  InetAddress createByAddress({String? host, required Uint8List addr});
  InetAddress createByName(String? host);
  InetAddress createLocalHost();
  InetAddress createLoopbackAddress();
}
