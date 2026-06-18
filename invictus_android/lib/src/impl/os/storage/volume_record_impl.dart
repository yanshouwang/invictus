import 'package:invictus_android/src/impl.dart';
import 'package:invictus_android/src/jni.dart' as jni;
import 'package:invictus_api/invictus_api.dart';

final class VolumeRecordImpl extends ObjectImpl implements VolumeRecord {
  @override
  final jni.InvictusVolumeRecord api;

  VolumeRecordImpl.internal(this.api);
}

extension Invictus$JVolumeRecordX on jni.InvictusVolumeRecord {
  VolumeRecord get impl => VolumeRecordImpl.internal(this);
}
