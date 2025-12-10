import 'package:invictus_android/src/api.dart';
import 'package:invictus_android/src/impl.dart';
import 'package:invictus_android/src/jni.dart' as jni;

final class Inet4AddressUtilImpl implements Inet4AddressUtil {
  static Inet4Address intToInet4AddressHTL(int hostAddress) => jni
      .InvictusInet4AddressUtil
      .INSTANCE
      .intToInet4AddressHTL(hostAddress)
      .impl;

  static Inet4Address intToInet4AddressHTH(int hostAddress) => jni
      .InvictusInet4AddressUtil
      .INSTANCE
      .intToInet4AddressHTH(hostAddress)
      .impl;

  static int inet4AddressToIntHTH(Inet4Address inetAddr) =>
      jni.InvictusInet4AddressUtil.INSTANCE.inet4AddressToIntHTH(inetAddr.api);

  static int inet4AddressToIntHTL(Inet4Address inetAddr) =>
      jni.InvictusInet4AddressUtil.INSTANCE.inet4AddressToIntHTL(inetAddr.api);

  static int prefixLengthToV4NetmaskIntHTH(int prefixLength) => jni
      .InvictusInet4AddressUtil
      .INSTANCE
      .prefixLengthToV4NetmaskIntHTH(prefixLength);

  static int prefixLengthToV4NetmaskIntHTL(int prefixLength) => jni
      .InvictusInet4AddressUtil
      .INSTANCE
      .prefixLengthToV4NetmaskIntHTL(prefixLength);

  static int netmaskToPrefixLength(Inet4Address netmask) =>
      jni.InvictusInet4AddressUtil.INSTANCE.netmaskToPrefixLength(netmask.api);

  static int getImplicitNetmask(Inet4Address address) =>
      jni.InvictusInet4AddressUtil.INSTANCE.getImplicitNetmask(address.api);

  static Inet4Address getBroadcastAddress(
    Inet4Address addr,
    int prefixLength,
  ) => jni.InvictusInet4AddressUtil.INSTANCE
      .getBroadcastAddress(addr.api, prefixLength)
      .impl;

  static Inet4Address getPrefixMaskAsInet4Address(int prefixLength) => jni
      .InvictusInet4AddressUtil
      .INSTANCE
      .getPrefixMaskAsInet4Address(prefixLength)
      .impl;

  static String? trimAddressZeros(String? addr) =>
      jni.InvictusInet4AddressUtil.INSTANCE.trimAddressZeros(addr?.api)?.impl;

  final jni.InvictusInet4AddressUtil api;

  Inet4AddressUtilImpl.internal(this.api);
}
