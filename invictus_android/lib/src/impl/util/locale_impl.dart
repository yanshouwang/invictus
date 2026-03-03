import 'package:invictus_android/src/impl.dart';
import 'package:invictus_android/src/jni.dart' as jni;
import 'package:invictus_api/invictus_api.dart';

final class Locale$LanguageRangeImpl extends ObjectImpl
    implements Locale$LanguageRange {
  @override
  final jni.Locale$LanguageRange api;

  Locale$LanguageRangeImpl.internal(this.api);

  @override
  String get range {
    final rangeApiOrNull = api.getRange();
    final rangeApi = ArgumentError.checkNotNull(rangeApiOrNull, 'rangeApi');
    return rangeApi.impl;
  }

  @override
  double get weight {
    final weightOrNull = api.getWeight();
    final weight = ArgumentError.checkNotNull(weightOrNull, 'weight');
    return weight;
  }
}

final class LocaleImpl extends ObjectImpl implements Locale {
  @override
  final jni.Locale api;

  LocaleImpl.internal(this.api);

  @override
  String get country {
    final countryApiOrNull = api.getCountry();
    final countryApi = ArgumentError.checkNotNull(
      countryApiOrNull,
      'countryApi',
    );
    return countryApi.impl;
  }

  @override
  Set<int> get extensionKeys {
    final extensionKeysApiOrNull = api.getExtensionKeys();
    final extensionKeysApi = ArgumentError.checkNotNull(
      extensionKeysApiOrNull,
      'extensionKeysApi',
    );
    return extensionKeysApi.nonNulls.map((e) => e.impl).toSet();
  }

  @override
  String get iso3Country {
    final iso3CountryApiOrNull = api.getISO3Country();
    final iso3CountryApi = ArgumentError.checkNotNull(
      iso3CountryApiOrNull,
      'iso3CountryApi',
    );
    return iso3CountryApi.impl;
  }

  @override
  String get iso3Language {
    final iso3LanguageApiOrNull = api.getISO3Language();
    final iso3LanguageApi = ArgumentError.checkNotNull(
      iso3LanguageApiOrNull,
      'iso3LanguageApi',
    );
    return iso3LanguageApi.impl;
  }

  @override
  String get language {
    final languageApiOrNull = api.getLanguage();
    final languageApi = ArgumentError.checkNotNull(
      languageApiOrNull,
      'languageApi',
    );
    return languageApi.impl;
  }

  @override
  String get script {
    final scriptApiOrNull = api.getScript();
    final scriptApi = ArgumentError.checkNotNull(scriptApiOrNull, 'scriptApi');
    return scriptApi.impl;
  }

  @override
  Set<String> get unicodeLocaleAttributes {
    final unicodeLocaleAttributesApiOrNull = api.getUnicodeLocaleAttributes();
    final unicodeLocaleAttributesApi = ArgumentError.checkNotNull(
      unicodeLocaleAttributesApiOrNull,
      'unicodeLocaleAttributesApi',
    );
    return unicodeLocaleAttributesApi.nonNulls.map((e) => e.impl).toSet();
  }

  @override
  Set<String> get unicodeLocaleKeys {
    final unicodeLocaleKeysApiOrNull = api.getUnicodeLocaleKeys();
    final unicodeLocaleKeysApi = ArgumentError.checkNotNull(
      unicodeLocaleKeysApiOrNull,
      'unicodeLocaleKeysApi',
    );
    return unicodeLocaleKeysApi.nonNulls.map((e) => e.impl).toSet();
  }

  @override
  String get variant {
    final variantApiOrNull = api.getVariant();
    final variantApi = ArgumentError.checkNotNull(
      variantApiOrNull,
      'variantApi',
    );
    return variantApi.impl;
  }

  @override
  bool get hasExtensions => api.hasExtensions();

  @override
  String getDisplayCountry([Locale? locale]) {
    final displayCountryApiOrNull = locale == null
        ? api.getDisplayCountry()
        : api.getDisplayCountry$1(locale.api);
    final displayCountryApi = ArgumentError.checkNotNull(
      displayCountryApiOrNull,
      'displayCountryApi',
    );
    return displayCountryApi.impl;
  }

