import 'package:invictus_api/src/net.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

abstract interface class Inet4AddressUtils {
  static Inet4Address intToInet4AddressHTL(int hostAddress) =>
      Inet4AddressUtilsChannel.instance.intToInet4AddressHTL(hostAddress);

  static Inet4Address intToInet4AddressHTH(int hostAddress) =>
      Inet4AddressUtilsChannel.instance.intToInet4AddressHTH(hostAddress);

  static int inet4AddressToIntHTH(Inet4Address inetAddr) =>
      Inet4AddressUtilsChannel.instance.inet4AddressToIntHTH(inetAddr);

  static int inet4AddressToIntHTL(Inet4Address inetAddr) =>
      Inet4AddressUtilsChannel.instance.inet4AddressToIntHTL(inetAddr);

  static int prefixLengthToV4NetmaskIntHTH(int prefixLength) =>
      Inet4AddressUtilsChannel.instance.prefixLengthToV4NetmaskIntHTH(
        prefixLength,
      );

  static int prefixLengthToV4NetmaskIntHTL(int prefixLength) =>
      Inet4AddressUtilsChannel.instance.prefixLengthToV4NetmaskIntHTL(
        prefixLength,
      );

  static int netmaskToPrefixLength(Inet4Address netmask) =>
      Inet4AddressUtilsChannel.instance.netmaskToPrefixLength(netmask);

  static int getImplicitNetmask(Inet4Address address) =>
      Inet4AddressUtilsChannel.instance.getImplicitNetmask(address);

  static Inet4Address getBroadcastAddress(
    Inet4Address addr,
    int prefixLength,
  ) => Inet4AddressUtilsChannel.instance.getBroadcastAddress(addr, prefixLength);

  static Inet4Address getPrefixMaskAsInet4Address(int prefixLength) =>
      Inet4AddressUtilsChannel.instance.getPrefixMaskAsInet4Address(
        prefixLength,
      );

  static String? trimAddressZeros(String? addr) =>
      Inet4AddressUtilsChannel.instance.trimAddressZeros(addr);
}

abstract base class Inet4AddressUtilsChannel extends PlatformInterface {
  /// Constructs a [Inet4AddressUtilsChannel].
  Inet4AddressUtilsChannel() : super(token: _token);

  static final Object _token = Object();

  static Inet4AddressUtilsChannel? _instance;

  /// The default instance of [Inet4AddressUtilsChannel] to use.
  static Inet4AddressUtilsChannel get instance =>
      ArgumentError.checkNotNull(_instance, 'instance');

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [Inet4AddressUtilsChannel] when
  /// they register themselves.
  static set instance(Inet4AddressUtilsChannel instance) {
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
