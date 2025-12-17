import 'package:invictus_api/invictus_api.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

enum IpConfiguration$IpAssignment { static, dhcp, unassigned }

abstract interface class IpConfiguration {
  factory IpConfiguration({StaticIpConfiguration? config}) =>
      IpConfigurationChannel.instance.create(config: config);

  IpConfiguration$IpAssignment get ipAssignment;
  set ipAssignment(IpConfiguration$IpAssignment value);
  StaticIpConfiguration? get staticIpConfiguration;
  set staticIpConfiguration(StaticIpConfiguration? value);
}

abstract base class IpConfigurationChannel extends PlatformInterface {
  /// Constructs a [IpConfigurationChannel].
  IpConfigurationChannel() : super(token: _token);

  static final Object _token = Object();

  static IpConfigurationChannel? _instance;

  /// The default instance of [IpConfigurationChannel] to use.
  static IpConfigurationChannel get instance =>
      ArgumentError.checkNotNull(_instance, 'instance');

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [IpConfigurationChannel] when
  /// they register themselves.
  static set instance(IpConfigurationChannel instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  IpConfiguration create({StaticIpConfiguration? config});
}
