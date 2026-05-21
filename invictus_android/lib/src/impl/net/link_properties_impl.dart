import 'package:invictus_android/src/impl.dart';
import 'package:invictus_android/src/jni.dart' as jni;
import 'package:invictus_api/invictus_api.dart';

final class LinkPropertiesImpl extends ObjectImpl implements LinkProperties {
  @override
  final jni.LinkProperties api;

  LinkPropertiesImpl.internal(this.api);

  @override
  Inet4Address? get dhcpServerAddress => api.dhcpServerAddress?.impl;
  @override
  set dhcpServerAddress(Inet4Address? value) =>
      api.dhcpServerAddress = value?.api;

  @override
  List<InetAddress> get dnsServers =>
      api.dnsServers.asDart().nonNulls.map((e) => e.impl).toList();
  @override
  set dnsServers(List<InetAddress> value) => api.dnsServers$1 =
      value.map((e) => e.api).toJList() as jni.Collection<jni.InetAddress>;

  @override
  String? get domains => api.domains?.impl;
  @override
  set domains(String? value) => api.domains = value?.api;

  @override
  ProxyInfo? get httpProxy => api.httpProxy?.impl;
  @override
  set httpProxy(ProxyInfo? value) => api.httpProxy = value?.api;

  @override
  String? get interfaceName => api.interfaceName?.impl;
  @override
  set interfaceName(String? value) => api.interfaceName = value?.api;

  @override
  List<LinkAddress> get linkAddresses =>
      api.linkAddresses.asDart().nonNulls.map((e) => e.impl).toList();
  @override
  set linkAddresses(List<LinkAddress> value) => api.linkAddresses$1 =
      value.map((e) => e.api).toJList() as jni.Collection<jni.LinkAddress>;

  @override
  int get mtu => api.mtu;
  @override
  set mtu(int value) => api.mtu = value;

  @override
  IpPrefix? get nat64Prefix => api.nat64Prefix?.impl;
  @override
  set nat64Prefix(IpPrefix? value) => api.nat64Prefix = value?.api;

  @override
  bool get isPrivateDnsActive => api.isPrivateDnsActive;

  @override
  bool get isWakeOnLanSupported => api.isWakeOnLanSupported;

  @override
  String? get privateDnsServerName => api.privateDnsServerName?.impl;

  @override
  List<RouteInfo> get routes =>
      api.routes.asDart().nonNulls.map((e) => e.impl).toList();

  @override
  bool addRoute(RouteInfo route) => api.addRoute(route.api);

  @override
  void clear() => api.clear();
}

extension Invictus$JLinkPropertiesX on jni.LinkProperties {
  LinkProperties get impl => LinkPropertiesImpl.internal(this);
}
