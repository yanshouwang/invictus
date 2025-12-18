import 'network_model.dart';

class WifiModel extends NetworkModel {
  final String? ssid;

  const WifiModel({
    required super.iface,
    required super.ipAddress,
    required super.netmask,
    required super.gateway,
    required super.dnsServers,
    required this.ssid,
  });

  factory WifiModel.fromNetworkModel(NetworkModel model, {String? ssid}) {
    return WifiModel(
      iface: model.iface,
      ipAddress: model.ipAddress,
      netmask: model.netmask,
      gateway: model.gateway,
      dnsServers: model.dnsServers,
      ssid: ssid,
    );
  }

  // TODO: freezed
  WifiModel copyWIth({String? ssid}) {
    return WifiModel(
      iface: iface,
      ipAddress: ipAddress,
      netmask: netmask,
      gateway: gateway,
      dnsServers: dnsServers,
      ssid: ssid,
    );
  }
}
