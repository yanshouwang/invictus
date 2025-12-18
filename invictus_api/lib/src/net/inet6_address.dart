import 'dart:typed_data';

import 'package:invictus_api/src/net.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

abstract interface class Inet6Address implements InetAddress {
  factory Inet6Address() => Inet6AddressChannel.instance.create();

  factory Inet6Address.byAddressScopeId(
    String host,
    Uint8List addr,
    int scopeId,
  ) => Inet6AddressChannel.instance.createByAddressScopeId(host, addr, scopeId);

  factory Inet6Address.byAddressNetwork(
    String host,
    Uint8List addr,
    NetworkInterface nif,
  ) => Inet6AddressChannel.instance.createByAddressNetwork(host, addr, nif);

  bool get isIPv4CompatibleAddress;
}

abstract base class Inet6AddressChannel extends PlatformInterface {
  /// Constructs a [Inet6AddressChannel].
  Inet6AddressChannel() : super(token: _token);

  static final Object _token = Object();

  static Inet6AddressChannel? _instance;

  /// The default instance of [Inet6AddressChannel] to use.
  static Inet6AddressChannel get instance =>
      ArgumentError.checkNotNull(_instance, 'instance');

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [Inet6AddressChannel] when
  /// they register themselves.
  static set instance(Inet6AddressChannel instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Inet6Address create();
  Inet6Address createByAddressScopeId(String host, Uint8List addr, int scopeId);
  Inet6Address createByAddressNetwork(
    String host,
    Uint8List addr,
    NetworkInterface nif,
  );
}
