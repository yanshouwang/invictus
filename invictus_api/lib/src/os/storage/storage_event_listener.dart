import 'package:invictus_api/src/os.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

abstract interface class StorageEventListener {
  factory StorageEventListener({
    void Function(bool connected)? onUsbMassStorageConnectionChanged,
    void Function(
      String? path,
      Environment$Media oldState,
      Environment$Media newState,
    )?
    onStorageStateChanged,
    void Function(
      VolumeInfo vol,
      VolumeInfo$State oldState,
      VolumeInfo$State newState,
    )?
    onVolumeStateChanged,
    void Function(VolumeRecord rec)? onVolumeRecordChanged,
    void Function(String fsUuid)? onVolumeForgotten,
    void Function(DiskInfo disk, int volumeCount)? onDiskScanned,
    void Function(DiskInfo disk)? onDiskDestroyed,
  }) => StorageEventListenerChannel.instance.create(
    onUsbMassStorageConnectionChanged: onUsbMassStorageConnectionChanged,
    onStorageStateChanged: onStorageStateChanged,
    onVolumeStateChanged: onVolumeStateChanged,
    onVolumeRecordChanged: onVolumeRecordChanged,
    onVolumeForgotten: onVolumeForgotten,
    onDiskScanned: onDiskScanned,
    onDiskDestroyed: onDiskDestroyed,
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
    void Function(bool connected)? onUsbMassStorageConnectionChanged,
    void Function(
      String? path,
      Environment$Media oldState,
      Environment$Media newState,
    )?
    onStorageStateChanged,
    void Function(
      VolumeInfo vol,
      VolumeInfo$State oldState,
      VolumeInfo$State newState,
    )?
    onVolumeStateChanged,
    void Function(VolumeRecord rec)? onVolumeRecordChanged,
    void Function(String fsUuid)? onVolumeForgotten,
    void Function(DiskInfo disk, int volumeCount)? onDiskScanned,
    void Function(DiskInfo disk)? onDiskDestroyed,
  });
}
