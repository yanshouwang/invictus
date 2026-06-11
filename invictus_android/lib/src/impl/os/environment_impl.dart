import 'package:invictus_android/src/jni.dart' as jni;
import 'package:invictus_api/invictus_api.dart';

extension Invictus$JEnvironment$JStriingX on jni.JString {
  Environment$Media get environment$MediaImpl {
    if (this == jni.Environment.MEDIA_UNKNOWN) return .unknown;
    if (this == jni.Environment.MEDIA_REMOVED) return .removed;
    if (this == jni.Environment.MEDIA_UNMOUNTED) return .unmounted;
    if (this == jni.Environment.MEDIA_CHECKING) return .checking;
    if (this == jni.Environment.MEDIA_NOFS) return .nofs;
    if (this == jni.Environment.MEDIA_MOUNTED) return .mounted;
    if (this == jni.Environment.MEDIA_MOUNTED_READ_ONLY) {
      return .mountedReadOnly;
    }
    if (this == jni.Environment.MEDIA_SHARED) return .shared;
    if (this == jni.Environment.MEDIA_BAD_REMOVAL) return .badRemoval;
    if (this == jni.Environment.MEDIA_UNMOUNTABLE) return .unmountable;
    if (this == jni.Environment.MEDIA_EJECTING) return .ejecting;
    throw ArgumentError.value(this, 'environment\$Media');
  }
}
