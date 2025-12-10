import 'package:invictus_android/src/api.dart';
import 'package:invictus_android/src/impl.dart';

abstract interface class Inet4Address implements InetAddress {
  factory Inet4Address() => Inet4AddressImpl();
}
