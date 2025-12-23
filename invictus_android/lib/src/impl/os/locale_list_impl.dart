import 'package:invictus_android/src/impl.dart';
import 'package:invictus_android/src/jni.dart' as jni;
import 'package:invictus_api/invictus_api.dart';

final class LocaleListImpl extends ObjectImpl implements LocaleList {
  @override
  final jni.LocaleList api;

  LocaleListImpl.internal(this.api);

  @override
  Locale get(int index) {
    final localeApiOrNull = api.get(index);
    final localeApi = ArgumentError.checkNotNull(localeApiOrNull, 'localeApi');
    return localeApi.impl;
  }

  @override
  Locale? getFirstMatch(List<String> supportedLocales) => api
      .getFirstMatch(
        jni.JArray.of(jni.JString.type, supportedLocales.map((e) => e.api)),
      )
      ?.impl;

  @override
  int indexOf(Locale locale) => api.indexOf(locale.api);

  @override
  bool get isEmpty => api.isEmpty();

  @override
  int get size => api.size();

  @override
  String toLanguageTags() => api.toLanguageTags().impl;
}

final class LocaleListChannelImpl extends LocaleListChannel {
  @override
  LocaleList create([List<Locale> locales = const []]) {
    final localeApis = jni.JArray.of(
      jni.Locale.type,
      locales.map((e) => e.api),
    );
    final api = jni.LocaleList(localeApis);
    return LocaleListImpl.internal(api);
  }

  @override
  LocaleList forLanguageTags([String? list]) {
    final api = jni.LocaleList.forLanguageTags(list?.api);
    return LocaleListImpl.internal(api);
  }

  @override
  LocaleList getAdjustedDefault() {
    final api = jni.LocaleList.getAdjustedDefault();
    return LocaleListImpl.internal(api);
  }

  @override
  LocaleList getDefault() {
    final api = jni.LocaleList.getDefault();
    return LocaleListImpl.internal(api);
  }

  @override
  void setDefault(LocaleList locales) {
    jni.LocaleList.setDefault(locales.api);
  }

  @override
  LocaleList getEmptyLocaleList() {
    final api = jni.LocaleList.getEmptyLocaleList();
    return LocaleListImpl.internal(api);
  }

  @override
  bool isPseudoLocale([ULocale? locale]) =>
      jni.LocaleList.isPseudoLocale(locale?.api);

  @override
  bool matchesLanguageAndScript(Locale supported, Locale desired) =>
      jni.LocaleList.matchesLanguageAndScript(supported.api, desired.api);
}

extension Invictus$LocaleListX on LocaleList {
  jni.LocaleList get api {
    final impl = this;
    if (impl is! LocaleListImpl) throw TypeError();
    return impl.api;
  }
}

extension Invictus$JLocaleListX on jni.LocaleList {
  LocaleList get impl => LocaleListImpl.internal(this);
}
