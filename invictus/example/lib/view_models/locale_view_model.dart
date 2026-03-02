import 'package:clover/clover.dart';
import 'package:invictus/invictus.dart';
import 'package:logging/logging.dart';

Logger get _logger => Logger('LocaleViewModel');

class LocaleViewModel extends ViewModel {
  // final ActivityManager _activityManager;

  LocaleList _locales;

  List<Locale> get locales =>
      List.generate(_locales.size, (i) => _locales.get(i));
  set locales(List<Locale> value) {
    final locales = LocaleList(value);
    // _activityManager.deviceLocales = locales;
    // _locales = LocaleList.getAdjustedDefault();
    LocalePicker.updateLocales(locales);
    _locales = LocalePicker.getLocales();
    notifyListeners();
  }

  LocaleViewModel() : _locales = LocalePicker.getLocales() {
    // _supportedLocales = _activityManager.supportedLocales;
    // _locales = LocaleList.getAdjustedDefault();
    final supportedLocales = LocalePicker.getSupportedLocales();
    _logger.info('getSupportedLocales: $supportedLocales');
    final systemAssetLocales = LocalePicker.getSystemAssetLocales();
    _logger.info('getSystemAssetLocales: $systemAssetLocales');
    final allAssetLocales = LocalePicker.getAllAssetLocales();
    _logger.info('getAllAssetLocales: $allAssetLocales');
  }
}
