import 'package:invictus_android/src/impl.dart';
import 'package:invictus_android/src/jni.dart' as jni;
import 'package:invictus_api/invictus_api.dart';

final class StorageVolumeImpl extends ObjectImpl implements StorageVolume {
  @override
  final jni.StorageVolume api;
  final jni.InvictusStorageVolume invictusApi;

  StorageVolumeImpl.internal(this.api)
    : invictusApi = jni.InvictusStorageVolume(api);

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
  String get id => invictusApi.id.impl;

  @override
  String get internalPath => invictusApi.internalPath.impl;

  @override
  bool get isEmulated => api.isEmulated;

  @override
  bool get isPrimary => api.isPrimary;

  @override
  bool get isRemovable => api.isRemovable;

  @override
  int get maxFileSize => invictusApi.maxFileSize;

  @override
  String? get mediaStoreVolumeName => api.mediaStoreVolumeName?.impl;

  @override
  String get path => invictusApi.path.impl;

  @override
  Environment$Media get state {
    final stateApiOrNull = api.state;
    final stateApi = ArgumentError.checkNotNull(stateApiOrNull, 'stateApi');
    return stateApi.environment$MediaImpl;
  }

  @override
  String get userLabel => invictusApi.userLabel.impl;

  @override
  String? get uuid => api.uuid?.impl;
}

extension Invictus$JStorageVolumeX on jni.StorageVolume {
  StorageVolume get impl => StorageVolumeImpl.internal(this);
}
