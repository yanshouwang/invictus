import 'package:invictus_android/src/impl.dart';
import 'package:invictus_android/src/jni.dart' as jni;
import 'package:invictus_api/invictus_api.dart';

final class VolumeInfoImpl extends ObjectImpl implements VolumeInfo {
  @override
  final jni.VolumeInfo api;

  VolumeInfoImpl.internal(this.api);

  @override
  String? get description => api.description?.impl;

  @override
  String? get fsLabel => api.fsLabel?.impl;

  @override
  String? get fsType => api.fsType?.impl;

  @override
  String? get fsUuid => api.fsUuid?.impl;

  @override
  String get id => api.id.impl;

  @override
  String? get internalPath => api.internalPath?.impl;

  @override
  bool get isMountedReadable => api.isMountedReadable;

  @override
  bool get isMountedWritable => api.isMountedWritable;

  @override
  bool get isPrimary => api.isPrimary;

  @override
  bool get isPrimaryPhysical => api.isPrimaryPhysical;

  @override
  bool get isVisible => api.isVisible;

  @override
  int get mountUserId => api.mountUserId;

  @override
  String? get normalizedFsUuid => api.normalizedFsUuid?.impl;

  @override
  String? get path => api.path?.impl;

  @override
  VolumeInfo$State get state => api.state.volumeInfo$StateImpl;

  @override
  int get stateDescription => api.stateDescription;

  @override
  VolumeInfo$Type get type => api.type$1.volumeInfo$TypeImpl;
}

extension Invictus$JVolumeInfoX on jni.VolumeInfo {
  VolumeInfo get impl => VolumeInfoImpl.internal(this);
}

extension Invictus$JVolumeInfo$intX on int {
  VolumeInfo$Type get volumeInfo$TypeImpl {
    if (this == jni.VolumeInfo.Companion.tYPE_PUBLIC) return .public;
    if (this == jni.VolumeInfo.Companion.tYPE_PRIVATE) return .private;
    if (this == jni.VolumeInfo.Companion.tYPE_EMULATED) {
      return .emulated;
    }
    if (this == jni.VolumeInfo.Companion.tYPE_ASEC) return .asec;
    if (this == jni.VolumeInfo.Companion.tYPE_OBB) return .obb;
    if (this == jni.VolumeInfo.Companion.tYPE_STUB) return .stub;
    throw ArgumentError.value(this, 'volumeInfo\$Type');
  }

  VolumeInfo$State get volumeInfo$StateImpl {
    if (this == jni.VolumeInfo.Companion.sTATE_UNMOUNTED) {
      return .unmounted;
    }
    if (this == jni.VolumeInfo.Companion.sTATE_CHECKING) {
      return .checking;
    }
    if (this == jni.VolumeInfo.Companion.sTATE_MOUNTED) return .mounted;
    if (this == jni.VolumeInfo.Companion.sTATE_MOUNTED_READ_ONLY) {
      return .mountedReadOnly;
    }
    if (this == jni.VolumeInfo.Companion.sTATE_FORMATTING) {
      return .formatting;
    }
    if (this == jni.VolumeInfo.Companion.sTATE_EJECTING) {
      return .ejecting;
    }
    if (this == jni.VolumeInfo.Companion.sTATE_UNMOUNTABLE) {
      return .unmountable;
    }
    if (this == jni.VolumeInfo.Companion.sTATE_REMOVED) return .removed;
    if (this == jni.VolumeInfo.Companion.sTATE_BAD_REMOVAL) {
      return .badRemoval;
    }
    throw ArgumentError.value(this, 'volumeInfo\$State');
  }
}
