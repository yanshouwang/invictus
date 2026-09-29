import 'package:clover/clover.dart';
import 'package:invictus/invictus.dart';
import 'package:logging/logging.dart';

Logger get _logger => Logger('StorageViewModel');

class StorageViewModel extends ViewModel {
  final StorageManager _storageManager;

  late final StorageEventListener _listener;
  late final StorageManager$StorageVolumeCallback _callback;

  StorageViewModel() : _storageManager = StorageManager() {
    _listener = StorageEventListener(
      onVolumeStateChanged: (volume, oldState, newState) {
        _logger.info(
          'onVolumeStateChanged: ${volume.id}, ${volume.type}, ${volume.fsLabel}, $oldState, $newState',
        );
        notifyListeners();
      },
    );
    _storageManager.registerListener(_listener);

    _callback = StorageManager$StorageVolumeCallback(
      onStateChanged: (volume) {
        _logger.info(
          'onStateChanged: ${volume.id}, ${volume.userLabel}, ${volume.state}',
        );
      },
    );
    _storageManager.registerStorageVolumeCallback(_callback);
  }

  List<StorageVolume> get volumes {
    return List.unmodifiable(_storageManager.storageVolumes);
  }

  String? getVolumeType(String volumeId) =>
      _storageManager.findVolumeById(volumeId)?.fsType;

  void mount(String volumeId) => _storageManager.mount(volumeId);

  void unmount(String volumeId) => _storageManager.unmount(volumeId);

  @override
  void dispose() {
    _storageManager.unregisterListener(_listener);
    _storageManager.unregisterStorageVolumeCallback(_callback);
    super.dispose();
  }
}
