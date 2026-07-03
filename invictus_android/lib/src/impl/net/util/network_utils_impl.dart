import 'package:invictus_android/src/impl.dart';
import 'package:invictus_android/src/jni.dart' as jni;
import 'package:invictus_api/invictus_api.dart';

final class NetworkUtilChannelsImpl extends NetworkUtilsChannel {
  @override
  Inet4Address intToInetAddress(int hostAddress) =>
      jni.NetworkUtils.INSTANCE.intToInetAddress(hostAddress).impl;

  @override
  int inetAddressToInt(Inet4Address inetAddr) =>
      jni.NetworkUtils.INSTANCE.inetAddressToInt(inetAddr.api);

  @override
  int prefixLengthToNetmaskInt(int prefixLength) =>
      jni.NetworkUtils.INSTANCE.prefixLengthToNetmaskInt(prefixLength);

  @override
  int netmaskIntToPrefixLength(int netmask) =>
      jni.NetworkUtils.INSTANCE.netmaskIntToPrefixLength(netmask);

  @override
  int netmaskToPrefixLength(Inet4Address netmask) =>
      jni.NetworkUtils.INSTANCE.netmaskToPrefixLength(netmask.api);
}
