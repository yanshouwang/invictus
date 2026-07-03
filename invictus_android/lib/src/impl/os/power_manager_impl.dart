import 'package:invictus_android/src/impl.dart';
import 'package:invictus_android/src/jni.dart' as jni;
import 'package:invictus_api/invictus_api.dart';

final class PowerManagerImpl extends ObjectImpl implements PowerManager {
  @override
  final jni.PowerManager api;

  PowerManagerImpl.internal(this.api);

  @override
  void reboot({PowerManager$Reboot? reason}) => api.reboot(reason?.api);

  @override
  void shutdown({
    bool confirm = true,
    PowerManager$Shutdown? reason,
    bool wait = false,
  }) =>
      jni.PowerManagerCompat.INSTANCE.shutdown(api, confirm, reason?.api, wait);
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
        return jni.PowerManagerCompat.INSTANCE.rEBOOT_RECOVERY;
      case PowerManager$Reboot.recoveryUpdate:
        return jni.PowerManagerCompat.INSTANCE.rEBOOT_RECOVERY_UPDATE;
      case PowerManager$Reboot.requestedByDeviceOwner:
        return jni.PowerManagerCompat.INSTANCE.rEBOOT_REQUESTED_BY_DEVICE_OWNER;
      case PowerManager$Reboot.safeMode:
        return jni.PowerManagerCompat.INSTANCE.rEBOOT_SAFE_MODE;
      case PowerManager$Reboot.userspace:
        return jni.PowerManagerCompat.INSTANCE.rEBOOT_USERSPACE;
      case PowerManager$Reboot.quiescent:
        return jni.PowerManagerCompat.INSTANCE.rEBOOT_QUIESCENT;
    }
  }
}

extension PowerManager$ShutdownX on PowerManager$Shutdown {
  jni.JString get api {
    switch (this) {
      case PowerManager$Shutdown.userRequested:
        return jni.PowerManagerCompat.INSTANCE.sHUTDOWN_USER_REQUESTED;
      case PowerManager$Shutdown.batteryThermalState:
        return jni.PowerManagerCompat.INSTANCE.sHUTDOWN_BATTERY_THERMAL_STATE;
      case PowerManager$Shutdown.thermalState:
        return jni.PowerManagerCompat.INSTANCE.sHUTDOWN_THERMAL_STATE;
      case PowerManager$Shutdown.lowBattery:
        return jni.PowerManagerCompat.INSTANCE.sHUTDOWN_LOW_BATTERY;
    }
  }
}
