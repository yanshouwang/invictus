import 'package:invictus_android/src/impl.dart';
import 'package:invictus_android/src/jni.dart' as jni;

base mixin ComparableImpl<T> on ObjectImpl implements Comparable<T> {
  @override
  int compareTo(T other) {
    if (other is! ObjectImpl) throw TypeError();
    return api.as(jni.Comparable.type(jni.JObject.type)).compareTo(other.api);
  }
}
