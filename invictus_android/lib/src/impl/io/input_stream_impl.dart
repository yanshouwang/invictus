import 'package:invictus_android/src/impl.dart';
import 'package:invictus_android/src/jni.dart' as jni;
import 'package:invictus_api/invictus_api.dart';

final class InputStreamImpl extends ObjectImpl
    with AutoCloseableImpl, CloseableImpl
    implements InputStream {
  @override
  final jni.InputStream api;

  InputStreamImpl.internal(this.api);
}

extension Invictus$JInputStreamX on jni.InputStream {
  InputStream get impl => InputStreamImpl.internal(this);
}
