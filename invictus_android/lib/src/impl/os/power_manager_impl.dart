import 'package:invictus_android/src/api.dart';
import 'package:invictus_android/src/jni.dart' as jni;

final class PowerManagerImpl implements PowerManager {
  final jni.PowerManager api;
  final jni.InvictusPowerManager invictusApi;

  PowerManagerImpl.internal(this.api)
    : invictusApi = jni.InvictusPowerManager(api);

  factory PowerManagerImpl() {
    final apiOrNull = jni.ContextCompat.getSystemService(
      jni.context,
      jni.PowerManager.type.jClass,
      T: jni.PowerManager.type,
    );
    final api = ArgumentError.checkNotNull(apiOrNull, 'api');
    return PowerManagerImpl.internal(api);
  }

  @override
  bool get isRebootingUserspaceSupported => api.isRebootingUserspaceSupported();

  @override
  void reboot({PowerManager$Reboot? reason}) => api.reboot(reason?.api);

  @override
  void shutdown({
    bool confirm = true,
    PowerManager$Shutdown? reason,
    bool wait = false,
  }) => invictusApi.shutdown(confirm, reason?.api, wait);
}

extension PowerManager$RebootX on PowerManager$Reboot {
  jni.JString get api {
    switch (this) {
      case PowerManager$Reboot.recovery:
        return jni.InvictusPowerManager.Companion.getREBOOT_RECOVERY();
      case PowerManager$Reboot.recoveryUpdate:
        return jni.InvictusPowerManager.Companion.getREBOOT_RECOVERY_UPDATE();
      case PowerManager$Reboot.requestedByDeviceOwner:
        return jni.InvictusPowerManager.Companion
            .getREBOOT_REQUESTED_BY_DEVICE_OWNER();
      case PowerManager$Reboot.safeMode:
        return jni.InvictusPowerManager.Companion.getREBOOT_SAFE_MODE();
      case PowerManager$Reboot.userspace:
        return jni.InvictusPowerManager.Companion.getREBOOT_USERSPACE();
      case PowerManager$Reboot.quiescent:
        return jni.InvictusPowerManager.Companion.getREBOOT_QUIESCENT();
    }
  }
}

extension PowerManager$ShutdownX on PowerManager$Shutdown {
  jni.JString get api {
    switch (this) {
      case PowerManager$Shutdown.userRequested:
        return jni.InvictusPowerManager.Companion.getSHUTDOWN_USER_REQUESTED();
      case PowerManager$Shutdown.batteryThermalState:
        return jni.InvictusPowerManager.Companion
            .getSHUTDOWN_BATTERY_THERMAL_STATE();
      case PowerManager$Shutdown.thermalState:
        return jni.InvictusPowerManager.Companion.getSHUTDOWN_THERMAL_STATE();
      case PowerManager$Shutdown.lowBattery:
        return jni.InvictusPowerManager.Companion.getSHUTDOWN_LOW_BATTERY();
    }
  }
}
