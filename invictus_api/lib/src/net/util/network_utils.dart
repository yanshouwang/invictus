import 'package:invictus_api/src/net.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

abstract interface class NetworkUtils {
  @Deprecated(
    'Use either {@link Inet4AddressUtils#intToInet4AddressHTH(int)} or {@link Inet4AddressUtils#intToInet4AddressHTL(int)}',
  )
  static Inet4Address intToInetAddress(int hostAddress) =>
      NetworkUtilsChannel.instance.intToInetAddress(hostAddress);

  @Deprecated(
    'Use either {@link Inet4AddressUtils#inet4AddressToIntHTH(Inet4Address)} or {@link Inet4AddressUtils#inet4AddressToIntHTL(Inet4Address)}',
  )
  static int inetAddressToInt(Inet4Address inetAddr) =>
      NetworkUtilsChannel.instance.inetAddressToInt(inetAddr);

  @Deprecated(
    'Use either {@link Inet4AddressUtils#prefixLengthToV4NetmaskIntHTH(int)} or {@link Inet4AddressUtils#prefixLengthToV4NetmaskIntHTL(int)}',
  )
  static int prefixLengthToNetmaskInt(int prefixLength) =>
      NetworkUtilsChannel.instance.prefixLengthToNetmaskInt(prefixLength);

  static int netmaskIntToPrefixLength(int netmask) =>
      NetworkUtilsChannel.instance.netmaskIntToPrefixLength(netmask);

  @Deprecated(
    'use {@link Inet4AddressUtils#netmaskToPrefixLength(Inet4Address)}',
  )
  static int netmaskToPrefixLength(Inet4Address netmask) =>
      NetworkUtilsChannel.instance.netmaskToPrefixLength(netmask);
}

abstract base class NetworkUtilsChannel extends PlatformInterface {
  /// Constructs a [NetworkUtilsChannel].
  NetworkUtilsChannel() : super(token: _token);

  static final Object _token = Object();

  static NetworkUtilsChannel? _instance;

  /// The default instance of [NetworkUtilsChannel] to use.
  static NetworkUtilsChannel get instance =>
      ArgumentError.checkNotNull(_instance, 'instance');

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [NetworkUtilsChannel] when
  /// they register themselves.
  static set instance(NetworkUtilsChannel instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Inet4Address intToInetAddress(int hostAddress);
  int inetAddressToInt(Inet4Address inetAddr);
  int prefixLengthToNetmaskInt(int prefixLength);
  int netmaskIntToPrefixLength(int netmask);
  int netmaskToPrefixLength(Inet4Address netmask);
}
