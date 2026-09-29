import 'package:invictus_android/src/impl.dart';
import 'package:invictus_android/src/jni.dart' as jni;
import 'package:invictus_api/invictus_api.dart';

final class DiskInfoImpl extends ObjectImpl implements DiskInfo {
  @override
  final jni.DiskInfo api;

  DiskInfoImpl.internal(this.api);
}

extension Invictus$JDiskInfoX on jni.DiskInfo {
  DiskInfo get impl => DiskInfoImpl.internal(this);
}
