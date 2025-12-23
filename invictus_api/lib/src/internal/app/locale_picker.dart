import 'package:invictus_api/src/os.dart';
import 'package:invictus_api/src/util.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

abstract interface class LocalePicker$LocaleSelectionListener {
  factory LocalePicker$LocaleSelectionListener({
    required void Function(Locale locale) onLocaleSelected,
  }) => LocalePickerChannel.instance.createLocaleSelectionListener(
    onLocaleSelected: onLocaleSelected,
  );
}

abstract interface class LocalePicker$LocaleInfo
    implements Comparable<LocalePicker$LocaleInfo> {
  factory LocalePicker$LocaleInfo(String label, Locale locale) =>
      LocalePickerChannel.instance.createLocaleInfo(label, locale);

  String get label;
  Locale get locale;
}

abstract interface class LocalePicker {
  // TODO
  static List<String> getSystemAssetLocales() =>
      LocalePickerChannel.instance.getSystemAssetLocales();

  // TODO
  static List<String> getSupportedLocales() =>
      LocalePickerChannel.instance.getSupportedLocales();

  // TODO
  static List<LocalePicker$LocaleInfo> getAllAssetLocales({
    bool isInDeveloperMode = false,
  }) => LocalePickerChannel.instance.getAllAssetLocales(
    isInDeveloperMode: isInDeveloperMode,
  );

  // TODO
  static void setLocaleSelectionListener(
    LocalePicker$LocaleSelectionListener listener,
  ) => LocalePickerChannel.instance.setLocaleSelectionListener(listener);

  /// Requests the system to update the system locale. Note that the system looks halted
  /// for a while during the Locale migration, so the caller need to take care of it.
  ///
  /// @see #updateLocales(LocaleList)
  static void updateLocale(Locale locale) =>
      LocalePickerChannel.instance.updateLocale(locale);

  /// Requests the system to update the list of system locales.
  /// Note that the system looks halted for a while during the Locale migration,
  /// so the caller need to take care of it.
  static void updateLocales(LocaleList locales) =>
      LocalePickerChannel.instance.updateLocales(locales);

  /// Get the locale list.
  ///
  /// @return The locale list.
  static LocaleList getLocales() => LocalePickerChannel.instance.getLocales();
}

abstract base class LocalePickerChannel extends PlatformInterface {
  /// Constructs a [LocalePickerChannel].
  LocalePickerChannel() : super(token: _token);

  static final Object _token = Object();

  static LocalePickerChannel? _instance;

  /// The default instance of [LocalePickerChannel] to use.
  static LocalePickerChannel get instance =>
      ArgumentError.checkNotNull(_instance, 'instance');

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [LocalePickerChannel] when
  /// they register themselves.
  static set instance(LocalePickerChannel instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  LocalePicker$LocaleSelectionListener createLocaleSelectionListener({
    required void Function(Locale locale) onLocaleSelected,
  });
  LocalePicker$LocaleInfo createLocaleInfo(String label, Locale locale);

  List<String> getSystemAssetLocales();
  List<String> getSupportedLocales();
  List<LocalePicker$LocaleInfo> getAllAssetLocales({
    bool isInDeveloperMode = false,
  });
  void setLocaleSelectionListener(
    LocalePicker$LocaleSelectionListener listener,
  );
  void updateLocale(Locale locale);
  void updateLocales(LocaleList locales);
  LocaleList getLocales();
}
