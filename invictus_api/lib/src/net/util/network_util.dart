import 'package:invictus_api/invictus_api.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

abstract interface class NetworkUtil {
  static Inet4Address intToInetAddress(int hostAddress) =>
      NetworkUtilChannel.instance.intToInetAddress(hostAddress);

  static int inetAddressToInt(Inet4Address inetAddr) =>
      NetworkUtilChannel.instance.inetAddressToInt(inetAddr);

  static int prefixLengthToNetmaskInt(int prefixLength) =>
      NetworkUtilChannel.instance.prefixLengthToNetmaskInt(prefixLength);

  static int netmaskIntToPrefixLength(int netmask) =>
      NetworkUtilChannel.instance.netmaskIntToPrefixLength(netmask);

  static int netmaskToPrefixLength(Inet4Address netmask) =>
      NetworkUtilChannel.instance.netmaskToPrefixLength(netmask);
}

abstract base class NetworkUtilChannel extends PlatformInterface {
  /// Constructs a [NetworkUtilChannel].
  NetworkUtilChannel() : super(token: _token);

  static final Object _token = Object();

  static NetworkUtilChannel? _instance;

  /// The default instance of [NetworkUtilChannel] to use.
  static NetworkUtilChannel get instance =>
      ArgumentError.checkNotNull(_instance, 'instance');

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [NetworkUtilChannel] when
  /// they register themselves.
  static set instance(NetworkUtilChannel instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Inet4Address intToInetAddress(int hostAddress);
  int inetAddressToInt(Inet4Address inetAddr);
  int prefixLengthToNetmaskInt(int prefixLength);
  int netmaskIntToPrefixLength(int netmask);
  int netmaskToPrefixLength(Inet4Address netmask);
}
