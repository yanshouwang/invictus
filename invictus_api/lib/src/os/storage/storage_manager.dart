import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'on_obb_state_change_listener.dart';
import 'storage_event_listener.dart';
import 'storage_volume.dart';
import 'volume_info.dart';

enum StorageManager$MountMode {
  /// No external storage should be mounted.
  externalNone,

  /// Default external storage should be mounted.
  externalDefault,

  /// Mount mode for package installers which should give them access to all obb dirs in addition to their package sandboxes
  externalInstaller,

  /// The lower file system should be bind mounted directly on external storage
  externalPassThrough,

  /// Use the regular scoped storage filesystem, but Android/ should be writable.
  ///
  /// Used to support the applications hosting DownloadManager and the MTP server.
  externalAndroidWritable,
}

abstract interface class StorageManager {
  // static bool get isEncrypted => StorageManagerChannel.instance.isEncrypted;
  // static bool get isFileEncryptedNativeOnly =>
  //     StorageManagerChannel.instance.isFileEncryptedNativeOnly;
  // static bool get isFileEncryptedEmulatedOnly =>
  //     StorageManagerChannel.instance.isFileEncryptedEmulatedOnly;
  // static bool get isFileEncryptedNativeOrEmulated =>
  //     StorageManagerChannel.instance.isFileEncryptedNativeOrEmulated;
  // static bool get hasAdoptable => StorageManagerChannel.instance.hasAdoptable;
  // static bool get hasIsolatedStorage =>
  //     StorageManagerChannel.instance.hasIsolatedStorage;

  // static List<StorageVolume> getVolumeList(int userId, int flags) =>
  //     StorageManagerChannel.instance.getVolumeList(userId, flags);

  // static StorageVolume getPrimaryVolume(List<StorageVolume> volumes) =>
  //     StorageManagerChannel.instance.getPrimaryVolume(volumes);

  // static bool isUserKeyUnlocked(int userId) =>
  //     StorageManagerChannel.instance.isUserKeyUnlocked(userId);

  // static bool checkPermissionAndAppOp(
  //   bool enforce,
  //   int pid,
  //   int uid,
  //   String packageName,
  //   String featureId,
  //   String permission,
  //   int op,
  // ) => StorageManagerChannel.instance.checkPermissionAndAppOp(
  //   enforce,
  //   pid,
  //   uid,
  //   packageName,
  //   featureId,
  //   permission,
  //   op,
  // );

  // static bool checkPermissionAndCheckOp(
  //   bool enforce,
  //   int pid,
  //   int uid,
  //   String packageName,
  //   String permission,
  //   int op,
  // ) => StorageManagerChannel.instance.checkPermissionAndCheckOp(
  //   enforce,
  //   pid,
  //   uid,
  //   packageName,
  //   permission,
  //   op,
  // );

  // static bool isFatVolumeIdentifier(String uuid) =>
  //     StorageManagerChannel.instance.isFatVolumeIdentifier(uuid);

  factory StorageManager() =>
      StorageManagerChannel.instance.getStorageManager();

  // @Deprecated(null)
  // bool get isUsbMassStorageConnected;
  // @Deprecated(null)
  // bool get isUsbMassStorageEnabled;
  // List<DiskInfo> get disks;
  List<VolumeInfo> get volumes;
  // List<VolumeInfo> get writablePrivateVolumes;
  // List<VolumeRecord> get volumeRecords;
  // VolumeInfo? get primaryPhysicalVolume;
  List<StorageVolume> get storageVolumes;
  // List<StorageVolume> get storageVolumesIncludingSharedProfiles;
  // List<StorageVolume> get recentStorageVolumes;
  StorageVolume get primaryStorageVolume;
  // int get primaryStorageSize;
  // List<StorageVolume> get volumeList;
  // List<String> get volumePaths;
  // StorageVolume get primaryVolume;
  // bool get isCheckpointSupported;
  // String? get cloudMediaProvider;
  // set cloudMediaProvider(String? authority);

