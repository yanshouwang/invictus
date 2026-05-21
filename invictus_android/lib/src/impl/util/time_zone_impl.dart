import 'package:invictus_android/src/impl.dart';
import 'package:invictus_android/src/jni.dart' as jni;
import 'package:invictus_api/invictus_api.dart';

final class TimeZoneImpl extends ObjectImpl implements TimeZone {
  @override
  final jni.TimeZone api;

  TimeZoneImpl.internal(this.api);

  @override
  String get displayName {
    final displayNameApi = ArgumentError.checkNotNull(
      api.displayName,
      'displayName',
    );
    return displayNameApi.impl;
  }

  @override
  int get dstSavings => api.dSTSavings;

  @override
  String get id => ArgumentError.checkNotNull(api.iD, 'id').impl;
  @override
  set id(String value) => api.iD = value.api;

  @override
  int get rawOffset => api.rawOffset;
  @override
  set rawOffset(int value) => api.rawOffset = value;
  @override
  bool get observesDaylightTime => api.observesDaylightTime();
  @override
  bool get useDaylightTime => api.useDaylightTime();

  @override
  String getDisplayNameWithDaylightStyle(bool daylight, int style) {
    final displayNameApiOrNull = api.getDisplayName(daylight, style);
    final displayNameApi = ArgumentError.checkNotNull(
      displayNameApiOrNull,
      'displayNameApi',
    );
    return displayNameApi.impl;
  }

  @override
  String getDisplayNameWithDaylightStyleLocale(
    bool daylight,
    int style,
    Locale locale,
  ) {
    final displayNameApiOrNull = api.getDisplayName$1(
      daylight,
      style,
      locale.api,
    );
    final displayNameApi = ArgumentError.checkNotNull(
      displayNameApiOrNull,
      'displayNameApi',
    );
    return displayNameApi.impl;
  }

  @override
  String getDisplayNameWithLocale(Locale locale) {
    final displayNameApiOrNull = api.getDisplayName$2(locale.api);
    final displayNameApi = ArgumentError.checkNotNull(
      displayNameApiOrNull,
      'displayNameApi',
    );
    return displayNameApi.impl;
  }

  @override
  int getOffsetWithDate(int date) => api.getOffset$1(date);

  @override
  int getOffsetWithEraYearMonthDayDayOfWeekMilliseconds(
    int era,
    int year,
    int month,
    int day,
    int dayOfWeek,
    int milliseconds,
  ) => api.getOffset(era, year, month, day, dayOfWeek, milliseconds);

  @override
  bool hasSameRules(TimeZone other) => api.hasSameRules(other.api);
}

final class TimeZoneChannelImpl extends TimeZoneChannel {
  @override
  List<String> get availableIds {
    final availableIdsApiOrNull = jni.TimeZone.availableIDs;
    final availableIdsApi = ArgumentError.checkNotNull(
      availableIdsApiOrNull,
      'availableIdsApi',
    );
    return availableIdsApi.asDart().nonNulls.map((e) => e.impl).toList();
  }

  @override
  List<String> getAvailableIds(int rawOffset) {
    final availableIdsApiOrNull = jni.TimeZone.getAvailableIDs(rawOffset);
    final availableIdsApi = ArgumentError.checkNotNull(
      availableIdsApiOrNull,
      'availableIdsApi',
    );
    return availableIdsApi.asDart().nonNulls.map((e) => e.impl).toList();
  }

  @override
  TimeZone getDefault() {
    final api = ArgumentError.checkNotNull(jni.TimeZone.default$, 'api');
    return TimeZoneImpl.internal(api);
  }

  @override
  TimeZone getTimeZoneById(String id) {
    final apiOrNull = jni.TimeZone.getTimeZone(id.api);
    final api = ArgumentError.checkNotNull(apiOrNull, 'api');
    return TimeZoneImpl.internal(api);
  }

  @override
  void setDefault(TimeZone timeZone) => jni.TimeZone.default$ = timeZone.api;
}

extension Invictus$TimeZoneX on TimeZone {
  jni.TimeZone get api {
    final impl = this;
    if (impl is! TimeZoneImpl) throw TypeError();
    return impl.api;
  }
}
