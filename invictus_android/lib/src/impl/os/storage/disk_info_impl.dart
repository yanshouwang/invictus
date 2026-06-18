import 'package:invictus_android/src/impl.dart';
import 'package:invictus_android/src/jni.dart' as jni;
import 'package:invictus_api/invictus_api.dart';

final class DiskInfoImpl extends ObjectImpl implements DiskInfo {
  @override
  final jni.InvictusDiskInfo api;

  DiskInfoImpl.internal(this.api);
}

extension Invictus$JDiskInfoX on jni.InvictusDiskInfo {
  DiskInfo get impl => DiskInfoImpl.internal(this);
}
