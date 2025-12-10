import 'package:invictus_android/src/api.dart';
import 'package:invictus_android/src/jni.dart' as jni;

final class UrlImpl implements Url {
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
