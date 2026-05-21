import 'package:invictus_android/src/impl.dart';
import 'package:invictus_android/src/jni.dart' as jni;
import 'package:invictus_api/invictus_api.dart';

final class TimeZoneStateImpl extends ObjectImpl implements TimeZoneState {
  @override
  final jni.TimeZoneState api;

  TimeZoneStateImpl.internal(this.api);

  @override
  String get id => api.id.impl;

  @override
  bool get userShouldConfirmId => api.userShouldConfirmId;
}

extension Invictus$JTimeZoneStateX on jni.TimeZoneState {
  TimeZoneState get impl => TimeZoneStateImpl.internal(this);
}
