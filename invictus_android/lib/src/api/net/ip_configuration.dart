import 'package:invictus_android/src/api.dart';
import 'package:invictus_android/src/impl.dart';

enum IpConfiguration$IpAssignment { static, dhcp, unassigned }

abstract interface class IpConfiguration {
  factory IpConfiguration({StaticIpConfiguration? config}) =>
      IpConfigurationImpl(config: config);

  IpConfiguration$IpAssignment get ipAssignment;
  set ipAssignment(IpConfiguration$IpAssignment value);
  StaticIpConfiguration? get staticIpConfiguration;
  set staticIpConfiguration(StaticIpConfiguration? value);
}
