import 'package:plugin_platform_interface/plugin_platform_interface.dart';

abstract interface class AlarmManager {
  factory AlarmManager() => AlarmManagerChannel.instance.create();

  // AlarmManager$AlarmClockInfo? get nextAlarmClock;

  /// Set the system wall clock time.
  ///
  /// [millis] is the time in milliseconds since the Epoch
  ///
  /// Requires android.Manifest.permission#SET_TIME
  set time(int millis);

  /// Sets the system's persistent default time zone. This is the time zone for all apps, even after a reboot. Use java.util.TimeZone#setDefault if you just want to change the time zone within your app, and even then prefer to pass an explicit java.util.TimeZone to APIs that require it rather than changing the time zone for all threads.
  ///
  /// [timeZone] is one of the Olson ids from the list returned by java.util.TimeZone#getAvailableIDs
  ///
  /// On android M and above, it is an error to pass in a non-Olson timezone to this function. Note that this is a bad idea on all Android releases because POSIX and the TimeZone class have opposite interpretations of '+' and '-' in the same non-Olson ID.
  ///
  /// Requires android.Manifest.permission#SET_TIME_ZONE
  set timeZone(String timeZone);

  // bool get canScheduleExactAlarms;
  // void cancel(PendingIntent operation);
  // void cancel(AlarmManager$OnAlarmListener listener);
  // void cancelAll();
  // void set(int type, int triggerAtMillis, PendingIntent operation);
  // void set(
  //   int type,
  //   int triggerAtMillis,
  //   String? tag,
  //   AlarmManager$OnAlarmListener listener,
  // );
  // void setAlarmClock(AlarmManager$AlarmClockInfo info, PendingIntent operation);
  // void setAndAllowWhileIdle(
  //   int type,
  //   int triggerAtMillis,
  //   PendingIntent operation,
  // );
  // void setExact(int type, int triggerAtMillis, PendingIntent operation);
  // void setExact(
  //   int type,
  //   int triggerAtMillis,
  //   String? tag,
  //   AlarmManager$OnAlarmListener listener,
  // );
  // void setExactAndAllowWhileIdle(
  //   int type,
  //   int triggerAtMillis,
  //   PendingIntent operation,
  // );
  // void setExactAndAllowWhileIdle(
  //   int type,
  //   int triggerAtMillis,
  //   String tag,
  //   AlarmManager$OnAlarmListener listener,
  // );
  // void setInexactRepeating(
  //   int type,
  //   int triggerAtMillis,
  //   int intervalMillis,
  //   PendingIntent operation,
  // );
  // void setRepeating(
  //   int type,
  //   int triggerAtMillis,
  //   int intervalMillis,
  //   PendingIntent operation,
  // );
  // void setWindow(
  //   int type,
  //   int windowStartMillis,
  //   int windowLengthMillis,
  //   PendingIntent operation,
  // );
  // void setWindow(
  //   int type,
  //   int windowStartMillis,
  //   int windowLengthMillis,
  //   String? tag,
  //   AlarmManager$OnAlarmListener listener,
  // );
}

abstract base class AlarmManagerChannel extends PlatformInterface {
  /// Constructs a [AlarmManagerChannel].
  AlarmManagerChannel() : super(token: _token);

  static final Object _token = Object();

  static AlarmManagerChannel? _instance;

  /// The default instance of [AlarmManagerChannel] to use.
  static AlarmManagerChannel get instance =>
      ArgumentError.checkNotNull(_instance, 'instance');

  /// Sets the default instance of [AlarmManagerChannel] to use.
  ///
  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [AlarmManagerChannel] when
  /// they register themselves.
  static set instance(AlarmManagerChannel instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  AlarmManager create();
}
