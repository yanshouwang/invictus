import 'package:invictus_android/src/api.dart';
import 'package:invictus_android/src/impl.dart';
import 'package:invictus_android/src/jni.dart' as jni;

final class IpConfigurationImpl extends InvictusObjectImpl
    implements IpConfiguration {
  @override
  final jni.IpConfiguration api;

  IpConfigurationImpl.internal(this.api);

  factory IpConfigurationImpl({StaticIpConfiguration? config}) {
    final builder = jni.IpConfiguration$Builder.new$1();
    builder.setStaticIpConfiguration(config?.api);
    final api = builder.build();
    return IpConfigurationImpl.internal(api);
  }

  @override
  IpConfiguration$IpAssignment get ipAssignment => api.getIpAssignment().impl;

  @override
  set ipAssignment(IpConfiguration$IpAssignment value) =>
      api.setIpAssignment(value.api);

  @override
  StaticIpConfiguration? get staticIpConfiguration =>
      api.getStaticIpConfiguration()?.impl;

  @override
  set staticIpConfiguration(StaticIpConfiguration? value) =>
      api.setStaticIpConfiguration(value?.api);
}

extension Invictus$IpConfiguration$IpAssignmentX
    on IpConfiguration$IpAssignment {
  jni.IpConfiguration$IpAssignment get api {
    switch (this) {
      case IpConfiguration$IpAssignment.static:
        return jni.IpConfiguration$IpAssignment.STATIC;
      case IpConfiguration$IpAssignment.dhcp:
        return jni.IpConfiguration$IpAssignment.DHCP;
      case IpConfiguration$IpAssignment.unassigned:
        return jni.IpConfiguration$IpAssignment.UNASSIGNED;
    }
  }
}

extension Invictus$JIpConfiguration$IpAssignmentX
    on jni.IpConfiguration$IpAssignment {
  IpConfiguration$IpAssignment get impl {
    final api = this;
    if (api == jni.IpConfiguration$IpAssignment.STATIC) {
      return IpConfiguration$IpAssignment.static;
    }
    if (api == jni.IpConfiguration$IpAssignment.DHCP) {
      return IpConfiguration$IpAssignment.dhcp;
    }
    if (api == jni.IpConfiguration$IpAssignment.UNASSIGNED) {
      return IpConfiguration$IpAssignment.unassigned;
    }
    throw ArgumentError.value(api, 'api');
  }
}

extension Invictus$IpConfigurationX on IpConfiguration {
  jni.IpConfiguration get api {
    final impl = this;
    if (impl is! IpConfigurationImpl) throw TypeError();
    return impl.api;
  }
}

extension Invictus$JIpConfigurationX on jni.IpConfiguration {
  IpConfiguration get impl => IpConfigurationImpl.internal(this);
}
