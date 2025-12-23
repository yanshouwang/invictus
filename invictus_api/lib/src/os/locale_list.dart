import 'package:invictus_api/src/icu.dart';
import 'package:invictus_api/src/util.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

abstract interface class LocaleList {
  static LocaleList getAdjustedDefault() =>
      LocaleListChannel.instance.getAdjustedDefault();

  static LocaleList getDefault() => LocaleListChannel.instance.getDefault();

  static void setDefault(LocaleList value) =>
      LocaleListChannel.instance.setDefault(value);

  static bool isPseudoLocale([ULocale? locale]) =>
      LocaleListChannel.instance.isPseudoLocale(locale);

  static bool matchesLanguageAndScript(Locale supported, Locale desired) =>
      LocaleListChannel.instance.matchesLanguageAndScript(supported, desired);

  factory LocaleList([List<Locale> locales = const []]) =>
      LocaleListChannel.instance.create(locales);

  factory LocaleList.forLanguageTags([String? list]) =>
      LocaleListChannel.instance.forLanguageTags(list);

  factory LocaleList.emptyLocaleList() =>
      LocaleListChannel.instance.getEmptyLocaleList();

  Locale get(int index);
  Locale? getFirstMatch(List<String> supportedLocales);
  int indexOf(Locale locale);
  bool get isEmpty;
  int get size;
  String toLanguageTags();
}

abstract base class LocaleListChannel extends PlatformInterface {
  /// Constructs a [LocaleListChannel].
  LocaleListChannel() : super(token: _token);

  static final Object _token = Object();

  static LocaleListChannel? _instance;

  /// The default instance of [LocaleListChannel] to use.
  static LocaleListChannel get instance =>
      ArgumentError.checkNotNull(_instance, 'instance');

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [LocaleListChannel] when
  /// they register themselves.
  static set instance(LocaleListChannel instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  LocaleList create([List<Locale> locales = const []]);

  LocaleList forLanguageTags([String? list]);
  LocaleList getAdjustedDefault();
  LocaleList getDefault();
  void setDefault(LocaleList locales);
  LocaleList getEmptyLocaleList();
  bool isPseudoLocale([ULocale? locale]);
  bool matchesLanguageAndScript(Locale supported, Locale desired);
}
