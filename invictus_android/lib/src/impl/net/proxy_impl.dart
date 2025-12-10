import 'package:invictus_android/src/api.dart';
import 'package:invictus_android/src/jni.dart' as jni;

final class ProxyImpl implements Proxy {
  final jni.Proxy api;

  ProxyImpl.internal(this.api);
}

extension Invictus$ProxyX on Proxy {
  jni.Proxy get api {
    final impl = this;
    if (impl is! ProxyImpl) throw TypeError();
    return impl.api;
  }
}
