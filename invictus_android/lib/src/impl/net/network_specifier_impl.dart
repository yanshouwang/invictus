import 'package:invictus_android/src/impl.dart';
import 'package:invictus_android/src/jni.dart' as jni;
import 'package:invictus_api/invictus_api.dart';

final class NetworkSpecifierImpl extends InvictusObjectImpl
    implements NetworkSpecifier {
  @override
  final jni.NetworkSpecifier api;

  NetworkSpecifierImpl.internal(this.api);
}

extension Invictus$NetworkSpecifierX on NetworkSpecifier {
  jni.NetworkSpecifier get api {
    final impl = this;
    if (impl is! NetworkSpecifierImpl) throw TypeError();
    return impl.api;
  }
}

extension Invictus$JNetworkSpecifierX on jni.NetworkSpecifier {
  NetworkSpecifier get impl => NetworkSpecifierImpl.internal(this);
}
