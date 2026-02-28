import 'package:plugin_platform_interface/plugin_platform_interface.dart';

/// Enum for locale categories. These locale categories are used to get/set the default locale for the specific functionality
/// represented by the category.
enum Locale$Category {
  /// Category used to represent the default locale for displaying user interfaces.
  display,

  /// Category used to represent the default locale for formatting dates, numbers, and/or currencies.
  format,
}

/// This enum provides constants to select a filtering mode for locale matching. Refer to RFC 4647 Matching of Language
/// Tags for details.
enum Locale$FilteringMode {
  /// Specifies automatic filtering mode based on the given Language Priority List consisting of language ranges. If all of
  /// the ranges are basic, basic filtering is selected. Otherwise, extended filtering is selected.
  autoselectFiltering,

  /// Specifies extended filtering.
  extendedFiltering,

  /// Specifies basic filtering: Note that any extended language ranges included in the given Language Priority List are
  /// ignored.
  ignoreExtendedRanges,

  /// Specifies basic filtering: If any extended language ranges are included in the given Language Priority List, they are
  /// mapped to the basic language range. Specifically, a language range starting with a subtag "*" is treated as a
  /// language range "*". For example, "*-US" is treated as "*". If "*" is not the first subtag, "*" and extra "-" are
  /// removed. For example, "ja-*-JP" is mapped to "ja-JP".
  mapExtendedRanges,

  /// Specifies basic filtering: If any extended language ranges are included in the given Language Priority List, the list is
  /// rejected and the filtering method throws IllegalArgumentException.
  regjectExtendedRanges,
}

/// Enum for specifying the type defined in ISO 3166. This enum is used to retrieve the two-letter ISO3166-1 alpha-2,
/// three-letter ISO3166-1 alpha-3, four-letter ISO3166-3 country codes.
enum Locale$IsoCountryCode {
  /// PART1_ALPHA2 is used to represent the ISO3166-1 alpha-2 two letter country codes.
  part1Alpha2,

  /// PART1_ALPHA3 is used to represent the ISO3166-1 alpha-3 three letter country codes.
  part1Alpha3,

  /// PART3 is used to represent the ISO3166-3 four letter country codes.
  part3,
}

abstract interface class Locale$LanguageRange {
  static double get maxWeight => Locale$LanguageRangeChannel.instance.maxWeight;
  static double get minWeight => Locale$LanguageRangeChannel.instance.minWeight;

  static List<Locale$LanguageRange> mapEquivalents(
    List<Locale$LanguageRange> priorityList,
    Map<String, List<String>> map,
  ) => Locale$LanguageRangeChannel.instance.mapEquivalents(priorityList, map);

  static List<Locale$LanguageRange> parse(
    String ranges, [
    Map<String, List<String>>? map,
  ]) => Locale$LanguageRangeChannel.instance.parse(ranges, map);

  factory Locale$LanguageRange(String range, [double? weight]) =>
      Locale$LanguageRangeChannel.instance.create(range, weight);

  String get range;
  double get weight;
}

abstract interface class Locale {
  static Locale get canada => LocaleChannel.instance.canada;
  static Locale get canadaFrench => LocaleChannel.instance.canadaFrench;
  static Locale get china => LocaleChannel.instance.china;
  static Locale get chinese => LocaleChannel.instance.chinese;
  static Locale get english => LocaleChannel.instance.english;
  static Locale get france => LocaleChannel.instance.france;
  static Locale get french => LocaleChannel.instance.french;
  static Locale get german => LocaleChannel.instance.german;
  static Locale get germany => LocaleChannel.instance.germany;
  static Locale get italian => LocaleChannel.instance.italian;
  static Locale get italy => LocaleChannel.instance.italy;
  static Locale get japan => LocaleChannel.instance.japan;
  static Locale get japanese => LocaleChannel.instance.japanese;
  static Locale get korea => LocaleChannel.instance.korea;
  static Locale get korean => LocaleChannel.instance.korean;
  static Locale get prc => LocaleChannel.instance.prc;
  static Locale get root => LocaleChannel.instance.root;
  static Locale get simplifiedChinese =>
      LocaleChannel.instance.simplifiedChinese;
  static Locale get taiwan => LocaleChannel.instance.taiwan;
  static Locale get traditionalChinese =>
      LocaleChannel.instance.traditionalChinese;
  static Locale get uk => LocaleChannel.instance.uk;
  static Locale get us => LocaleChannel.instance.us;

  static List<Locale> filter(
    List<Locale$LanguageRange> priorityList,
    List<Locale> locales, [
    Locale$FilteringMode? mode,
  ]) => LocaleChannel.instance.filter(priorityList, locales, mode);

  static List<String> filterTags(
    List<Locale$LanguageRange> priorityList,
    List<String> tags, [
    Locale$FilteringMode? mode,
  ]) => LocaleChannel.instance.filterTags(priorityList, tags, mode);

  static List<Locale> getAvailableLocales() =>
      LocaleChannel.instance.getAvailableLocales();

  static Locale getDefault([Locale$Category? category]) =>
      LocaleChannel.instance.getDefault(category);

  static void setDefault(Locale newLocale, [Locale$Category? category]) =>
      LocaleChannel.instance.setDefault(newLocale, category);

