import 'package:invictus_api/src/net.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

abstract interface class InetAddresses {
  static bool isNumericAddress(String address) =>
      InetAddressesChannel.instance.isNumericAddress(address);

  static InetAddress parseNumericAddress(String address) =>
      InetAddressesChannel.instance.parseNumericAddress(address);
}

abstract base class InetAddressesChannel extends PlatformInterface {
  /// Constructs a [InetAddressesChannel].
  InetAddressesChannel() : super(token: _token);

  static final Object _token = Object();

  static InetAddressesChannel? _instance;

  /// The default instance of [InetAddressesChannel] to use.
  static InetAddressesChannel get instance =>
      ArgumentError.checkNotNull(_instance, 'instance');

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [InetAddressesChannel] when
  /// they register themselves.
  static set instance(InetAddressesChannel instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  bool isNumericAddress(String address);
  InetAddress parseNumericAddress(String address);
}
