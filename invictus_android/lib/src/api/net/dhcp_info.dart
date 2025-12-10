import 'package:invictus_android/src/impl.dart';

abstract interface class DhcpInfo {
  factory DhcpInfo() => DhcpInfoImpl();

  int get dns1;
  int get dns2;
  int get gateway;
  int get ipAddress;
  int get leaseDuration;
  int get netmask;
  int get serverAddress;
}
