import 'package:invictus_android/src/impl.dart';
import 'package:invictus_android/src/jni.dart' as jni;
import 'package:invictus_api/invictus_api.dart';

final class TimeStateImpl extends ObjectImpl implements TimeState {
  @override
  final jni.TimeState api;

  TimeStateImpl.internal(this.api);

  @override
  UnixEpochTime get unixEpochTime => api.unixEpochTime.impl;

  @override
  bool get userShouldConfirmTime => api.userShouldConfirmTime;
}

extension Invictus$JTimeStateX on jni.TimeState {
  TimeState get impl => TimeStateImpl.internal(this);
}
