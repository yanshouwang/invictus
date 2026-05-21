import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'locale.dart';

/// represents a time zone offset, and also figures out daylight savings.
abstract interface class TimeZone {
  static List<String> get availableIds => TimeZoneChannel.instance.availableIds;

  static List<String> getAvailableIds(int rawOffset) =>
      TimeZoneChannel.instance.getAvailableIds(rawOffset);

  static TimeZone getDefault() => TimeZoneChannel.instance.getDefault();

  static void setDefault(TimeZone timeZone) =>
      TimeZoneChannel.instance.setDefault(timeZone);

  factory TimeZone.id(String id) =>
      TimeZoneChannel.instance.getTimeZoneById(id);

  // factory TimeZone.zoneId(ZoneId id) =>
  //     TimeZoneChannel.instance.getTimeZoneByZoneId(id);

  int get dstSavings;
  String get displayName;
  String get id;
  set id(String value);
  int get rawOffset;
  set rawOffset(int value);
  bool get observesDaylightTime;
  bool get useDaylightTime;

  String getDisplayNameWithDaylightStyle(bool daylight, int style);
  String getDisplayNameWithDaylightStyleLocale(
    bool daylight,
    int style,
    Locale locale,
  );
  String getDisplayNameWithLocale(Locale locale);
  int getOffsetWithEraYearMonthDayDayOfWeekMilliseconds(
    int era,
    int year,
    int month,
    int day,
    int dayOfWeek,
    int milliseconds,
  );
  int getOffsetWithDate(int date);
  bool hasSameRules(TimeZone other);
  // bool inDaylightTime(Date date);
  // ZoneId toZoneId();
}

abstract base class TimeZoneChannel extends PlatformInterface {
  /// Constructs a [TimeZoneChannel].
  TimeZoneChannel() : super(token: _token);

  static final Object _token = Object();

  static TimeZoneChannel? _instance;

  /// The default instance of [TimeZoneChannel] to use.
  static TimeZoneChannel get instance =>
      ArgumentError.checkNotNull(_instance, 'instance');

  /// Sets the default instance of [TimeZoneChannel] to use.
  ///
  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [TimeZoneChannel] when
  /// they register themselves.
  static set instance(TimeZoneChannel instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  List<String> get availableIds;

  List<String> getAvailableIds(int rawOffset);
  TimeZone getDefault();
  TimeZone getTimeZoneById(String id);
  // TimeZone getTimeZoneByZoneId(ZoneId id);
  void setDefault(TimeZone timeZone);
}
