import 'package:invictus_android/src/impl.dart';
import 'package:invictus_android/src/jni.dart' as jni;
import 'package:invictus_api/invictus_api.dart';

final class UrlImpl extends InvictusObjectImpl implements Url {
  @override
  final jni.URL api;

  UrlImpl.internal(this.api);
}

extension Invictus$UrlX on Url {
  jni.URL get api {
    final impl = this;
    if (impl is! UrlImpl) throw TypeError();
    return impl.api;
  }
}
