import 'package:invictus_android/src/jni.dart' as jni;

abstract base class InvictusObjectImpl {
  jni.JObject get api;

  @override
  int get hashCode => api.hashCode;

  @override
  bool operator ==(Object other) {
    return other is InvictusObjectImpl && other.api == api;
  }

  @override
  String toString() => api.toString();
}
