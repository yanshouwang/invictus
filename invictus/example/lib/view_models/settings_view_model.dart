import 'package:clover/clover.dart';
import 'package:invictus/invictus.dart';

class SettingsViewModel extends ViewModel {
  bool get autoTime => Settings$Global.getInt(Settings$Global.autoTime, 0) != 0;
  set autoTime(bool value) {
    Settings$Global.putInt(Settings$Global.autoTime, value ? 1 : 0);
    notifyListeners();
  }

  bool get autoTimeZone =>
      Settings$Global.getInt(Settings$Global.autoTimeZone, 0) != 0;
  set autoTimeZone(bool value) {
    Settings$Global.putInt(Settings$Global.autoTimeZone, value ? 1 : 0);
    notifyListeners();
  }

  int get screenBrightness =>
      Settings$System.getInt(Settings$System.screenBrightness, 0);
  set screenBrightness(int value) {
    Settings$System.putInt(Settings$System.screenBrightness, value);
    notifyListeners();
  }

  int get time12_24 => Settings$System.getInt(Settings$System.time12_24, -1);
}
