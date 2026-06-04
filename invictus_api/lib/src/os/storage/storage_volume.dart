import 'package:plugin_platform_interface/plugin_platform_interface.dart';

abstract interface class StorageVolume {
  String get id;
  String get path;
  String get internalPath;
  // File get pathFile;
  // File? get directory;
  String get description;
  bool get isPrimary;
  bool get isRemovable;
  bool get isEmulated;
  bool get isExternallyManaged;
  bool get allowMassStorage;
  int get maxFileSize;
  // UserHandle get owner;
  // UUID? get storageUuid;
  String? get uuid;
  String? get mediaStoreVolumeName;
  String? get normalizedUuid;
  int get fatVolumeId;
  String get userLabel;
  String get state;

  // Intent? createAccessIntent(String? directoryName);
  // Intent createOpenDocumentTreeIntent();
  String dump();
}

abstract base class StorageVolumeChannel extends PlatformInterface {
  /// Constructs a [StorageVolumeChannel].
  StorageVolumeChannel() : super(token: _token);

  static final Object _token = Object();

  static StorageVolumeChannel? _instance;

  /// The default instance of [StorageVolumeChannel] to use.
  static StorageVolumeChannel get instance =>
      ArgumentError.checkNotNull(_instance, 'instance');

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [StorageVolumeChannel] when
  /// they register themselves.
  static set instance(StorageVolumeChannel instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  String? normalizeUuid(String? fsUuid);
}
