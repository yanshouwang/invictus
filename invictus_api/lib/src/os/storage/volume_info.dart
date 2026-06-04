import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'disk_info.dart';
import 'storage_volume.dart';

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
  String get id;
  DiskInfo? get disk;
  String? get diskId;
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
  String get partGuid;
  Set<VolumeInfo$MountFlag> get mountFlags;
  String get fsType;
  String get fsLabel;
  String? get path;
  String? get internalPath;

  bool isVisibleForUser(int userId);
  bool isPrimaryEmulatedForUser(int userId);
  bool isVisibleForRead(int userId);
  bool isVisibleForWrite(int userId);
  String? getPathForUser(int userId);
  String? getInternalPathForUser(int userId);
  StorageVolume buildStorageVolume(int userId, bool reportUnmounted);
  // Intent? buildBrowseIntent();
  // Intent? buildBrowseIntentForUser(int userId);
  VolumeInfo clone();
}

abstract base class VolumeInfoChannel extends PlatformInterface {
  /// Constructs a [VolumeInfoChannel].
  VolumeInfoChannel() : super(token: _token);

  static final Object _token = Object();

  static VolumeInfoChannel? _instance;

  /// The default instance of [VolumeInfoChannel] to use.
  static VolumeInfoChannel get instance =>
      ArgumentError.checkNotNull(_instance, 'instance');

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [VolumeInfoChannel] when
  /// they register themselves.
  static set instance(VolumeInfoChannel instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  String getEnvironmentForState(VolumeInfo$State state);
  String? getBroadcastForEnvironment(String envState);
  String? getBroadcastForState(VolumeInfo$State state);

  int buildStableMtpStorageId(String fsUuid);
}
