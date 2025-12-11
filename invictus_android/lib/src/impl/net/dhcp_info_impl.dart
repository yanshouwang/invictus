import 'package:invictus_android/src/api.dart';
import 'package:invictus_android/src/impl.dart';
import 'package:invictus_android/src/jni.dart' as jni;

final class DhcpInfoImpl extends InvictusObjectImpl implements DhcpInfo {
  @override
  final jni.DhcpInfo api;

  DhcpInfoImpl.internal(this.api);

  factory DhcpInfoImpl() {
    final api = jni.DhcpInfo();
    return DhcpInfoImpl.internal(api);
  }

  @override
  int get dns1 => api.dns1;

  @override
  int get dns2 => api.dns2;

  @override
  int get gateway => api.gateway;

  @override
  int get ipAddress => api.ipAddress;

  @override
  int get leaseDuration => api.leaseDuration;

  @override
  int get netmask => api.netmask;

  @override
  int get serverAddress => api.serverAddress;
}

extension Invictus$JDhcpInfoX on jni.DhcpInfo {
  DhcpInfo get impl => DhcpInfoImpl.internal(this);
}
