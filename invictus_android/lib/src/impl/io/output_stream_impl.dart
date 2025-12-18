import 'package:invictus_android/src/impl.dart';
import 'package:invictus_android/src/jni.dart' as jni;
import 'package:invictus_api/invictus_api.dart';

final class OutputStreamImpl extends ObjectImpl
    with AutoCloseableImpl, CloseableImpl, FlushableImpl
    implements OutputStream {
  @override
  final jni.OutputStream api;

  OutputStreamImpl.internal(this.api);
}

extension Invictus$JOutputStreamX on jni.OutputStream {
  OutputStream get impl => OutputStreamImpl.internal(this);
}
