import 'package:clover/clover.dart';
import 'package:invictus/invictus.dart';
import 'package:logging/logging.dart';

Logger get _logger => Logger('LocaleViewModel');

class LocaleViewModel extends ViewModel {
  final ActivityManager _activityManager;

  late final List<Locale> _supportedLocales;
  late LocaleList _locales;

  List<Locale> get supportedLocales => List.unmodifiable(_supportedLocales);

  List<Locale> get locales =>
      List.generate(_locales.size, (i) => _locales.get(i), growable: false);
  set locales(List<Locale> value) {
    final locales = LocaleList(value);
    _activityManager.deviceLocales = locales;
    // LocalePicker.updateLocales(locales);
    _locales = LocaleList.getAdjustedDefault();
    notifyListeners();
  }

  LocaleViewModel() : _activityManager = ActivityManager() {
    _supportedLocales = _activityManager.supportedLocales;
    _locales = LocaleList.getAdjustedDefault();
    notifyListeners();
    final locales = LocalePicker.getLocales();
    _logger.info('getLocales: $locales');
    final supportedLocales = LocalePicker.getSupportedLocales();
    _logger.info('getSupportedLocales: $supportedLocales');
    final systemAssetLocales = LocalePicker.getSystemAssetLocales();
    _logger.info('getSystemAssetLocales: $systemAssetLocales');
    final allAssetLocales = LocalePicker.getAllAssetLocales();
    _logger.info('getAllAssetLocales: $allAssetLocales');
  }
}
