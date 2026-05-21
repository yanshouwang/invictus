import 'package:clover/clover.dart';
import 'package:invictus/invictus.dart';
import 'package:logging/logging.dart';

Logger get _logger => Logger('TimeViewModel');

class TimeViewModel extends ViewModel {
  final TimeManager _timeManager;

  TimeViewModel() : _timeManager = TimeManager();

  DateTime get now => DateTime.now();

  bool get autoTime => _timeManager
      .timeCapabilitiesAndConfig
      .configuration
      .isAutoDetectionEnabled;
  set autoTime(bool value) {
    final configuration = TimeConfiguration$Builder()
        .setAutoDetectionEnabled(value)
        .build();
    final res = _timeManager.updateTimeConfiguration(configuration);
    _logger.info('updateTimeConfiguration: $res');
    notifyListeners();
  }

  bool get autoTimeZone => _timeManager
      .timeZoneCapabilitiesAndConfig
      .configuration
      .isAutoDetectionEnabled;
  set autoTimeZone(bool value) {
    final configuration = TimeZoneConfiguration$Builder()
        .setAutoDetectionEnabled(value)
        .build();
    _timeManager.updateTimeZoneConfiguration(configuration);
    notifyListeners();
  }

  bool setSystemDate(int year, int month, int day) {
    final millis = DateTime.now()
        .copyWith(year: year, month: month, day: day)
        .millisecondsSinceEpoch;
    final res = SystemClock.setCurrentTimeMillis(millis);
    notifyListeners();
    return res;
  }

  bool setSystemTime(int hour, int minute, int second) {
    final millis = DateTime.now()
        .copyWith(hour: hour, minute: minute, second: second)
        .millisecondsSinceEpoch;
    final res = SystemClock.setCurrentTimeMillis(millis);
    notifyListeners();
    return res;
  }
}
