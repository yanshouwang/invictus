import 'package:invictus_android/src/api.dart';
import 'package:invictus_android/src/impl.dart';
import 'package:invictus_android/src/jni.dart' as jni;

final class StaticIpConfigurationImpl extends InvictusObjectImpl
    implements StaticIpConfiguration {
  @override
  final jni.StaticIpConfiguration api;

  StaticIpConfigurationImpl.internal(this.api);

  factory StaticIpConfigurationImpl({
    LinkAddress? ipAddress,
    InetAddress? gateway,
    Iterable<InetAddress>? dnsServers,
    String? domains,
  }) {
    final builder = jni.StaticIpConfiguration$Builder.new$1();
    if (ipAddress != null) builder.setIpAddress(ipAddress.api);
    builder.setGateway(gateway?.api);
    if (dnsServers != null) {
      builder.setDnsServers(
        dnsServers
            .map((e) => e.api)
            .toJList(jni.InetAddress.type)
            .as(jni.Iterable.type(jni.InetAddress.type)),
      );
    }
    builder.setDomains(domains?.api);
    final api = builder.build();
    return StaticIpConfigurationImpl.internal(api);
  }

  @override
  LinkAddress get ipAddress => api.getIpAddress().impl;

  @override
  InetAddress? get gateway => api.getGateway()?.impl;

  @override
  List<InetAddress> get dnsServers =>
      api.getDnsServers().map((e) => e.impl).toList();

  @override
  String? get domains => api.getDomains()?.impl;

  @override
  void addDnsServer(InetAddress server) => api.addDnsServer(server.api);

  @override
  void clear() => api.clear();

  @override
  List<RouteInfo> getRoutes([String? iface]) =>
      api.getRoutes(iface?.api).map((e) => e.impl).toList();

  @override
  LinkProperties toLinkProperties([String? iface]) =>
      api.toLinkProperties(iface?.api).impl;
}

extension Invictus$StaticIpConfigurationX on StaticIpConfiguration {
  jni.StaticIpConfiguration get api {
    final impl = this;
    if (impl is! StaticIpConfigurationImpl) throw TypeError();
    return impl.api;
  }
}

extension Invictus$JStaticIpConfigurationX on jni.StaticIpConfiguration {
  StaticIpConfiguration get impl => StaticIpConfigurationImpl.internal(this);
}
