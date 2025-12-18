import 'package:invictus_api/src/net.dart';

abstract interface class LinkProperties {
  Inet4Address? get dhcpServerAddress;
  set dhcpServerAddress(Inet4Address? value);
  List<InetAddress> get dnsServers;
  set dnsServers(List<InetAddress> value);
  String? get domains;
  set domains(String? value);
  ProxyInfo? get httpProxy;
  set httpProxy(ProxyInfo? value);
  String? get interfaceName;
  set interfaceName(String? value);
  List<LinkAddress> get linkAddresses;
  set linkAddresses(List<LinkAddress> value);
  int get mtu;
  set mtu(int value);
  IpPrefix? get nat64Prefix;
  set nat64Prefix(IpPrefix? value);
  String? get privateDnsServerName;
  List<RouteInfo> get routes;
  bool get isPrivateDnsActive;
  bool get isWakeOnLanSupported;

  bool addRoute(RouteInfo route);
  void clear();
}
