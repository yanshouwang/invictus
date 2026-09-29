import 'package:invictus_android/src/impl.dart';
import 'package:invictus_android/src/jni.dart' as jni;
import 'package:invictus_api/invictus_api.dart';

final class StorageEventListenerImpl extends ObjectImpl
    implements StorageEventListener {
  @override
  final jni.StorageEventListener api;

  StorageEventListenerImpl.internal(this.api);
}

final class StorageEventListenerChannelImpl
    extends StorageEventListenerChannel {
  @override
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
  }) {
    final api = jni.JniStorageEventListenerImpl(
      jni.context,
      jni.JniStorageEventListener.implement(
        jni.$JniStorageEventListener(
          onUsbMassStorageConnectionChanged: (connected) =>
              onUsbMassStorageConnectionChanged?.call(connected),
          onStorageStateChanged: (path, oldState, newState) =>
              onStorageStateChanged?.call(
                path?.impl,
                oldState.environment$MediaImpl,
                newState.environment$MediaImpl,
              ),
          onVolumeStateChanged: (vol, oldState, newState) =>
              onVolumeStateChanged?.call(
                vol.impl,
                oldState.volumeInfo$StateImpl,
                newState.volumeInfo$StateImpl,
              ),
          onVolumeRecordChanged: (rec) => onVolumeRecordChanged?.call(rec.impl),
          onVolumeForgotten: (fsUuid) => onVolumeForgotten?.call(fsUuid.impl),
          onDiskScanned: (disk, volumeCount) =>
              onDiskScanned?.call(disk.impl, volumeCount),
          onDiskDestroyed: (disk) => onDiskDestroyed?.call(disk.impl),
        ),
      ),
    );
    return StorageEventListenerImpl.internal(api);
  }
}

extension Invictus$StorageEventListenerX on StorageEventListener {
  jni.StorageEventListener get api {
    final impl = this;
    if (impl is! StorageEventListenerImpl) throw TypeError();
    return impl.api;
  }
}
