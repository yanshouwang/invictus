import 'package:invictus_android/src/impl.dart';
import 'package:invictus_android/src/jni.dart' as jni;
import 'package:invictus_api/invictus_api.dart';

base mixin AutoCloseableImpl on ObjectImpl implements AutoCloseable {
  @override
  void close() => api.as(jni.AutoCloseable.type).close();
}
