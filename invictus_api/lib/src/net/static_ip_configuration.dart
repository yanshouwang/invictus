import 'package:invictus_api/invictus_api.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

abstract interface class StaticIpConfiguration {
  factory StaticIpConfiguration({
    LinkAddress? ipAddress,
    InetAddress? gateway,
    Iterable<InetAddress>? dnsServers,
    String? domains,
  }) => StaticIpConfigurationChannel.instance.create(
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

abstract base class StaticIpConfigurationChannel extends PlatformInterface {
  /// Constructs a [StaticIpConfigurationChannel].
  StaticIpConfigurationChannel() : super(token: _token);

  static final Object _token = Object();

  static StaticIpConfigurationChannel? _instance;

  /// The default instance of [StaticIpConfigurationChannel] to use.
  static StaticIpConfigurationChannel get instance =>
      ArgumentError.checkNotNull(_instance, 'instance');

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [StaticIpConfigurationChannel] when
  /// they register themselves.
  static set instance(StaticIpConfigurationChannel instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  StaticIpConfiguration create({
    LinkAddress? ipAddress,
    InetAddress? gateway,
    Iterable<InetAddress>? dnsServers,
    String? domains,
  });
}
