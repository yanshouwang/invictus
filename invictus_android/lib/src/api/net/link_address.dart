import 'package:invictus_android/src/api.dart';
import 'package:invictus_android/src/impl.dart';

abstract interface class LinkAddress {
  factory LinkAddress.byInetAddressPrefixLength(
    InetAddress address,
    int prefixLength,
  ) => LinkAddressImpl.byInetAddressPrefixLength(address, prefixLength);

  factory LinkAddress.byInetAddressPrefixLengthFlagsScope(
    InetAddress address,
    int prefixLength,
    int flags,
    int scope,
  ) => LinkAddressImpl.byInetAddressPrefixLengthFlagsScope(
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
  ) =>
      LinkAddressImpl.byInetAddressPrefixLengthFlagsScopeDeprecationTimeExpirationTime(
        address,
        prefixLength,
        flags,
        scope,
        deprecationTime,
        expirationTime,
      );

  factory LinkAddress.byAddress(String address) =>
      LinkAddressImpl.byAddress(address);

  factory LinkAddress.byAddressFlagsScope(
    String address,
    int flags,
    int scope,
  ) => LinkAddressImpl.byAddressFlagsScope(address, flags, scope);

  factory LinkAddress.byInterfaceAddress(InterfaceAddress address) =>
      LinkAddressImpl.byInterfaceAddress(address);

  InetAddress get address;
  int get flags;
  int get prefixLength;
  int get scope;
}
