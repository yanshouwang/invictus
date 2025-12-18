import 'package:invictus_android/src/impl.dart';
import 'package:invictus_android/src/jni.dart' as jni;
import 'package:invictus_api/invictus_api.dart';

final class InetSocketAddressImpl extends ObjectImpl
    implements InetSocketAddress {
  @override
  final jni.InetSocketAddress api;

  InetSocketAddressImpl.internal(this.api);
}

extension Invictus$InetSocketAddressX on InetSocketAddress {
  jni.InetSocketAddress get api {
    final impl = this;
    if (impl is! InetSocketAddressImpl) throw TypeError();
    return impl.api;
  }
}
