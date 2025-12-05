import 'package:invictus_android/src/api.dart';
import 'package:invictus_android/src/jni.dart' as jni;

final class PowerManagerImpl extends PowerManager {
  final jni.PowerManager api;
  final jni.InvictusPowerManager invictusApi;

  PowerManagerImpl.internal(this.api)
    : invictusApi = jni.InvictusPowerManager(api),
      super.impl();

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
  void reboot({PowerManagerReboot? reason}) => api.reboot(reason?.api);

  @override
  void shutdown({
    bool confirm = true,
    PowerManagerShutdown? reason,
    bool wait = false,
  }) => invictusApi.shutdown(confirm, reason?.api, wait);
}

extension PowerManagerRebootX on PowerManagerReboot {
  jni.JString get api {
    switch (this) {
      case PowerManagerReboot.recovery:
        return jni.InvictusPowerManager.Companion.getREBOOT_RECOVERY();
      case PowerManagerReboot.recoveryUpdate:
        return jni.InvictusPowerManager.Companion.getREBOOT_RECOVERY_UPDATE();
      case PowerManagerReboot.requestedByDeviceOwner:
        return jni.InvictusPowerManager.Companion
            .getREBOOT_REQUESTED_BY_DEVICE_OWNER();
      case PowerManagerReboot.safeMode:
        return jni.InvictusPowerManager.Companion.getREBOOT_SAFE_MODE();
      case PowerManagerReboot.userspace:
        return jni.InvictusPowerManager.Companion.getREBOOT_USERSPACE();
      case PowerManagerReboot.quiescent:
        return jni.InvictusPowerManager.Companion.getREBOOT_QUIESCENT();
    }
  }
}

extension PowerManagerShutdownX on PowerManagerShutdown {
  jni.JString get api {
    switch (this) {
      case PowerManagerShutdown.userRequested:
        return jni.InvictusPowerManager.Companion.getSHUTDOWN_USER_REQUESTED();
      case PowerManagerShutdown.batteryThermalState:
        return jni.InvictusPowerManager.Companion
            .getSHUTDOWN_BATTERY_THERMAL_STATE();
      case PowerManagerShutdown.thermalState:
        return jni.InvictusPowerManager.Companion.getSHUTDOWN_THERMAL_STATE();
      case PowerManagerShutdown.lowBattery:
        return jni.InvictusPowerManager.Companion.getSHUTDOWN_LOW_BATTERY();
    }
  }
}
