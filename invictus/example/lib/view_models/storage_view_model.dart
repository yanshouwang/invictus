import 'package:clover/clover.dart';
import 'package:invictus/invictus.dart';
import 'package:logging/logging.dart';

Logger get _logger => Logger('StorageViewModel');

class StorageViewModel extends ViewModel {
  final StorageManager _storageManager;
  final Map<String, StorageVolume> _volumes;

  late final StorageManager$StorageVolumeCallback _storageVolumeCallback;

  StorageViewModel() : _storageManager = StorageManager(), _volumes = {} {
    _storageVolumeCallback = StorageManager$StorageVolumeCallback(
      onStateChanged: (volume) {
        _logger.info(
          'onStateChanged: ${volume.userLabel}, ${volume.state}, ${volume.path}',
        );
        if (volume.state == .mounted) {
          _volumes[volume.id] = volume;
        } else {
          _volumes.remove(volume.id);
        }
        notifyListeners();
      },
    );
    _storageManager.registerStorageVolumeCallback(_storageVolumeCallback);
    for (var volume in _storageManager.storageVolumes) {
      if (volume.state != .mounted) continue;
      _volumes[volume.id] = volume;
    }
    notifyListeners();
  }

  List<StorageVolume> get volumes => List.unmodifiable(_volumes.values);

  String? getVolumeType(String volumeId) =>
      _storageManager.findVolumeById(volumeId)?.fsType;

  void unmount(String volumeId) => _storageManager.unmount(volumeId);

  @override
  void dispose() {
    _storageManager.unregisterStorageVolumeCallback(_storageVolumeCallback);
    super.dispose();
  }
}
