import 'package:invictus_android/src/impl.dart';
import 'package:invictus_android/src/jni.dart' as jni;
import 'package:invictus_api/invictus_api.dart';

final class LinkPropertiesImpl extends InvictusObjectImpl
    implements LinkProperties {
  @override
  final jni.LinkProperties api;

  LinkPropertiesImpl.internal(this.api);

  @override
  Inet4Address? get dhcpServerAddress => api.getDhcpServerAddress()?.impl;
  @override
  set dhcpServerAddress(Inet4Address? value) =>
      api.setDhcpServerAddress(value?.api);

  @override
  List<InetAddress> get dnsServers =>
      api.getDnsServers().nonNulls.map((e) => e.impl).toList();
  @override
  set dnsServers(List<InetAddress> value) => api.setDnsServers(
    value
        .map((e) => e.api)
        .toJList(jni.InetAddress.type)
        .as(jni.Collection.type(jni.InetAddress.type)),
  );

  @override
  String? get domains => api.getDomains()?.impl;
  @override
  set domains(String? value) => api.setDomains(value?.api);

  @override
  ProxyInfo? get httpProxy => api.getHttpProxy()?.impl;
  @override
  set httpProxy(ProxyInfo? value) => api.setHttpProxy(value?.api);

  @override
  String? get interfaceName => api.getInterfaceName()?.impl;
  @override
  set interfaceName(String? value) => api.setInterfaceName(value?.api);

  @override
  List<LinkAddress> get linkAddresses =>
      api.getLinkAddresses().nonNulls.map((e) => e.impl).toList();
  @override
  set linkAddresses(List<LinkAddress> value) => api.setLinkAddresses(
    value
        .map((e) => e.api)
        .toJList(jni.LinkAddress.type)
        .as(jni.Collection.type(jni.LinkAddress.type)),
  );

  @override
  int get mtu => api.getMtu();
  @override
  set mtu(int value) => api.setMtu(value);

  @override
  IpPrefix? get nat64Prefix => api.getNat64Prefix()?.impl;
  @override
  set nat64Prefix(IpPrefix? value) => api.setNat64Prefix(value?.api);

  @override
  bool get isPrivateDnsActive => api.isPrivateDnsActive();

  @override
  bool get isWakeOnLanSupported => api.isWakeOnLanSupported();

  @override
  String? get privateDnsServerName => api.getPrivateDnsServerName()?.impl;

  @override
  List<RouteInfo> get routes =>
      api.getRoutes().nonNulls.map((e) => e.impl).toList();

  @override
  bool addRoute(RouteInfo route) => api.addRoute(route.api);

  @override
  void clear() => api.clear();
}

extension Invictus$JLinkPropertiesX on jni.LinkProperties {
  LinkProperties get impl => LinkPropertiesImpl.internal(this);
}
