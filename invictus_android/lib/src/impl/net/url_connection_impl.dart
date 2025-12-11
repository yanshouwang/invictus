import 'package:invictus_android/src/api.dart';
import 'package:invictus_android/src/impl.dart';
import 'package:invictus_android/src/jni.dart' as jni;

final class UrlConnectionImpl extends InvictusObjectImpl
    implements UrlConnection {
  @override
  final jni.URLConnection api;

  UrlConnectionImpl.internal(this.api);
}

extension Invictus$JUrlConnectionX on jni.URLConnection {
  UrlConnection get impl => UrlConnectionImpl.internal(this);
}
