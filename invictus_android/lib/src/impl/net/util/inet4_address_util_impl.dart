import 'package:invictus_android/src/impl.dart';
import 'package:invictus_android/src/jni.dart' as jni;
import 'package:invictus_api/invictus_api.dart';

final class Inet4AddressUtilChannelImpl extends Inet4AddressUtilChannel
    implements Inet4AddressUtil {
  @override
  Inet4Address intToInet4AddressHTL(int hostAddress) => jni
      .InvictusInet4AddressUtil
      .INSTANCE
      .intToInet4AddressHTL(hostAddress)
      .impl;

  @override
  Inet4Address intToInet4AddressHTH(int hostAddress) => jni
      .InvictusInet4AddressUtil
      .INSTANCE
      .intToInet4AddressHTH(hostAddress)
      .impl;

  @override
  int inet4AddressToIntHTH(Inet4Address inetAddr) =>
      jni.InvictusInet4AddressUtil.INSTANCE.inet4AddressToIntHTH(inetAddr.api);

  @override
  int inet4AddressToIntHTL(Inet4Address inetAddr) =>
      jni.InvictusInet4AddressUtil.INSTANCE.inet4AddressToIntHTL(inetAddr.api);

  @override
  int prefixLengthToV4NetmaskIntHTH(int prefixLength) => jni
      .InvictusInet4AddressUtil
      .INSTANCE
      .prefixLengthToV4NetmaskIntHTH(prefixLength);

  @override
  int prefixLengthToV4NetmaskIntHTL(int prefixLength) => jni
      .InvictusInet4AddressUtil
      .INSTANCE
      .prefixLengthToV4NetmaskIntHTL(prefixLength);

  @override
  int netmaskToPrefixLength(Inet4Address netmask) =>
      jni.InvictusInet4AddressUtil.INSTANCE.netmaskToPrefixLength(netmask.api);

  @override
  int getImplicitNetmask(Inet4Address address) =>
      jni.InvictusInet4AddressUtil.INSTANCE.getImplicitNetmask(address.api);

  @override
  Inet4Address getBroadcastAddress(Inet4Address addr, int prefixLength) => jni
      .InvictusInet4AddressUtil
      .INSTANCE
      .getBroadcastAddress(addr.api, prefixLength)
      .impl;

  @override
  Inet4Address getPrefixMaskAsInet4Address(int prefixLength) => jni
      .InvictusInet4AddressUtil
      .INSTANCE
      .getPrefixMaskAsInet4Address(prefixLength)
      .impl;

  @override
  String? trimAddressZeros(String? addr) =>
      jni.InvictusInet4AddressUtil.INSTANCE.trimAddressZeros(addr?.api)?.impl;
}
