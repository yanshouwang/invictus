import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'external_time_suggestion.dart';
import 'time_capabilities_and_config.dart';
import 'time_configuration.dart';
import 'time_state.dart';
import 'time_zone_capabilities_and_config.dart';
import 'time_zone_configuration.dart';
import 'time_zone_state.dart';
import 'unix_epoch_time.dart';

abstract interface class TimeManager {
  factory TimeManager() => TimeManagerChannel.instance.create();

  TimeZoneCapabilitiesAndConfig get timeZoneCapabilitiesAndConfig;
  TimeCapabilitiesAndConfig get timeCapabilitiesAndConfig;
  TimeState get timeState;
  TimeZoneState get timeZoneState;

  bool updateTimeConfiguration(TimeConfiguration configuration);
  bool updateTimeZoneConfiguration(TimeZoneConfiguration configuration);
  void addTimeZoneDetectorListener(
    TimeManager$TimeZoneDetectorListener listener,
  );
  void removeTimeZoneDetectorListener(
    TimeManager$TimeZoneDetectorListener listener,
  );
  void suggestExternalTime(ExternalTimeSuggestion timeSuggestion);
  bool confirmTime(UnixEpochTime unixEpochTime);
  bool setManualTime(UnixEpochTime unixEpochTime);
  bool confirmTimeZone(String timeZoneId);
  bool setManualTimeZone(String timeZoneId);
}

abstract interface class TimeManager$TimeZoneDetectorListener {
  factory TimeManager$TimeZoneDetectorListener({
    required void Function() onChanged,
  }) => TimeManagerChannel.instance.createTimeZoneDetectorListener(
    onChanged: onChanged,
  );
}

abstract base class TimeManagerChannel extends PlatformInterface {
  /// Constructs a [TimeManagerChannel].
  TimeManagerChannel() : super(token: _token);

  static final Object _token = Object();

  static TimeManagerChannel? _instance;

  /// The default instance of [TimeManagerChannel] to use.
  static TimeManagerChannel get instance =>
      ArgumentError.checkNotNull(_instance, 'instance');

  /// Sets the default instance of [TimeManagerChannel] to use.
  ///
  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [TimeManagerChannel] when
  /// they register themselves.
  static set instance(TimeManagerChannel instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  TimeManager create();
  TimeManager$TimeZoneDetectorListener createTimeZoneDetectorListener({
    required void Function() onChanged,
  });
}