  @override
  String getDisplayLanguage([Locale? locale]) {
    final displayLanguageApiOrNull = locale == null
        ? api.getDisplayLanguage()
        : api.getDisplayLanguage$1(locale.api);
    final displayLanguageApi = ArgumentError.checkNotNull(
      displayLanguageApiOrNull,
      'displayLanguageApi',
    );
    return displayLanguageApi.impl;
  }

  @override
  String getDisplayName([Locale? locale]) {
    final displayNameApiOrNull = locale == null
        ? api.getDisplayName()
        : api.getDisplayName$1(locale.api);
    final displayNameApi = ArgumentError.checkNotNull(
      displayNameApiOrNull,
      'displayNameApi',
    );
    return displayNameApi.impl;
  }

  @override
  String getDisplayScript([Locale? inLocale]) {
    final displayScriptApiOrNull = inLocale == null
        ? api.getDisplayScript()
        : api.getDisplayScript$1(inLocale.api);
    final displayScriptApi = ArgumentError.checkNotNull(
      displayScriptApiOrNull,
      'displayScriptApi',
    );
    return displayScriptApi.impl;
  }

  @override
  String getDisplayVariant([Locale? inLocale]) {
    final displayVariantApiOrNull = inLocale == null
        ? api.getDisplayVariant()
        : api.getDisplayVariant$1(inLocale.api);
    final displayVariantApi = ArgumentError.checkNotNull(
      displayVariantApiOrNull,
      'displayVariantApi',
    );
    return displayVariantApi.impl;
  }

  @override
  String? getExtension(int key) => api.getExtension(key)?.impl;

  @override
  String? getUnicodeLocaleType(String key) =>
      api.getUnicodeLocaleType(key.api)?.impl;

  @override
  Locale stripExtensions() {
    final stripExtensionsApiOrNull = api.stripExtensions();
    final stripExtensionsApi = ArgumentError.checkNotNull(
      stripExtensionsApiOrNull,
      'stripExtensionsApi',
    );
    return stripExtensionsApi.impl;
  }

  @override
  String toLanguageTag() {
    final languageTagApiOrNull = api.toLanguageTag();
    final languageTagApi = ArgumentError.checkNotNull(
      languageTagApiOrNull,
      'languageTagApi',
    );
    return languageTagApi.impl;
  }
}

final class Locale$LanguageRangeChannelImpl
    extends Locale$LanguageRangeChannel {
  @override
  double get maxWeight => jni.Locale$LanguageRange.MAX_WEIGHT;
  @override
  double get minWeight => jni.Locale$LanguageRange.MIN_WEIGHT;

  @override
  List<Locale$LanguageRange> mapEquivalents(
    List<Locale$LanguageRange> priorityList,
    Map<String, List<String>> map,
  ) {
    final equivalentsApiOrNull = jni.Locale$LanguageRange.mapEquivalents(
      priorityList.map((e) => e.api).toJList(jni.Locale$LanguageRange.type),
      map
          .map(
            (key, value) => MapEntry(
              key.api,
              value.map((e) => e.api).toJList(jni.JString.type),
            ),
          )
          .toJMap(jni.JString.type, jni.JList.type(jni.JString.type)),
    );
    final equivalentsApi = ArgumentError.checkNotNull(
      equivalentsApiOrNull,
      'equivalentsApi',
    );
    return equivalentsApi.nonNulls.map((e) => e.impl).toList();
  }

  @override
  List<Locale$LanguageRange> parse(
    String ranges, [
    Map<String, List<String>>? map,
  ]) {
    final languageRangesApiOrNull = map == null
        ? jni.Locale$LanguageRange.parse(ranges.api)
        : jni.Locale$LanguageRange.parse$1(
            ranges.api,
            map
                .map(
                  (key, value) => MapEntry(
                    key.api,
                    value.map((e) => e.api).toJList(jni.JString.type),
                  ),
                )
                .toJMap(jni.JString.type, jni.JList.type(jni.JString.type)),
          );
    final languageRangesApi = ArgumentError.checkNotNull(
      languageRangesApiOrNull,
      'languageRangesApi',
    );
    return languageRangesApi.nonNulls.map((e) => e.impl).toList();
  }

  @override
  Locale$LanguageRange create(String range, [double? weight]) {
    final api = weight == null
        ? jni.Locale$LanguageRange(range.api)
        : jni.Locale$LanguageRange.new$1(range.api, weight);
    return Locale$LanguageRangeImpl.internal(api);
  }
}

