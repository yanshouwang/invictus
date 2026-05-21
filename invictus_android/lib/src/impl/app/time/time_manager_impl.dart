import 'package:invictus_android/src/impl.dart';
import 'package:invictus_android/src/jni.dart' as jni;
import 'package:invictus_api/invictus_api.dart';

final class TimeManagerImpl extends ObjectImpl implements TimeManager {
  @override
  final jni.TimeManager api;

  TimeManagerImpl.internal(this.api);

  jni.Executor get executorApi =>
      ArgumentError.checkNotNull(jni.context.mainExecutor, 'mainExecutor');

  @override
  TimeCapabilitiesAndConfig get timeCapabilitiesAndConfig =>
      api.timeCapabilitiesAndConfig.impl;

  @override
  TimeState get timeState => api.timeState.impl;

  @override
  TimeZoneCapabilitiesAndConfig get timeZoneCapabilitiesAndConfig =>
      api.timeZoneCapabilitiesAndConfig.impl;

  @override
  TimeZoneState get timeZoneState => api.timeZoneState.impl;

  @override
  void addTimeZoneDetectorListener(
    TimeManager$TimeZoneDetectorListener listener,
  ) => api.addTimeZoneDetectorListener(executorApi, listener.api);

  @override
  bool confirmTime(UnixEpochTime unixEpochTime) =>
      api.confirmTime(unixEpochTime.api);

  @override
  bool confirmTimeZone(String timeZoneId) =>
      api.confirmTimeZone(timeZoneId.api);

  @override
  void removeTimeZoneDetectorListener(
    TimeManager$TimeZoneDetectorListener listener,
  ) => api.removeTimeZoneDetectorListener(listener.api);

  @override
  bool setManualTime(UnixEpochTime unixEpochTime) =>
      api.setManualTime(unixEpochTime.api);

  @override
  bool setManualTimeZone(String timeZoneId) =>
      api.setManualTimeZone(timeZoneId.api);

  @override
  void suggestExternalTime(ExternalTimeSuggestion timeSuggestion) =>
      api.suggestExternalTime(timeSuggestion.api);

  @override
  bool updateTimeConfiguration(TimeConfiguration configuration) =>
      api.updateTimeConfiguration(configuration.api);

  @override
  bool updateTimeZoneConfiguration(TimeZoneConfiguration configuration) =>
      api.updateTimeZoneConfiguration(configuration.api);
}

final class TimeManager$TimeZoneDetectorListenerImpl extends ObjectImpl
    implements TimeManager$TimeZoneDetectorListener {
  @override
  final jni.TimeManager$TimeZoneDetectorListener api;

  TimeManager$TimeZoneDetectorListenerImpl.internal(this.api);
}

final class TimeManagerChannelImpl extends TimeManagerChannel {
  @override
  TimeManager create() {
    final api = jni.TimeManager(jni.context);
    return TimeManagerImpl.internal(api);
  }

  @override
  TimeManager$TimeZoneDetectorListener createTimeZoneDetectorListener({
    required void Function() onChanged,
  }) {
    final api = jni.InvictusTimeManager$InvictusTimeZoneDetectorListenerImpl(
      jni.InvictusTimeManager$InvictusTimeZoneDetectorListener.implement(
        jni.$InvictusTimeManager$InvictusTimeZoneDetectorListener(
          onChange: onChanged,
        ),
      ),
    );
    return TimeManager$TimeZoneDetectorListenerImpl.internal(api);
  }
}

extension Invictus$TimeManager$TimeZoneDetectorListenerX
    on TimeManager$TimeZoneDetectorListener {
  jni.TimeManager$TimeZoneDetectorListener get api {
    final impl = this;
    if (impl is! TimeManager$TimeZoneDetectorListenerImpl) throw TypeError();
    return impl.api;
  }
}
