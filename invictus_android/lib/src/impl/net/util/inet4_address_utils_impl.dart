import 'package:invictus_android/src/impl.dart';
import 'package:invictus_android/src/jni.dart' as jni;
import 'package:invictus_api/invictus_api.dart';

final class Inet4AddressUtilChannelsImpl extends Inet4AddressUtilsChannel
    implements Inet4AddressUtils {
  @override
  Inet4Address intToInet4AddressHTL(int hostAddress) =>
      jni.Inet4AddressUtils.INSTANCE.intToInet4AddressHTL(hostAddress).impl;

  @override
  Inet4Address intToInet4AddressHTH(int hostAddress) =>
      jni.Inet4AddressUtils.INSTANCE.intToInet4AddressHTH(hostAddress).impl;

  @override
  int inet4AddressToIntHTH(Inet4Address inetAddr) =>
      jni.Inet4AddressUtils.INSTANCE.inet4AddressToIntHTH(inetAddr.api);

  @override
  int inet4AddressToIntHTL(Inet4Address inetAddr) =>
      jni.Inet4AddressUtils.INSTANCE.inet4AddressToIntHTL(inetAddr.api);

  @override
  int prefixLengthToV4NetmaskIntHTH(int prefixLength) => jni
      .Inet4AddressUtils
      .INSTANCE
      .prefixLengthToV4NetmaskIntHTH(prefixLength);

  @override
  int prefixLengthToV4NetmaskIntHTL(int prefixLength) => jni
      .Inet4AddressUtils
      .INSTANCE
      .prefixLengthToV4NetmaskIntHTL(prefixLength);

  @override
  int netmaskToPrefixLength(Inet4Address netmask) =>
      jni.Inet4AddressUtils.INSTANCE.netmaskToPrefixLength(netmask.api);

  @override
  int getImplicitNetmask(Inet4Address address) =>
      jni.Inet4AddressUtils.INSTANCE.getImplicitNetmask(address.api);

  @override
  Inet4Address getBroadcastAddress(Inet4Address addr, int prefixLength) => jni
      .Inet4AddressUtils
      .INSTANCE
      .getBroadcastAddress(addr.api, prefixLength)
      .impl;

  @override
  Inet4Address getPrefixMaskAsInet4Address(int prefixLength) => jni
      .Inet4AddressUtils
      .INSTANCE
      .getPrefixMaskAsInet4Address(prefixLength)
      .impl;

  @override
  String? trimAddressZeros(String? addr) =>
      jni.Inet4AddressUtils.INSTANCE.trimAddressZeros(addr?.api)?.impl;
}