final class LocaleChannelImpl extends LocaleChannel {
  @override
  Locale get canada =>
      ArgumentError.checkNotNull(jni.Locale.CANADA, 'CANADA').impl;
  @override
  Locale get canadaFrench => ArgumentError.checkNotNull(
    jni.Locale.CANADA_FRENCH,
    'CANADA_FRENCH',
  ).impl;
  @override
  Locale get china =>
      ArgumentError.checkNotNull(jni.Locale.CHINA, 'CHINA').impl;
  @override
  Locale get chinese =>
      ArgumentError.checkNotNull(jni.Locale.CHINESE, 'CHINESE').impl;
  @override
  Locale get english =>
      ArgumentError.checkNotNull(jni.Locale.ENGLISH, 'ENGLISH').impl;
  @override
  Locale get france =>
      ArgumentError.checkNotNull(jni.Locale.FRANCE, 'FRANCE').impl;
  @override
  Locale get french =>
      ArgumentError.checkNotNull(jni.Locale.FRENCH, 'FRENCH').impl;
  @override
  Locale get german =>
      ArgumentError.checkNotNull(jni.Locale.GERMAN, 'GERMAN').impl;
  @override
  Locale get germany =>
      ArgumentError.checkNotNull(jni.Locale.GERMANY, 'GERMANY').impl;
  @override
  Locale get italian =>
      ArgumentError.checkNotNull(jni.Locale.ITALIAN, 'ITALIAN').impl;
  @override
  Locale get italy =>
      ArgumentError.checkNotNull(jni.Locale.ITALY, 'ITALY').impl;
  @override
  Locale get japan =>
      ArgumentError.checkNotNull(jni.Locale.JAPAN, 'JAPAN').impl;
  @override
  Locale get japanese =>
      ArgumentError.checkNotNull(jni.Locale.JAPANESE, 'JAPANESE').impl;
  @override
  Locale get korea =>
      ArgumentError.checkNotNull(jni.Locale.KOREA, 'KOREA').impl;
  @override
  Locale get korean =>
      ArgumentError.checkNotNull(jni.Locale.KOREAN, 'KOREAN').impl;
  @override
  Locale get prc => ArgumentError.checkNotNull(jni.Locale.PRC, 'PRC').impl;
  @override
  Locale get root => ArgumentError.checkNotNull(jni.Locale.ROOT, 'ROOT').impl;
  @override
  Locale get simplifiedChinese => ArgumentError.checkNotNull(
    jni.Locale.SIMPLIFIED_CHINESE,
    'SIMPLIFIED_CHINESE',
  ).impl;
  @override
  Locale get taiwan =>
      ArgumentError.checkNotNull(jni.Locale.TAIWAN, 'TAIWAN').impl;
  @override
  Locale get traditionalChinese => ArgumentError.checkNotNull(
    jni.Locale.TRADITIONAL_CHINESE,
    'TRADITIONAL_CHINESE',
  ).impl;
  @override
  Locale get uk => ArgumentError.checkNotNull(jni.Locale.UK, 'UK').impl;
  @override
  Locale get us => ArgumentError.checkNotNull(jni.Locale.US, 'US').impl;

  @override
  List<Locale> filter(
    List<Locale$LanguageRange> priorityList,
    List<Locale> locales, [
    Locale$FilteringMode? mode,
  ]) {
    final localesApiOrNull = mode == null
        ? jni.Locale.filter(
            priorityList
                .map((e) => e.api)
                .toJList(jni.Locale$LanguageRange.type),
            locales
                .map((e) => e.api)
                .toJList(jni.Locale.type)
                .as(jni.Collection.type(jni.Locale.type)),
          )
        : jni.Locale.filter$1(
            priorityList
                .map((e) => e.api)
                .toJList(jni.Locale$LanguageRange.type),
            locales
                .map((e) => e.api)
                .toJList(jni.Locale.type)
                .as(jni.Collection.type(jni.Locale.type)),
            mode.api,
          );
    final localesApi = ArgumentError.checkNotNull(
      localesApiOrNull,
      'localesApi',
    );
    return localesApi.nonNulls.map((e) => e.impl).toList();
  }

