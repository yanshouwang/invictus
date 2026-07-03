import 'package:invictus_android/src/impl.dart';
import 'package:invictus_android/src/jni.dart' as jni;
import 'package:invictus_api/invictus_api.dart';

final class StorageManagerImpl extends ObjectImpl implements StorageManager {
  @override
  final jni.StorageManager api;

  StorageManagerImpl.internal(this.api);

  jni.Executor get executorApi =>
      ArgumentError.checkNotNull(jni.context.mainExecutor, 'mainExecutor');

  @override
  void format(String volId) =>
      jni.StorageManagerCompat.INSTANCE.format(api, volId.api);

  @override
  String? getMountedObbPath(String rawPath) =>
      api.getMountedObbPath(rawPath.api)?.impl;

  @override
  bool isObbMounted(String rawPath) => api.isObbMounted(rawPath.api);

  @override
  void mount(String volId) =>
      jni.StorageManagerCompat.INSTANCE.mount(api, volId.api);

  @override
  bool mountObb(
    String rawPath,
    String key,
    OnObbStateChangeListener listener,
  ) => api.mountObb(rawPath.api, key.api, listener.api);

  @override
  StorageVolume get primaryStorageVolume => api.primaryStorageVolume.impl;

  @override
  void registerListener(StorageEventListener listener) =>
      jni.StorageManagerCompat.INSTANCE.registerListener(api, listener.api);

  @override
  void registerStorageVolumeCallback(
    StorageManager$StorageVolumeCallback callback,
  ) => jni.StorageManagerCompat.INSTANCE.registerStorageVolumeCallback(
    api,
    executorApi,
    callback.api,
  );

  @override
  List<StorageVolume> get storageVolumes =>
      api.storageVolumes.asDart().nonNulls.map((e) => e.impl).toList();

  @override
  void unmount(String volId) =>
      jni.StorageManagerCompat.INSTANCE.unmount(api, volId.api);

  @override
  bool unmountObb(
    String rawPath,
    bool force,
    OnObbStateChangeListener listener,
  ) => api.unmountObb(rawPath.api, force, listener.api);

  @override
  void unregisterListener(StorageEventListener listener) =>
      jni.StorageManagerCompat.INSTANCE.unregisterListener(api, listener.api);

  @override
  void unregisterStorageVolumeCallback(
    StorageManager$StorageVolumeCallback callback,
  ) => jni.StorageManagerCompat.INSTANCE.unregisterStorageVolumeCallback(
    api,
    callback.api,
  );

  @override
  VolumeInfo? findVolumeById(String id) =>
      jni.StorageManagerCompat.INSTANCE.findVolumeById(api, id.api)?.impl;

  @override
  List<VolumeInfo> get volumes => jni.StorageManagerCompat.INSTANCE
      .getVolumes(api)
      .asDart()
      .map((e) => e.impl)
      .toList();
}

final class StorageManager$StorageVolumeCallbackImpl extends ObjectImpl
    implements StorageManager$StorageVolumeCallback {
  @override
  final jni.StorageManagerCompat$StorageVolumeCallbackCompat api;

  StorageManager$StorageVolumeCallbackImpl.internal(this.api);
}

final class StorageManagerChannelImpl extends StorageManagerChannel {
  @override
  StorageManager$StorageVolumeCallback createStorageVolumeCallback({
    required void Function(StorageVolume volume) onStateChanged,
  }) {
    final api = jni.JniStorageManagerCompat$JniStorageVolumeCallbackCompatImpl(
      jni.context,
      jni.JniStorageManagerCompat$JniStorageVolumeCallbackCompat.implement(
        jni.$JniStorageManagerCompat$JniStorageVolumeCallbackCompat(
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
  jni.StorageManagerCompat$StorageVolumeCallbackCompat get api {
    final impl = this;
    if (impl is! StorageManager$StorageVolumeCallbackImpl) throw TypeError();
    return impl.api;
  }
}
