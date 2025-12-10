import 'package:clover/clover.dart';
import 'package:invictus_android/invictus_android.dart';

class HomeViewModel extends ViewModel {
  final PowerManager _powerManager;

  HomeViewModel() : _powerManager = PowerManager();

  void reboot() =>
      _powerManager.reboot(reason: PowerManager$Reboot.requestedByDeviceOwner);

  void shutdown() => _powerManager.shutdown(
    confirm: true,
    reason: PowerManager$Shutdown.userRequested,
    wait: false,
  );
}
