import 'package:invictus_android/src/api.dart';
import 'package:invictus_android/src/jni.dart' as jni;

final class ProxyInfoImpl implements ProxyInfo {
  final jni.ProxyInfo api;

  ProxyInfoImpl.internal(this.api);
}

extension Invictus$ProxyInfoX on ProxyInfo {
  jni.ProxyInfo get api {
    final impl = this;
    if (impl is! ProxyInfoImpl) throw TypeError();
    return impl.api;
  }
}

extension Invictus$JProxyInfoX on jni.ProxyInfo {
  ProxyInfo get impl => ProxyInfoImpl.internal(this);
}
