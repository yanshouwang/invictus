import 'package:invictus_api/src/net.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

abstract interface class Inet4Address implements InetAddress {
  factory Inet4Address() => Inet4AddressChannel.instance.create();
}

abstract base class Inet4AddressChannel extends PlatformInterface {
  /// Constructs a [Inet4AddressChannel].
  Inet4AddressChannel() : super(token: _token);

  static final Object _token = Object();

  static Inet4AddressChannel? _instance;

  /// The default instance of [Inet4AddressChannel] to use.
  static Inet4AddressChannel get instance =>
      ArgumentError.checkNotNull(_instance, 'instance');

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [Inet4AddressChannel] when
  /// they register themselves.
  static set instance(Inet4AddressChannel instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Inet4Address create();
}
