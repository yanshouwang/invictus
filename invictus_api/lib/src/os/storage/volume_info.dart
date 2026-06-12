enum VolumeInfo$Type { public, private, emulated, asec, obb, stub }

enum VolumeInfo$State {
  unmounted,
  checking,
  mounted,
  mountedReadOnly,
  formatting,
  ejecting,
  unmountable,
  removed,
  badRemoval,
}

enum VolumeInfo$MountFlag { primary, visibleForRead, vidibleForWrite }

abstract interface class VolumeInfo {
  // String? get partGuid;
  // Set<VolumeInfo$MountFlag> get mountFlags;
  String? get fsType;
  String? get fsLabel;
  String? get path;
  String? get internalPath;

  String get id;
  // DiskInfo? get disk;
  // String? get diskId;
  VolumeInfo$Type get type;
  VolumeInfo$State get state;
  int get stateDescription;
  String? get fsUuid;
  String? get normalizedFsUuid;
  int get mountUserId;
  String? get description;
  bool get isMountedReadable;
  bool get isMountedWritable;
  bool get isPrimary;
  bool get isPrimaryPhysical;
  bool get isVisible;

  // bool isVisibleForUser(int userId);
  // bool isPrimaryEmulatedForUser(int userId);
  // bool isVisibleForRead(int userId);
  // bool isVisibleForWrite(int userId);
  // String? getPathForUser(int userId);
  // String? getInternalPathForUser(int userId);
  // StorageVolume buildStorageVolume(int userId, bool reportUnmounted);
  // Intent? buildBrowseIntent();
  // Intent? buildBrowseIntentForUser(int userId);
  // VolumeInfo clone();
}
