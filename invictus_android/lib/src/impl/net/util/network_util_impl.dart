import 'package:invictus_android/src/impl.dart';
import 'package:invictus_android/src/jni.dart' as jni;
import 'package:invictus_api/invictus_api.dart';

final class NetworkUtilChannelImpl extends NetworkUtilChannel {
  @override
  Inet4Address intToInetAddress(int hostAddress) =>
      jni.InvictusNetworkUtil.INSTANCE.intToInetAddress(hostAddress).impl;

  @override
  int inetAddressToInt(Inet4Address inetAddr) =>
      jni.InvictusNetworkUtil.INSTANCE.inetAddressToInt(inetAddr.api);

  @override
  int prefixLengthToNetmaskInt(int prefixLength) =>
      jni.InvictusNetworkUtil.INSTANCE.prefixLengthToNetmaskInt(prefixLength);

  @override
  int netmaskIntToPrefixLength(int netmask) =>
      jni.InvictusNetworkUtil.INSTANCE.netmaskIntToPrefixLength(netmask);

  @override
  int netmaskToPrefixLength(Inet4Address netmask) =>
      jni.InvictusNetworkUtil.INSTANCE.netmaskToPrefixLength(netmask.api);
}
