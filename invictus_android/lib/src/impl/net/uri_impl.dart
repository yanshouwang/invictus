import 'package:invictus_android/src/impl.dart';
import 'package:invictus_android/src/jni.dart' as jni;
import 'package:invictus_api/invictus_api.dart';

final class UriImpl extends ObjectImpl implements Uri {
  @override
  final jni.Uri api;

  UriImpl.internal(this.api);
}

extension Invictus$UriX on Uri {
  jni.Uri get api {
    final impl = this;
    if (impl is! UriImpl) throw TypeError();
    return impl.api;
  }
}

extension Invictus$JUriX on jni.Uri {
  Uri get impl => UriImpl.internal(this);
}
