import 'package:plugin_platform_interface/plugin_platform_interface.dart';

// import 'disk_info.dart';
import 'volume_info.dart';
// import 'volume_record.dart';

abstract interface class StorageEventListener {
  factory StorageEventListener({
    required void Function(bool connected) onUsbMassStorageConnectionChanged,
    required void Function(String? path, String oldState, String newState)
    onStorageStateChanged,
    required void Function(VolumeInfo vol, int oldState, int newState)
    onVolumeStateChanged,
  }) => StorageEventListenerChannel.instance.create(
    onUsbMassStorageConnectionChanged: onUsbMassStorageConnectionChanged,
    onStorageStateChanged: onStorageStateChanged,
    onVolumeStateChanged: onVolumeStateChanged,
  );
}

abstract base class StorageEventListenerChannel extends PlatformInterface {
  /// Constructs a [StorageEventListenerChannel].
  StorageEventListenerChannel() : super(token: _token);

  static final Object _token = Object();

  static StorageEventListenerChannel? _instance;

  /// The default instance of [StorageEventListenerChannel] to use.
  static StorageEventListenerChannel get instance =>
      ArgumentError.checkNotNull(_instance, 'instance');

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [StorageEventListenerChannel] when
  /// they register themselves.
  static set instance(StorageEventListenerChannel instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  StorageEventListener create({
    required void Function(bool connected) onUsbMassStorageConnectionChanged,
    required void Function(String? path, String oldState, String newState)
    onStorageStateChanged,
    required void Function(VolumeInfo vol, int oldState, int newState)
    onVolumeStateChanged,
    // required void Function(VolumeRecord rec) onVolumeRecordChanged,
    // required void Function(String fsUuid) onVolumeForgotten,
    // required void Function(DiskInfo disk, int volumeCount) onDiskScanned,
    // required void Function(DiskInfo disk) onDiskDestroyed,
  });
}
