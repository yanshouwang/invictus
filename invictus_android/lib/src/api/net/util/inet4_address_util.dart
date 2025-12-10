import 'package:invictus_android/src/api.dart';
import 'package:invictus_android/src/impl.dart';

abstract interface class Inet4AddressUtil {
  static Inet4Address intToInet4AddressHTL(int hostAddress) =>
      Inet4AddressUtilImpl.intToInet4AddressHTL(hostAddress);

  static Inet4Address intToInet4AddressHTH(int hostAddress) =>
      Inet4AddressUtilImpl.intToInet4AddressHTH(hostAddress);

  static int inet4AddressToIntHTH(Inet4Address inetAddr) =>
      Inet4AddressUtilImpl.inet4AddressToIntHTH(inetAddr);

  static int inet4AddressToIntHTL(Inet4Address inetAddr) =>
      Inet4AddressUtilImpl.inet4AddressToIntHTL(inetAddr);

  static int prefixLengthToV4NetmaskIntHTH(int prefixLength) =>
      Inet4AddressUtilImpl.prefixLengthToV4NetmaskIntHTH(prefixLength);

  static int prefixLengthToV4NetmaskIntHTL(int prefixLength) =>
      Inet4AddressUtilImpl.prefixLengthToV4NetmaskIntHTL(prefixLength);

  static int netmaskToPrefixLength(Inet4Address netmask) =>
      Inet4AddressUtilImpl.netmaskToPrefixLength(netmask);

  static int getImplicitNetmask(Inet4Address address) =>
      Inet4AddressUtilImpl.getImplicitNetmask(address);

  static Inet4Address getBroadcastAddress(
    Inet4Address addr,
    int prefixLength,
  ) => Inet4AddressUtilImpl.getBroadcastAddress(addr, prefixLength);

  static Inet4Address getPrefixMaskAsInet4Address(int prefixLength) =>
      Inet4AddressUtilImpl.getPrefixMaskAsInet4Address(prefixLength);

  static String? trimAddressZeros(String? addr) =>
      Inet4AddressUtilImpl.trimAddressZeros(addr);
}
