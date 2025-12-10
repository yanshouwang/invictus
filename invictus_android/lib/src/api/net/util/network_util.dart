import 'package:invictus_android/src/api.dart';
import 'package:invictus_android/src/impl.dart';

abstract interface class NetworkUtil {
  static Inet4Address intToInetAddress(int hostAddress) =>
      NetworkUtilImpl.intToInetAddress(hostAddress);

  static int inetAddressToInt(Inet4Address inetAddr) =>
      NetworkUtilImpl.inetAddressToInt(inetAddr);

  static int prefixLengthToNetmaskInt(int prefixLength) =>
      NetworkUtilImpl.prefixLengthToNetmaskInt(prefixLength);

  static int netmaskIntToPrefixLength(int netmask) =>
      NetworkUtilImpl.netmaskIntToPrefixLength(netmask);

  static int netmaskToPrefixLength(Inet4Address netmask) =>
      NetworkUtilImpl.netmaskToPrefixLength(netmask);
}
