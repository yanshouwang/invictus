import 'package:invictus/invictus.dart';

class NetworkStatus {
  final String iface;
  final LinkAddress? linkAddress;
  final InetAddress? gateway;
  final List<InetAddress> dnsServers;
  final String? domains;

  const NetworkStatus({
    required this.iface,
    required this.linkAddress,
    required this.gateway,
    required this.dnsServers,
    required this.domains,
  });
}

extension LinkPropertiesX on LinkProperties {
  NetworkStatus? get networkStatus {
    final iface = interfaceName;
    if (iface == null) return null;
    return NetworkStatus(
      iface: iface,
      linkAddress: linkAddresses
          .where((e) => e.address is Inet4Address)
          .firstOrNull,
      gateway: routes
          .where((e) => e.isDefaultRoute && e.gateway is Inet4Address)
          .firstOrNull
          ?.gateway,
      dnsServers: dnsServers.whereType<Inet4Address>().toList(),
      domains: domains,
    );
  }
}
