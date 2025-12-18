import 'package:invictus_android/src/impl.dart';
import 'package:invictus_android/src/jni.dart' as jni;
import 'package:invictus_api/invictus_api.dart';

base mixin CloseableImpl on ObjectImpl, AutoCloseableImpl implements Closeable {
  @override
  jni.JObject get api;
}
