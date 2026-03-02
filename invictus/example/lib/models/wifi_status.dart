import 'network_status.dart';

class WifiStatus extends NetworkStatus {
  final String? ssid;

  const WifiStatus({
    required super.iface,
    required this.ssid,
    required super.linkAddress,
    required super.gateway,
    required super.dnsServers,
    required super.domains,
  });
}
