import 'package:plugin_platform_interface/plugin_platform_interface.dart';

enum PowerManager$Reboot {
  recovery,
  recoveryUpdate,
  requestedByDeviceOwner,
  safeMode,
  userspace,
  quiescent,
}

enum PowerManager$Shutdown {
  userRequested,
  batteryThermalState,
  thermalState,
  lowBattery,
}

/// This class lets you query and request control of aspects of the device's power state.
abstract interface class PowerManager {
  factory PowerManager() => PowerManagerChannel.instance.create();

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
  void reboot({PowerManager$Reboot? reason});

  /// Turn off the device.
  ///
  /// [confirm] If true, shows a shutdown confirmation dialog.
  ///
  /// [reason] code to pass to android_reboot() (e.g. "userrequested"), or null.
  ///
  /// [wait] If true, this call waits for the shutdown to complete and does not return.
  void shutdown({
    bool confirm = true,
    PowerManager$Shutdown? reason,
    bool wait = false,
  });
}

abstract base class PowerManagerChannel extends PlatformInterface {
  /// Constructs a [PowerManagerChannel].
  PowerManagerChannel() : super(token: _token);

  static final Object _token = Object();

  static PowerManagerChannel? _instance;

  /// The default instance of [PowerManagerChannel] to use.
  static PowerManagerChannel get instance =>
      ArgumentError.checkNotNull(_instance, 'instance');

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [PowerManagerChannel] when
  /// they register themselves.
  static set instance(PowerManagerChannel instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  PowerManager create();
}