  void registerListener(StorageEventListener listener);
  void unregisterListener(StorageEventListener listener);
  void registerStorageVolumeCallback(
    StorageManager$StorageVolumeCallback callback,
  );
  void unregisterStorageVolumeCallback(
    StorageManager$StorageVolumeCallback callback,
  );
  // @Deprecated(null)
  // void enableUsbMassStorage();
  // @Deprecated(null)
  // void disableUsbMassStorage();
  bool mountObb(String rawPath, String key, OnObbStateChangeListener listener);
  // PendingIntent? getManageSpaceActivityIntent(
  //   String packageName,
  //   int requestCode,
  // );
  bool unmountObb(
    String rawPath,
    bool force,
    OnObbStateChangeListener listener,
  );
  bool isObbMounted(String rawPath);
  String? getMountedObbPath(String rawPath);
  // DiskInfo? findDiskById(String id);
  VolumeInfo? findVolumeById(String id);
  // VolumeInfo? findVolumeByUuid(String fsUuid);
  // VolumeRecord? findRecordByUuid(String fsUuid);
  // VolumeInfo? findPrivateForEmulated(VolumeInfo? emulatedVol);
  // VolumeInfo? findEmulatedForPrivate(VolumeInfo? privateVol);
  // VolumeInfo? findVolumeByQualifiedUuid(String volumeUuid);
  // UUID getUuidForPath(File path);
  // File findPathForUuid(String volumeUuid);
  // bool isAllocationSupported(FileDescriptor fd);
  // String? getBestVolumeDescription(VolumeInfo vol);
  void mount(String volId);
  void unmount(String volId);
  void format(String volId);
  // @Deprecated(null)
  // int benchmark(String volId);
  // void benchmark(String volId, VoldTaskListener listener);
  // void partitionPublic(String diskId);
  // void partitionPrivate(String diskId);
  // void partitionMixed(String diskId, int ratio);
  // void wipeAdoptableDisks();
  // void setVolumeNickname(String fsUuid, String nickname);
  // void setVolumeInited(String fsUuid, bool inited);
  // void setVolumeSnoozed(String fsUuid, bool snoozed);
  // void forgetVolume(String fsUuid);
  // String getPrimaryStorageUuid();
  // void setPrimaryStorageUuid(String volumeUuid, PackageMoveObserver callback);
  // StorageVolume? getStorageVolume(File file);
  // StorageVolume getStorageVolume(net.Uri uri);
  // StorageVolume? getStorageVolume(File file, int userId);
  // @Deprecated(null)
  // String getVolumeState(String mountPoint);
  // void mkdirs(File file);
  // int getStorageBytesUntilLow(File file);
  // int getStorageLowBytes(File file);
  // int computeStorageCacheBytes(File path);
  // int computeStorageCacheBytes(File path, int flags);
  // int getStorageFullBytes(File path);
  // void createUserKey(int userId, int serialNumber, bool ephemeral);
  // void destroyUserKey(int userId);
  // void unlockUserKey(int userId, int serialNumber, Uint8List secret);
  // void lockUserKey(int userId);
  // void prepareUserStorage(
  //   String volumeUuid,
  //   int userId,
  //   int serialNumber,
  //   int flags,
  // );
  // void destroyUserStorage(String volumeUuid, int userId, int flags);
  // bool isEncrypted(File file);
  // File translateAppToSystem(File file, int pid, int uid);
  // File translateSystemToApp(File file, int pid, int uid);
  // bool checkPermissionReadAudio(
  //   bool enforce,
  //   int pid,
  //   int uid,
  //   String packageName,
  //   String? featureId,
  // );
  // bool checkPermissionWriteAudio(
  //   bool enforce,
  //   int pid,
  //   int uid,
  //   String packageName,
  //   String? featureId,
  // );
  // bool checkPermissionReadVideo(
  //   bool enforce,
  //   int pid,
  //   int uid,
  //   String packageName,
  //   String? featureId,
  // );
  // bool checkPermissionWriteVideo(
  //   bool enforce,
  //   int pid,
  //   int uid,
  //   String packageName,
  //   String? featureId,
  // );
  // bool checkPermissionReadImages(
  //   bool enforce,
  //   int pid,
  //   int uid,
  //   String packageName,
  //   String? featureId,
  // );
  // bool checkPermissionWriteImages(
  //   bool enforce,
  //   int pid,
  //   int uid,
  //   String packageName,
  //   String? featureId,
  // );
  // ParcelFileDescriptor openProxyFileDescriptor(
  //   int mode,
  //   ProxyFileDescriptorCallback callback,
  // );
  // int getCacheQuotaBytes(UUID storageUuid);
  // int getCacheSizeBytes(UUID storageUuid);
  // int getAllocatableBytes(UUID storageUuid);
  // int getAllocatableBytes(UUID storageUuid, int flags);
  // void allocateBytes(UUID storageUuid, int bytes);
  // void allocateBytes(UUID storageUuid, int bytes, int flags);
  // StorageManager$MountMode getExternalStorageMountMode(
  //   int uid,
  //   String packageName,
  // );
  // void allocateBytes(FileDescriptor fd, int bytes);
  // void updateExternalStorageFileQuotaType(File path, int quotaType);
  // void fixupAppDir(File path);
  // void setCacheBehavioGroup(File path, bool group);
  // bool isCacheBehaviorGroup(File path);
  // void setCacheBehaviorTombstone(File path, bool tombstone);
  // bool isCacheBehaviorTombstone(File path);
  // void notifyAppIoBlocked(UUID volumeUuid, int uid, int tid, int reason);
  // void notifyAppIoResumed(UUID volumeUuid, int uid, int tid, int reason);
  // bool isAppIoBlocked(UUID volumeUuid, int uid, int tid, int reason);
}

