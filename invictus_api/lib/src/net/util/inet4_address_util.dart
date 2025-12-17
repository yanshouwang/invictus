import 'package:invictus_api/invictus_api.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

abstract interface class Inet4AddressUtil {
  static Inet4Address intToInet4AddressHTL(int hostAddress) =>
      Inet4AddressUtilChannel.instance.intToInet4AddressHTL(hostAddress);

  static Inet4Address intToInet4AddressHTH(int hostAddress) =>
      Inet4AddressUtilChannel.instance.intToInet4AddressHTH(hostAddress);

  static int inet4AddressToIntHTH(Inet4Address inetAddr) =>
      Inet4AddressUtilChannel.instance.inet4AddressToIntHTH(inetAddr);

  static int inet4AddressToIntHTL(Inet4Address inetAddr) =>
      Inet4AddressUtilChannel.instance.inet4AddressToIntHTL(inetAddr);

  static int prefixLengthToV4NetmaskIntHTH(int prefixLength) =>
      Inet4AddressUtilChannel.instance.prefixLengthToV4NetmaskIntHTH(
        prefixLength,
      );

  static int prefixLengthToV4NetmaskIntHTL(int prefixLength) =>
      Inet4AddressUtilChannel.instance.prefixLengthToV4NetmaskIntHTL(
        prefixLength,
      );

  static int netmaskToPrefixLength(Inet4Address netmask) =>
      Inet4AddressUtilChannel.instance.netmaskToPrefixLength(netmask);

  static int getImplicitNetmask(Inet4Address address) =>
      Inet4AddressUtilChannel.instance.getImplicitNetmask(address);

  static Inet4Address getBroadcastAddress(
    Inet4Address addr,
    int prefixLength,
  ) => Inet4AddressUtilChannel.instance.getBroadcastAddress(addr, prefixLength);

  static Inet4Address getPrefixMaskAsInet4Address(int prefixLength) =>
      Inet4AddressUtilChannel.instance.getPrefixMaskAsInet4Address(
        prefixLength,
      );

  static String? trimAddressZeros(String? addr) =>
      Inet4AddressUtilChannel.instance.trimAddressZeros(addr);
}

abstract base class Inet4AddressUtilChannel extends PlatformInterface {
  /// Constructs a [Inet4AddressUtilChannel].
  Inet4AddressUtilChannel() : super(token: _token);

  static final Object _token = Object();

  static Inet4AddressUtilChannel? _instance;

  /// The default instance of [Inet4AddressUtilChannel] to use.
  static Inet4AddressUtilChannel get instance =>
      ArgumentError.checkNotNull(_instance, 'instance');

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [Inet4AddressUtilChannel] when
  /// they register themselves.
  static set instance(Inet4AddressUtilChannel instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Inet4Address intToInet4AddressHTL(int hostAddress);
  Inet4Address intToInet4AddressHTH(int hostAddress);
  int inet4AddressToIntHTH(Inet4Address inetAddr);
  int inet4AddressToIntHTL(Inet4Address inetAddr);
  int prefixLengthToV4NetmaskIntHTH(int prefixLength);
  int prefixLengthToV4NetmaskIntHTL(int prefixLength);
  int netmaskToPrefixLength(Inet4Address netmask);
  int getImplicitNetmask(Inet4Address address);
  Inet4Address getBroadcastAddress(Inet4Address addr, int prefixLength);
  Inet4Address getPrefixMaskAsInet4Address(int prefixLength);
  String? trimAddressZeros(String? addr);
}
