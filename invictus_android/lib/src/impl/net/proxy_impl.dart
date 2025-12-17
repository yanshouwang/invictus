import 'package:invictus_android/src/impl.dart';
import 'package:invictus_android/src/jni.dart' as jni;
import 'package:invictus_api/invictus_api.dart';

final class ProxyImpl extends InvictusObjectImpl implements Proxy {
  @override
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