  @override
  List<String> filterTags(
    List<Locale$LanguageRange> priorityList,
    List<String> tags, [
    Locale$FilteringMode? mode,
  ]) {
    final tagsApiOrNull = mode == null
        ? jni.Locale.filterTags(
            priorityList
                .map((e) => e.api)
                .toJList(jni.Locale$LanguageRange.type),
            tags
                .map((e) => e.api)
                .toJList(jni.JString.type)
                .as(jni.Collection.type(jni.JString.type)),
          )
        : jni.Locale.filterTags$1(
            priorityList
                .map((e) => e.api)
                .toJList(jni.Locale$LanguageRange.type),
            tags
                .map((e) => e.api)
                .toJList(jni.JString.type)
                .as(jni.Collection.type(jni.JString.type)),
            mode.api,
          );
    final tagsApi = ArgumentError.checkNotNull(tagsApiOrNull, 'tagsApi');
    return tagsApi.nonNulls.map((e) => e.impl).toList();
  }

  @override
  Locale forLanguageTag(String languageTag) {
    final apiOrNull = jni.Locale.forLanguageTag(languageTag.api);
    final api = ArgumentError.checkNotNull(apiOrNull, 'api');
    return LocaleImpl.internal(api);
  }

  @override
  List<Locale> getAvailableLocales() {
    final availableLocalesApiOrNull = jni.Locale.getAvailableLocales();
    final availableLocalesApi = ArgumentError.checkNotNull(
      availableLocalesApiOrNull,
      'availableLocalesApi',
    );
    return availableLocalesApi.nonNulls.map((e) => e.impl).toList();
  }

  @override
  Locale getDefault([Locale$Category? category]) {
    final apiOrNull = category == null
        ? jni.Locale.getDefault()
        : jni.Locale.getDefault$1(category.api);
    final api = ArgumentError.checkNotNull(apiOrNull, 'api');
    return LocaleImpl.internal(api);
  }

  @override
  void setDefault(Locale newLocale, [Locale$Category? category]) =>
      category == null
      ? jni.Locale.setDefault(newLocale.api)
      : jni.Locale.setDefault$1(category.api, newLocale.api);

  @override
  List<String> getIsoCountries([Locale$IsoCountryCode? type]) {
    final isoCountriesApiOrNull = type == null
        ? jni.Locale.getISOCountries()?.toJList(jni.JString.type)
        : jni.Locale.getISOCountries$1(type.api)?.toJList(jni.JString.type);
    final isoCountriesApi = ArgumentError.checkNotNull(
      isoCountriesApiOrNull,
      'isoCountriesApi',
    );
    return isoCountriesApi.nonNulls.map((e) => e.impl).toList();
  }

  @override
  List<String> getIsoLanguages() {
    final isoLanguagesApiOrNull = jni.Locale.getISOLanguages();
    final isoLanguagesApi = ArgumentError.checkNotNull(
      isoLanguagesApiOrNull,
      'isoLanguagesApi',
    );
    return isoLanguagesApi.nonNulls.map((e) => e.impl).toList();
  }

  @override
  Locale? lookup(
    List<Locale$LanguageRange> priorityList,
    List<Locale> locales,
  ) => jni.Locale.lookup(
    priorityList.map((e) => e.api).toJList(jni.Locale$LanguageRange.type),
    locales
        .map((e) => e.api)
        .toJList(jni.Locale.type)
        .as(jni.Collection.type(jni.Locale.type)),
  )?.impl;

