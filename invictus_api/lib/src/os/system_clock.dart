import 'package:plugin_platform_interface/plugin_platform_interface.dart';

/// Core timekeeping facilities.
abstract interface class SystemClock {
  /// Returns a Clock that starts at January 1, 1970 00:00:00.0 UTC, synchronized using the device's location provider.
  // static Clock currentGnssTimeClock => SystemClockChannel.instance.currentGnssTimeClock;

  /// Returns a Clock that starts at January 1, 1970 00:00:00.0 UTC, synchronized using a remote network source outside the device.
  // static Clock currentNetworkTimeClock => SystemClockChannel.instance.currentNetworkTimeClock;

  /// Returns milliseconds running in the current thread.
  static int get currentThreadTimeMillis =>
      SystemClockChannel.instance.currentThreadTimeMillis;

  /// Returns milliseconds since boot, including time spent in sleep.
  static int get elapsedRealtime => SystemClockChannel.instance.elapsedRealtime;

  /// Returns nanoseconds since boot, including time spent in sleep.
  static int get elapsedRealtimeNanos =>
      SystemClockChannel.instance.elapsedRealtimeNanos;

  /// Returns milliseconds since boot, not counting time spent in deep sleep.
  static int get uptimeMillis => SystemClockChannel.instance.uptimeMillis;

  /// Returns nanoseconds since boot, not counting time spent in deep sleep.
  // static int get uptimeNanos => SystemClockChannel.instance.uptimeNanos;

  /// Sets the current wall time, in milliseconds.
  static bool setCurrentTimeMillis(int millis) =>
      SystemClockChannel.instance.setCurrentTimeMillis(millis);

  /// Waits a given number of milliseconds (of uptimeMillis) before returning.
  static void sleep(int ms) => SystemClockChannel.instance.sleep(ms);
}

abstract base class SystemClockChannel extends PlatformInterface {
  /// Constructs a [SystemClockChannel].
  SystemClockChannel() : super(token: _token);

  static final Object _token = Object();

  static SystemClockChannel? _instance;

  /// The default instance of [SystemClockChannel] to use.
  static SystemClockChannel get instance =>
      ArgumentError.checkNotNull(_instance, 'instance');

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [SystemClockChannel] when
  /// they register themselves.
  static set instance(SystemClockChannel instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  /// Returns a Clock that starts at January 1, 1970 00:00:00.0 UTC, synchronized using the device's location provider.
  // Clock currentGnssTimeClock;

  /// Returns a Clock that starts at January 1, 1970 00:00:00.0 UTC, synchronized using a remote network source outside the device.
  // Clock currentNetworkTimeClock;

  /// Returns milliseconds running in the current thread.
  int get currentThreadTimeMillis;

  /// Returns milliseconds since boot, including time spent in sleep.
  int get elapsedRealtime;

  /// Returns nanoseconds since boot, including time spent in sleep.
  int get elapsedRealtimeNanos;

  /// Returns milliseconds since boot, not counting time spent in deep sleep.
  int get uptimeMillis;

  /// Returns nanoseconds since boot, not counting time spent in deep sleep.
  // int get uptimeNanos;

  /// Sets the current wall time, in milliseconds.
  bool setCurrentTimeMillis(int millis);

  /// Waits a given number of milliseconds (of uptimeMillis) before returning.
  void sleep(int ms);
}
