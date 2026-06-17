import 'package:invictus_android/src/impl.dart';
import 'package:invictus_android/src/jni.dart' as jni;
import 'package:invictus_api/invictus_api.dart';

final class StorageEventListenerImpl extends ObjectImpl
    implements StorageEventListener {
  @override
  final jni.InvictusStorageEventListener api;

  StorageEventListenerImpl.internal(this.api);
}

final class StorageEventListenerChannelImpl
    extends StorageEventListenerChannel {
  @override
  StorageEventListener create({
    required void Function(bool connected) onUsbMassStorageConnectionChanged,
    required void Function(String? path, String oldState, String newState)
    onStorageStateChanged,
    required void Function(VolumeInfo vol, int oldState, int newState)
    onVolumeStateChanged,
  }) {
    final api = jni.JniInvictusStorageEventListenerImpl(
      jni.context,
      jni.JniInvictusStorageEventListener.implement(
        jni.$JniInvictusStorageEventListener(
          onUsbMassStorageConnectionChanged: (connected) =>
              onUsbMassStorageConnectionChanged(connected),
          onStorageStateChanged: (path, oldState, newState) =>
              onStorageStateChanged(path?.impl, oldState.impl, newState.impl),
          onVolumeStateChanged: (vol, oldState, newState) =>
              onVolumeStateChanged(vol.impl, oldState, newState),
          onVolumeRecordChanged: (rec) {},
          onVolumeForgotten: (fsUuid) {},
          onDiskScanned: (disk, volumeCount) {},
          onDiskDestroyed: (disk) {},
        ),
      ),
    );
    return StorageEventListenerImpl.internal(api);
  }
}

extension Invictus$StorageEventListenerX on StorageEventListener {
  jni.InvictusStorageEventListener get api {
    final impl = this;
    if (impl is! StorageEventListenerImpl) throw TypeError();
    return impl.api;
  }
}