  static List<String> getIsoCountries([Locale$IsoCountryCode? type]) =>
      LocaleChannel.instance.getIsoCountries(type);

  static List<String> getIsoLanguages() =>
      LocaleChannel.instance.getIsoLanguages();

  static Locale? lookup(
    List<Locale$LanguageRange> priorityList,
    List<Locale> locales,
  ) => LocaleChannel.instance.lookup(priorityList, locales);

  static String? lookupTag(
    List<Locale$LanguageRange> priorityList,
    List<String> tags,
  ) => LocaleChannel.instance.lookupTag(priorityList, tags);

  factory Locale({
    List<String> unicodeLocaleAttributes = const [],
    (int key, String value)? extension,
    String? language,
    String? languageTag,
    Locale? locale,
    String? region,
    String? script,
    (String key, String type)? unicodeLocaleKeyword,
    String? variant,
  }) => LocaleChannel.instance.create(
    unicodeLocaleAttributes: unicodeLocaleAttributes,
    extension: extension,
    language: language,
    languageTag: languageTag,
    locale: locale,
    region: region,
    script: script,
    unicodeLocaleKeyword: unicodeLocaleKeyword,
    variant: variant,
  );

  factory Locale.forLanguageTag(String languageTag) =>
      LocaleChannel.instance.forLanguageTag(languageTag);

  factory Locale.of(String language, [String? country, String? variant]) =>
      LocaleChannel.instance.of(language, country, variant);

  String get country;
  Set<int> get extensionKeys;
  String get iso3Country;
  String get iso3Language;
  String get language;
  String get script;
  Set<String> get unicodeLocaleAttributes;
  Set<String> get unicodeLocaleKeys;
  String get variant;
  bool get hasExtensions;

  String getDisplayCountry([Locale? locale]);
  String getDisplayLanguage([Locale? locale]);
  String getDisplayName([Locale? locale]);
  String getDisplayScript([Locale? inLocale]);
  String getDisplayVariant([Locale? inLocale]);
  String? getExtension(int key);
  String? getUnicodeLocaleType(String key);
  Locale stripExtensions();
  String toLanguageTag();
}

abstract base class Locale$LanguageRangeChannel extends PlatformInterface {
  /// Constructs a [Locale$LanguageRangeChannel].
  Locale$LanguageRangeChannel() : super(token: _token);

  static final Object _token = Object();

  static Locale$LanguageRangeChannel? _instance;

  /// The default instance of [Locale$LanguageRangeChannel] to use.
  static Locale$LanguageRangeChannel get instance =>
      ArgumentError.checkNotNull(_instance, 'instance');

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [Locale$LanguageRangeChannel] when
  /// they register themselves.
  static set instance(Locale$LanguageRangeChannel instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  double get maxWeight;
  double get minWeight;

  List<Locale$LanguageRange> mapEquivalents(
    List<Locale$LanguageRange> priorityList,
    Map<String, List<String>> map,
  );
  List<Locale$LanguageRange> parse(
    String ranges, [
    Map<String, List<String>>? map,
  ]);

  Locale$LanguageRange create(String range, [double? weight]);
}

abstract base class LocaleChannel extends PlatformInterface {
  /// Constructs a [LocaleChannel].
  LocaleChannel() : super(token: _token);

  static final Object _token = Object();

  static LocaleChannel? _instance;

  /// The default instance of [LocaleChannel] to use.
  static LocaleChannel get instance =>
      ArgumentError.checkNotNull(_instance, 'instance');

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [LocaleChannel] when
  /// they register themselves.
  static set instance(LocaleChannel instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Locale get canada;
  Locale get canadaFrench;
  Locale get china;
  Locale get chinese;
  Locale get english;
  Locale get france;
  Locale get french;
  Locale get german;
  Locale get germany;
  Locale get italian;
  Locale get italy;
  Locale get japan;
  Locale get japanese;
  Locale get korea;
  Locale get korean;
  Locale get prc;
  Locale get root;
  Locale get simplifiedChinese;
  Locale get taiwan;
  Locale get traditionalChinese;
  Locale get uk;
  Locale get us;

  List<Locale> filter(
    List<Locale$LanguageRange> priorityList,
    List<Locale> locales, [
    Locale$FilteringMode? mode,
  ]);
  List<String> filterTags(
    List<Locale$LanguageRange> priorityList,
    List<String> tags, [
    Locale$FilteringMode? mode,
  ]);
  Locale forLanguageTag(String languageTag);
  List<Locale> getAvailableLocales();
  Locale getDefault([Locale$Category? category]);
  void setDefault(Locale newLocale, [Locale$Category? category]);
  List<String> getIsoCountries([Locale$IsoCountryCode? type]);
  List<String> getIsoLanguages();
  Locale? lookup(List<Locale$LanguageRange> priorityList, List<Locale> locales);
  String? lookupTag(List<Locale$LanguageRange> priorityList, List<String> tags);
  Locale of(String language, [String? country, String? variant]);

  Locale create({
    List<String> unicodeLocaleAttributes = const [],
    (int key, String value)? extension,
    String? language,
    String? languageTag,
    Locale? locale,
    String? region,
    String? script,
    (String key, String type)? unicodeLocaleKeyword,
    String? variant,
  });
}