  @override
  String? lookupTag(
    List<Locale$LanguageRange> priorityList,
    List<String> tags,
  ) => jni.Locale.lookupTag(
    priorityList.map((e) => e.api).toJList(jni.Locale$LanguageRange.type),
    tags
        .map((e) => e.api)
        .toJList(jni.JString.type)
        .as(jni.Collection.type(jni.JString.type)),
  )?.impl;

  @override
  Locale of(String language, [String? country, String? variant]) {
    final apiOrNull = country == null
        ? jni.Locale.of(language.api)
        : variant == null
        ? jni.Locale.of$1(language.api, country.api)
        : jni.Locale.of$2(language.api, country.api, variant.api);
    final api = ArgumentError.checkNotNull(apiOrNull, 'api');
    return LocaleImpl.internal(api);
  }

  @override
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
  }) {
    final builder = jni.Locale$Builder();
    for (final attribute in unicodeLocaleAttributes) {
      builder.addUnicodeLocaleAttribute(attribute.api);
    }
    if (extension != null) builder.setExtension(extension.$1, extension.$2.api);
    if (language != null) builder.setLanguage(language.api);
    if (languageTag != null) builder.setLanguageTag(languageTag.api);
    if (locale != null) builder.setLocale(locale.api);
    if (region != null) builder.setRegion(region.api);
    if (script != null) builder.setScript(script.api);
    if (unicodeLocaleKeyword != null) {
      builder.setUnicodeLocaleKeyword(
        unicodeLocaleKeyword.$1.api,
        unicodeLocaleKeyword.$2.api,
      );
    }
    if (variant != null) builder.setVariant(variant.api);
    final apiOrNull = builder.build();
    final api = ArgumentError.checkNotNull(apiOrNull, 'api');
    return LocaleImpl.internal(api);
  }
}

extension Invictus$Locale$CategoryX on Locale$Category {
  jni.Locale$Category get api {
    switch (this) {
      case Locale$Category.display:
        return jni.Locale$Category.DISPLAY;
      case Locale$Category.format:
        return jni.Locale$Category.FORMAT;
    }
  }
}

extension Invictus$Locale$FilteringModeX on Locale$FilteringMode {
  jni.Locale$FilteringMode get api {
    switch (this) {
      case Locale$FilteringMode.autoselectFiltering:
        return jni.Locale$FilteringMode.AUTOSELECT_FILTERING;
      case Locale$FilteringMode.extendedFiltering:
        return jni.Locale$FilteringMode.EXTENDED_FILTERING;
      case Locale$FilteringMode.ignoreExtendedRanges:
        return jni.Locale$FilteringMode.IGNORE_EXTENDED_RANGES;
      case Locale$FilteringMode.mapExtendedRanges:
        return jni.Locale$FilteringMode.MAP_EXTENDED_RANGES;
      case Locale$FilteringMode.rejectExtendedRanges:
        return jni.Locale$FilteringMode.REJECT_EXTENDED_RANGES;
    }
  }
}

extension Invictus$Locale$IsoCountryCodeX on Locale$IsoCountryCode {
  jni.Locale$IsoCountryCode get api {
    switch (this) {
      case Locale$IsoCountryCode.part1Alpha2:
        return jni.Locale$IsoCountryCode.PART1_ALPHA2;
      case Locale$IsoCountryCode.part1Alpha3:
        return jni.Locale$IsoCountryCode.PART1_ALPHA3;
      case Locale$IsoCountryCode.part3:
        return jni.Locale$IsoCountryCode.PART3;
    }
  }
}

extension Invictus$Locale$LanguageRangeX on Locale$LanguageRange {
  jni.Locale$LanguageRange get api {
    final impl = this;
    if (impl is! Locale$LanguageRangeImpl) throw TypeError();
    return impl.api;
  }
}

extension Invictus$JLocale$LanguageRangeX on jni.Locale$LanguageRange {
  Locale$LanguageRange get impl => Locale$LanguageRangeImpl.internal(this);
}

extension Invictus$LocaleX on Locale {
  jni.Locale get api {
    final impl = this;
    if (impl is! LocaleImpl) throw TypeError();
    return impl.api;
  }
}

extension Invictus$JLocaleX on jni.Locale {
  Locale get impl => LocaleImpl.internal(this);
}
