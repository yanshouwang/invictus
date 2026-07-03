import 'package:invictus_android/src/impl.dart';
import 'package:invictus_android/src/jni.dart' as jni;
import 'package:invictus_api/invictus_api.dart';

final class StorageVolumeImpl extends ObjectImpl implements StorageVolume {
  @override
  final jni.StorageVolume api;

  StorageVolumeImpl.internal(this.api);

  @override
  String get description {
    final descriptionApiOrNull = api.getDescription(jni.context);
    final descriptionApi = ArgumentError.checkNotNull(
      descriptionApiOrNull,
      'descriptionApi',
    );
    return descriptionApi.impl;
  }

  @override
  int get fatVolumeId => jni.StorageVolumeCompat.INSTANCE.getFatVolumeId(api);

  @override
  String get id => jni.StorageVolumeCompat.INSTANCE.getId(api).impl;

  @override
  String get internalPath =>
      jni.StorageVolumeCompat.INSTANCE.getInternalPath(api).impl;

  @override
  bool get isEmulated => api.isEmulated;

  @override
  bool get isPrimary => api.isPrimary;

  @override
  bool get isRemovable => api.isRemovable;

  @override
  int get maxFileSize => jni.StorageVolumeCompat.INSTANCE.getMaxFileSize(api);

  @override
  String get path => jni.StorageVolumeCompat.INSTANCE.getPath(api).impl;

  @override
  Environment$Media get state {
    final stateApiOrNull = api.state;
    final stateApi = ArgumentError.checkNotNull(stateApiOrNull, 'stateApi');
    return stateApi.environment$MediaImpl;
  }

  @override
  String get userLabel =>
      jni.StorageVolumeCompat.INSTANCE.getUserLabel(api).impl;

  @override
  String? get uuid => api.uuid?.impl;
}

extension Invictus$JStorageVolumeX on jni.StorageVolume {
  StorageVolume get impl => StorageVolumeImpl.internal(this);
}
