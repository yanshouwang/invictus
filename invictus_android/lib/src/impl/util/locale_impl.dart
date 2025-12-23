import 'package:invictus_android/src/impl.dart';
import 'package:invictus_android/src/jni.dart' as jni;
import 'package:invictus_api/invictus_api.dart';

final class LocaleImpl extends ObjectImpl implements Locale {
  @override
  final jni.Locale api;

  LocaleImpl.internal(this.api);
}

final class LocaleChannelImpl extends LocaleChannel {
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
