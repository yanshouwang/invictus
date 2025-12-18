import 'package:invictus_android/src/impl.dart';
import 'package:invictus_android/src/jni.dart' as jni;
import 'package:invictus_api/invictus_api.dart';

base mixin FlushableImpl on ObjectImpl implements Flushable {
  @override
  jni.JObject get api;

  @override
  void flush() => api.as(jni.Flushable.type).flush();
}