abstract interface class StorageManager$StorageVolumeCallback {
  factory StorageManager$StorageVolumeCallback({
    required void Function(StorageVolume volume) onStateChanged,
  }) => StorageManagerChannel.instance.createStorageVolumeCallback(
    onStateChanged: onStateChanged,
  );
}

abstract base class StorageManagerChannel extends PlatformInterface {
  /// Constructs a [StorageManagerChannel].
  StorageManagerChannel() : super(token: _token);

  static final Object _token = Object();

  static StorageManagerChannel? _instance;

  /// The default instance of [StorageManagerChannel] to use.
  static StorageManagerChannel get instance =>
      ArgumentError.checkNotNull(_instance, 'instance');

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [StorageManagerChannel] when
  /// they register themselves.
  static set instance(StorageManagerChannel instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  // bool get isEncrypted;
  // bool get isFileEncryptedNativeOnly;
  // bool get isFileEncryptedEmulatedOnly;
  // bool get isFileEncryptedNativeOrEmulated;
  // bool get hasAdoptable;
  // bool get hasIsolatedStorage;

  StorageManager getStorageManager();
  StorageManager$StorageVolumeCallback createStorageVolumeCallback({
    required void Function(StorageVolume volume) onStateChanged,
  });
  // StorageVolume? getStorageVolume(File file, int userId);
  // Pair<String, int> getPrimaryStoragePathAndSize();
  // List<StorageVolume> getVolumeList(int userId, int flags);
  // StorageVolume getPrimaryVolume(List<StorageVolume> volumes);
  // bool isUserKeyUnlocked(int userId);
  // File maybeTranslateEmulatedPathToInternal(File path);
  // bool checkPermissionAndAppOp(
  //   bool enforce,
  //   int pid,
  //   int uid,
  //   String packageName,
  //   String featureId,
  //   String permission,
  //   int op,
  // );
  // bool checkPermissionAndCheckOp(
  //   bool enforce,
  //   int pid,
  //   int uid,
  //   String packageName,
  //   String permission,
  //   int op,
  // );
  // void setCacheBehavior(File path, String name, bool enabled);
  // bool isCacheBehavior(File path, String name);
  // bool isFatVolumeIdentifier(String uuid);
  // UUID convert(String uuid);
  // String convert(UUID storageUuid);
}
