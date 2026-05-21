import 'package:invictus_android/src/impl.dart';
import 'package:invictus_android/src/jni.dart' as jni;
import 'package:invictus_api/invictus_api.dart';

final class PowerManagerImpl extends ObjectImpl implements PowerManager {
  @override
  final jni.PowerManager api;
  final jni.InvictusPowerManager invictusApi;

  PowerManagerImpl.internal(this.api)
    : invictusApi = jni.InvictusPowerManager(api);

  @override
  bool get isRebootingUserspaceSupported => api.isRebootingUserspaceSupported;

  @override
  void reboot({PowerManager$Reboot? reason}) => api.reboot(reason?.api);

  @override
  void shutdown({
    bool confirm = true,
    PowerManager$Shutdown? reason,
    bool wait = false,
  }) => invictusApi.shutdown(confirm, reason?.api, wait);
}

final class PowerManagerChannelImpl extends PowerManagerChannel {
  @override
  PowerManager create() {
    final apiOrNull = jni.ContextCompat.getSystemService<jni.PowerManager>(
      jni.context,
      jni.PowerManager.type.jClass,
    );
    final api = ArgumentError.checkNotNull(apiOrNull, 'api');
    return PowerManagerImpl.internal(api);
  }
}

extension PowerManager$RebootX on PowerManager$Reboot {
  jni.JString get api {
    switch (this) {
      case PowerManager$Reboot.recovery:
        return jni.InvictusPowerManager.Companion.rEBOOT_RECOVERY;
      case PowerManager$Reboot.recoveryUpdate:
        return jni.InvictusPowerManager.Companion.rEBOOT_RECOVERY_UPDATE;
      case PowerManager$Reboot.requestedByDeviceOwner:
        return jni
            .InvictusPowerManager
            .Companion
            .rEBOOT_REQUESTED_BY_DEVICE_OWNER;
      case PowerManager$Reboot.safeMode:
        return jni.InvictusPowerManager.Companion.rEBOOT_SAFE_MODE;
      case PowerManager$Reboot.userspace:
        return jni.InvictusPowerManager.Companion.rEBOOT_USERSPACE;
      case PowerManager$Reboot.quiescent:
        return jni.InvictusPowerManager.Companion.rEBOOT_QUIESCENT;
    }
  }
}

extension PowerManager$ShutdownX on PowerManager$Shutdown {
  jni.JString get api {
    switch (this) {
      case PowerManager$Shutdown.userRequested:
        return jni.InvictusPowerManager.Companion.sHUTDOWN_USER_REQUESTED;
      case PowerManager$Shutdown.batteryThermalState:
        return jni
            .InvictusPowerManager
            .Companion
            .sHUTDOWN_BATTERY_THERMAL_STATE;
      case PowerManager$Shutdown.thermalState:
        return jni.InvictusPowerManager.Companion.sHUTDOWN_THERMAL_STATE;
      case PowerManager$Shutdown.lowBattery:
        return jni.InvictusPowerManager.Companion.sHUTDOWN_LOW_BATTERY;
    }
  }
}
