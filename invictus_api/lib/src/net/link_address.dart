import 'package:invictus_api/invictus_api.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

abstract interface class LinkAddress {
  factory LinkAddress.byInetAddressPrefixLength(
    InetAddress address,
    int prefixLength,
  ) => LinkAddressChannel.instance.createByInetAddressPrefixLength(
    address,
    prefixLength,
  );

  factory LinkAddress.byInetAddressPrefixLengthFlagsScope(
    InetAddress address,
    int prefixLength,
    int flags,
    int scope,
  ) => LinkAddressChannel.instance.createByInetAddressPrefixLengthFlagsScope(
    address,
    prefixLength,
    flags,
    scope,
  );

  factory LinkAddress.byInetAddressPrefixLengthFlagsScopeDeprecationTimeExpirationTime(
    InetAddress address,
    int prefixLength,
    int flags,
    int scope,
    int deprecationTime,
    int expirationTime,
  ) => LinkAddressChannel.instance
      .createByInetAddressPrefixLengthFlagsScopeDeprecationTimeExpirationTime(
        address,
        prefixLength,
        flags,
        scope,
        deprecationTime,
        expirationTime,
      );

  factory LinkAddress.byAddress(String address) =>
      LinkAddressChannel.instance.createByAddress(address);

  factory LinkAddress.byAddressFlagsScope(
    String address,
    int flags,
    int scope,
  ) => LinkAddressChannel.instance.createByAddressFlagsScope(
    address,
    flags,
    scope,
  );

  factory LinkAddress.byInterfaceAddress(InterfaceAddress address) =>
      LinkAddressChannel.instance.createByInterfaceAddress(address);

  InetAddress get address;
  int get flags;
  int get prefixLength;
  int get scope;
}

abstract base class LinkAddressChannel extends PlatformInterface {
  /// Constructs a [LinkAddressChannel].
  LinkAddressChannel() : super(token: _token);

  static final Object _token = Object();

  static LinkAddressChannel? _instance;

  /// The default instance of [LinkAddressChannel] to use.
  static LinkAddressChannel get instance =>
      ArgumentError.checkNotNull(_instance, 'instance');

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [LinkAddressChannel] when
  /// they register themselves.
  static set instance(LinkAddressChannel instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  LinkAddress createByInetAddressPrefixLength(
    InetAddress address,
    int prefixLength,
  );
  LinkAddress createByInetAddressPrefixLengthFlagsScope(
    InetAddress address,
    int prefixLength,
    int flags,
    int scope,
  );
  LinkAddress
  createByInetAddressPrefixLengthFlagsScopeDeprecationTimeExpirationTime(
    InetAddress address,
    int prefixLength,
    int flags,
    int scope,
    int deprecationTime,
    int expirationTime,
  );
  LinkAddress createByAddress(String address);
  LinkAddress createByAddressFlagsScope(String address, int flags, int scope);
  LinkAddress createByInterfaceAddress(InterfaceAddress address);
}
