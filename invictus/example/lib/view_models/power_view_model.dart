import 'package:clover/clover.dart';
import 'package:invictus/invictus.dart';

class PowerViewModel extends ViewModel {
  final PowerManager _powerManager;

  PowerViewModel() : _powerManager = PowerManager();

  void shutdown() => _powerManager.shutdown(
    confirm: true,
    reason: PowerManager$Shutdown.userRequested,
    wait: false,
  );

  void reboot() =>
      _powerManager.reboot(reason: PowerManager$Reboot.requestedByDeviceOwner);
}
