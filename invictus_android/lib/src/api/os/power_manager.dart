import 'package:invictus_android/src/impl.dart';

enum PowerManagerReboot {
  recovery,
  recoveryUpdate,
  requestedByDeviceOwner,
  safeMode,
  userspace,
  quiescent,
}

enum PowerManagerShutdown {
  userRequested,
  batteryThermalState,
  thermalState,
  lowBattery,
}

/// This class lets you query and request control of aspects of the device's power state.
abstract base class PowerManager {
  PowerManager.impl();

  factory PowerManager() => PowerManagerImpl();

  /// Returns true if this device supports rebooting userspace.
  bool get isRebootingUserspaceSupported;

  /// Reboot the device. Will not return if the reboot is successful.
  ///
  /// Requires the Manifest.permission.REBOOT permission.
  ///
  /// If the reason string contains ",quiescent", then the screen stays off during reboot and is not turned on again until the
  /// user triggers the device to wake up (for example, by pressing the power key). This behavior applies to Android TV
  /// devices launched on Android 11 (API level 30) or higher.
  ///
  /// [reason] code to pass to the kernel (e.g., "recovery") to request special boot modes, or null.
  void reboot({PowerManagerReboot? reason});

  /// Turn off the device.
  ///
  /// [confirm] If true, shows a shutdown confirmation dialog.
  ///
  /// [reason] code to pass to android_reboot() (e.g. "userrequested"), or null.
  ///
  /// [wait] If true, this call waits for the shutdown to complete and does not return.
  void shutdown({
    bool confirm = true,
    PowerManagerShutdown? reason,
    bool wait = false,
  });
}
