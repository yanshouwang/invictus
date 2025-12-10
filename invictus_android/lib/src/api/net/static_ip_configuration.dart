import 'package:invictus_android/src/api.dart';
import 'package:invictus_android/src/impl.dart';

abstract interface class StaticIpConfiguration {
  factory StaticIpConfiguration({
    LinkAddress? ipAddress,
    InetAddress? gateway,
    Iterable<InetAddress>? dnsServers,
    String? domains,
  }) => StaticIpConfigurationImpl(
    ipAddress: ipAddress,
    gateway: gateway,
    dnsServers: dnsServers,
    domains: domains,
  );

  LinkAddress get ipAddress;
  InetAddress? get gateway;
  List<InetAddress> get dnsServers;
  String? get domains;

  void addDnsServer(InetAddress server);
  void clear();
  List<RouteInfo> getRoutes([String? iface]);
  LinkProperties toLinkProperties([String? iface]);
}
