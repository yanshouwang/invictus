import 'package:invictus_android/src/impl.dart';
import 'package:invictus_android/src/jni.dart' as jni;
import 'package:invictus_api/invictus_api.dart';

final class StorageManagerImpl extends ObjectImpl implements StorageManager {
  @override
  final jni.StorageManager api;
  final jni.InvictusStorageManager invictusApi;

  StorageManagerImpl.internal(this.api)
    : invictusApi = jni.InvictusStorageManager(api);

  jni.Executor get executorApi =>
      ArgumentError.checkNotNull(jni.context.mainExecutor, 'mainExecutor');

  @override
  void allocateBytes(FileDescriptor fd, int bytes) =>
      api.allocateBytes(fd.api, bytes);

  @override
  void format(String volId) => invictusApi.format(volId.api);

  @override
  String? getMountedObbPath(String rawPath) =>
      api.getMountedObbPath(rawPath.api)?.impl;

  @override
  bool isAllocationSupported(FileDescriptor fd) =>
      api.isAllocationSupported(fd.api);

  @override
  bool get isCheckpointSupported => api.isCheckpointSupported;

  @override
  bool isObbMounted(String rawPath) => api.isObbMounted(rawPath.api);

  @override
  void mount(String volId) => invictusApi.mount(volId.api);

  @override
  bool mountObb(
    String rawPath,
    String key,
    OnObbStateChangeListener listener,
  ) => api.mountObb(rawPath.api, key.api, listener.api);

  @override
  StorageVolume get primaryStorageVolume => api.primaryStorageVolume.impl;

  @override
  List<StorageVolume> get recentStorageVolumes =>
      api.recentStorageVolumes.asDart().nonNulls.map((e) => e.impl).toList();

  @override
  void registerListener(StorageEventListener listener) =>
      invictusApi.registerListener(listener.api);

  @override
  void registerStorageVolumeCallback(
    StorageManager$StorageVolumeCallback callback,
  ) => invictusApi.registerStorageVolumeCallback(executorApi, callback.api);

  @override
  List<StorageVolume> get storageVolumes =>
      api.storageVolumes.asDart().nonNulls.map((e) => e.impl).toList();

  @override
  List<StorageVolume> get storageVolumesIncludingSharedProfiles => api
      .storageVolumesIncludingSharedProfiles
      .asDart()
      .nonNulls
      .map((e) => e.impl)
      .toList();

  @override
  void unmount(String volId) => invictusApi.unmount(volId.api);

  @override
  bool unmountObb(
    String rawPath,
    bool force,
    OnObbStateChangeListener listener,
  ) => api.unmountObb(rawPath.api, force, listener.api);

  @override
  void unregisterListener(StorageEventListener listener) =>
      invictusApi.unregisterListener(listener.api);

  @override
  void unregisterStorageVolumeCallback(
    StorageManager$StorageVolumeCallback callback,
  ) => invictusApi.unregisterStorageVolumeCallback(callback.api);

  @override
  VolumeInfo? findVolumeById(String id) =>
      invictusApi.findVolumeById(id.api)?.impl;
}

final class StorageManager$StorageVolumeCallbackImpl extends ObjectImpl
    implements StorageManager$StorageVolumeCallback {
  @override
  final jni.InvictusStorageManager$InvictusStorageVolumeCallback api;

  StorageManager$StorageVolumeCallbackImpl.internal(this.api);
}

final class StorageManagerChannelImpl extends StorageManagerChannel {
  @override
  StorageManager$StorageVolumeCallback createStorageVolumeCallback({
    required void Function(StorageVolume volume) onStateChanged,
  }) {
    final api = jni.InvictusStorageManager$JniInvictusStorageVolumeCallbackImpl(
      jni.context,
      jni.InvictusStorageManager$JniInvictusStorageVolumeCallback.implement(
        jni.$InvictusStorageManager$JniInvictusStorageVolumeCallback(
          onStateChanged: (volume) => onStateChanged(volume.impl),
        ),
      ),
    );
    return StorageManager$StorageVolumeCallbackImpl.internal(api);
  }

  @override
  StorageManager getStorageManager() {
    final apiOrNull = jni.ContextCompat.getSystemService<jni.StorageManager>(
      jni.context,
      jni.StorageManager.type.jClass,
    );
    final api = ArgumentError.checkNotNull(apiOrNull, 'api');
    return StorageManagerImpl.internal(api);
  }
}

extension Invictus$StorageManager$StorageVolumeCallbackX
    on StorageManager$StorageVolumeCallback {
  jni.InvictusStorageManager$InvictusStorageVolumeCallback get api {
    final impl = this;
    if (impl is! StorageManager$StorageVolumeCallbackImpl) throw TypeError();
    return impl.api;
  }
}
