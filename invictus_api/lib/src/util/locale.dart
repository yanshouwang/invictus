import 'package:plugin_platform_interface/plugin_platform_interface.dart';

abstract interface class Locale {
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
