import 'package:invictus_android/src/impl.dart';
import 'package:invictus_android/src/jni.dart' as jni;
import 'package:invictus_api/invictus_api.dart';

final class UrlConnectionImpl extends ObjectImpl implements UrlConnection {
  @override
  final jni.URLConnection api;

  UrlConnectionImpl.internal(this.api);
}

extension Invictus$JUrlConnectionX on jni.URLConnection {
  UrlConnection get impl => UrlConnectionImpl.internal(this);
}
