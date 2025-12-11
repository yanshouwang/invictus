import 'package:invictus_android/src/api.dart';
import 'package:invictus_android/src/impl.dart';
import 'package:invictus_android/src/jni.dart' as jni;

final class NetworkUtilImpl extends InvictusObjectImpl implements NetworkUtil {
  static Inet4Address intToInetAddress(int hostAddress) =>
      jni.InvictusNetworkUtil.INSTANCE.intToInetAddress(hostAddress).impl;

  static int inetAddressToInt(Inet4Address inetAddr) =>
      jni.InvictusNetworkUtil.INSTANCE.inetAddressToInt(inetAddr.api);

  static int prefixLengthToNetmaskInt(int prefixLength) =>
      jni.InvictusNetworkUtil.INSTANCE.prefixLengthToNetmaskInt(prefixLength);

  static int netmaskIntToPrefixLength(int netmask) =>
      jni.InvictusNetworkUtil.INSTANCE.netmaskIntToPrefixLength(netmask);

  static int netmaskToPrefixLength(Inet4Address netmask) =>
      jni.InvictusNetworkUtil.INSTANCE.netmaskToPrefixLength(netmask.api);

  @override
  final jni.InvictusNetworkUtil api;

  NetworkUtilImpl.internal(this.api);
}
