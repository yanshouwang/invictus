import 'package:invictus_android/src/impl.dart';
import 'package:invictus_android/src/jni.dart' as jni;
import 'package:invictus_api/invictus_api.dart';

final class DhcpInfoImpl extends ObjectImpl implements DhcpInfo {
  @override
  final jni.DhcpInfo api;

  DhcpInfoImpl.internal(this.api);

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

final class DhcpInfoChannelImpl extends DhcpInfoChannel {
  @override
  DhcpInfo create() {
    final api = jni.DhcpInfo();
    return DhcpInfoImpl.internal(api);
  }
}

extension Invictus$JDhcpInfoX on jni.DhcpInfo {
  DhcpInfo get impl => DhcpInfoImpl.internal(this);
}
