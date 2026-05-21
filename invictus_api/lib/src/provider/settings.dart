import 'package:invictus_api/src/net.dart' as net;
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

abstract interface class Settings {
  factory Settings() => SettingsChannel.instance.create();

  static bool canDrawOverlays() => SettingsChannel.instance.canDrawOverlays();
}

abstract interface class Settings$NameValueTable {
  factory Settings$NameValueTable() =>
      Settings$NameValueTableChannel.instance.create();

  static String get name => Settings$NameValueTableChannel.instance.name;
  static String get value => Settings$NameValueTableChannel.instance.value;

  static net.Uri? getUriFor(net.Uri uri, String name) =>
      Settings$NameValueTableChannel.instance.getUriFor(uri, name);
}

abstract interface class Settings$Global implements Settings$NameValueTable {
  factory Settings$Global() => Settings$GlobalChannel.instance.create();

  static net.Uri get contentUri => Settings$GlobalChannel.instance.contentUri;
  static String get autoTime => Settings$GlobalChannel.instance.autoTime;
  static String get autoTimeZone =>
      Settings$GlobalChannel.instance.autoTimeZone;

  static double getFloat(String name, [double? defaultValue]) =>
      Settings$GlobalChannel.instance.getFloat(name, defaultValue);

  static int getInt(String name, [int? defaultValue]) =>
      Settings$GlobalChannel.instance.getInt(name, defaultValue);

  static int getLong(String name, [int? defaultValue]) =>
      Settings$GlobalChannel.instance.getLong(name, defaultValue);

  static String? getString(String name) =>
      Settings$GlobalChannel.instance.getString(name);

  static net.Uri? getUriFor(String name) =>
      Settings$GlobalChannel.instance.getUriFor(name);

  static bool putFloat(String name, double value) =>
      Settings$GlobalChannel.instance.putFloat(name, value);

  static bool putInt(String name, int value) =>
      Settings$GlobalChannel.instance.putInt(name, value);

  static bool putLong(String name, int value) =>
      Settings$GlobalChannel.instance.putLong(name, value);

  static bool putString(String name, String value) =>
      Settings$GlobalChannel.instance.putString(name, value);
}

abstract interface class Settings$Secure implements Settings$NameValueTable {
  factory Settings$Secure() => Settings$SecureChannel.instance.create();

  static net.Uri get contentUri => Settings$SecureChannel.instance.contentUri;

  static double getFloat(String name, [double? defaultValue]) =>
      Settings$SecureChannel.instance.getFloat(name, defaultValue);

  static int getInt(String name, [int? defaultValue]) =>
      Settings$SecureChannel.instance.getInt(name, defaultValue);

  static int getLong(String name, [int? defaultValue]) =>
      Settings$SecureChannel.instance.getLong(name, defaultValue);

  static String? getString(String name) =>
      Settings$SecureChannel.instance.getString(name);

  static net.Uri? getUriFor(String name) =>
      Settings$SecureChannel.instance.getUriFor(name);

  static bool isLocationProviderEnabled(String provider) =>
      Settings$SecureChannel.instance.isLocationProviderEnabled(provider);

  static bool putFloat(String name, double value) =>
      Settings$SecureChannel.instance.putFloat(name, value);

  static bool putInt(String name, int value) =>
      Settings$SecureChannel.instance.putInt(name, value);

  static bool putLong(String name, int value) =>
      Settings$SecureChannel.instance.putLong(name, value);

  static bool putString(String name, String value) =>
      Settings$SecureChannel.instance.putString(name, value);

  static void setLocationProviderEnabled(String provider, bool enabled) =>
      Settings$SecureChannel.instance.setLocationProviderEnabled(
        provider,
        enabled,
      );
}

abstract interface class Settings$System implements Settings$NameValueTable {
  factory Settings$System() => Settings$SystemChannel.instance.create();

  static net.Uri get contentUri => Settings$SystemChannel.instance.contentUri;
  static net.Uri get defaultAlarmAlertUri =>
      Settings$SystemChannel.instance.defaultAlarmAlertUri;
  static net.Uri get defaultNotificationUri =>
      Settings$SystemChannel.instance.defaultNotificationUri;
  static net.Uri get defaultRingtoneUri =>
      Settings$SystemChannel.instance.defaultRingtoneUri;
  static String get screenBrightness =>
      Settings$SystemChannel.instance.screenBrightness;
  static String get time12_24 => Settings$SystemChannel.instance.time12_24;

  static bool canWrite() => Settings$SystemChannel.instance.canWrite();
  // static Configuration getConfiguration() =>
  //     Settings$SystemChannel.instance.getConfiguration();
  static double getFloat(String name, [double? defaultValue]) =>
      Settings$SystemChannel.instance.getFloat(name, defaultValue);

  static int getInt(String name, [int? defaultValue]) =>
      Settings$SystemChannel.instance.getInt(name, defaultValue);

  static int getLong(String name, [int? defaultValue]) =>
      Settings$SystemChannel.instance.getLong(name, defaultValue);

  static bool getShowGTalkServiceStatus() =>
      Settings$SystemChannel.instance.getShowGTalkServiceStatus();

  static String? getString(String name) =>
      Settings$SystemChannel.instance.getString(name);

  static net.Uri? getUriFor(String name) =>
      Settings$SystemChannel.instance.getUriFor(name);

  // static bool putConfiguration(Configuration config) =>
  //     Settings$SystemChannel.instance.putConfiguration(config);

  static bool putFloat(String name, double value) =>
      Settings$SystemChannel.instance.putFloat(name, value);

  static bool putInt(String name, int value) =>
      Settings$SystemChannel.instance.putInt(name, value);

  static bool putLong(String name, int value) =>
      Settings$SystemChannel.instance.putLong(name, value);

  static bool putString(String name, String value) =>
      Settings$SystemChannel.instance.putString(name, value);

  static void setShowGTalkServiceStatus(bool flag) =>
      Settings$SystemChannel.instance.setShowGTalkServiceStatus(flag);
}

abstract base class SettingsChannel extends PlatformInterface {
  /// Constructs a [SettingsChannel].
  SettingsChannel() : super(token: _token);

  static final Object _token = Object();

  static SettingsChannel? _instance;

  /// The default instance of [SettingsChannel] to use.
  static SettingsChannel get instance =>
      ArgumentError.checkNotNull(_instance, 'instance');

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [SettingsChannel] when
  /// they register themselves.
  static set instance(SettingsChannel instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Settings create();
  bool canDrawOverlays();
}

abstract base class Settings$NameValueTableChannel extends PlatformInterface {
  /// Constructs a [Settings$NameValueTableChannel].
  Settings$NameValueTableChannel() : super(token: _token);

  static final Object _token = Object();

  static Settings$NameValueTableChannel? _instance;

  /// The default instance of [Settings$NameValueTableChannel] to use.
  static Settings$NameValueTableChannel get instance =>
      ArgumentError.checkNotNull(_instance, 'instance');

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [Settings$NameValueTableChannel] when
  /// they register themselves.
  static set instance(Settings$NameValueTableChannel instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  String get name;
  String get value;

  Settings$NameValueTable create();
  net.Uri? getUriFor(net.Uri uri, String name);
}

abstract base class Settings$GlobalChannel extends PlatformInterface {
  /// Constructs a [Settings$GlobalChannel].
  Settings$GlobalChannel() : super(token: _token);

  static final Object _token = Object();

  static Settings$GlobalChannel? _instance;

  /// The default instance of [Settings$GlobalChannel] to use.
  static Settings$GlobalChannel get instance =>
      ArgumentError.checkNotNull(_instance, 'instance');

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [Settings$GlobalChannel] when
  /// they register themselves.
  static set instance(Settings$GlobalChannel instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  net.Uri get contentUri;
  String get autoTime;
  String get autoTimeZone;

  Settings$Global create();
  double getFloat(String name, [double? defaultValue]);
  int getInt(String name, [int? defaultValue]);
  int getLong(String name, [int? defaultValue]);
  String? getString(String name);
  net.Uri? getUriFor(String name);
  bool putFloat(String name, double value);
  bool putInt(String name, int value);
  bool putLong(String name, int value);
  bool putString(String name, String value);
}

abstract base class Settings$SecureChannel extends PlatformInterface {
  /// Constructs a [Settings$SecureChannel].
  Settings$SecureChannel() : super(token: _token);

  static final Object _token = Object();

  static Settings$SecureChannel? _instance;

  /// The default instance of [Settings$SecureChannel] to use.
  static Settings$SecureChannel get instance =>
      ArgumentError.checkNotNull(_instance, 'instance');

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [Settings$SecureChannel] when
  /// they register themselves.
  static set instance(Settings$SecureChannel instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  net.Uri get contentUri;

  Settings$Secure create();
  double getFloat(String name, [double? defaultValue]);
  int getInt(String name, [int? defaultValue]);
  int getLong(String name, [int? defaultValue]);
  String? getString(String name);
  net.Uri? getUriFor(String name);
  bool isLocationProviderEnabled(String provider);
  bool putFloat(String name, double value);
  bool putInt(String name, int value);
  bool putLong(String name, int value);
  bool putString(String name, String value);
  void setLocationProviderEnabled(String provider, bool enabled);
}

abstract base class Settings$SystemChannel extends PlatformInterface {
  /// Constructs a [Settings$SystemChannel].
  Settings$SystemChannel() : super(token: _token);

  static final Object _token = Object();

  static Settings$SystemChannel? _instance;

  /// The default instance of [Settings$SystemChannel] to use.
  static Settings$SystemChannel get instance =>
      ArgumentError.checkNotNull(_instance, 'instance');

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [Settings$SystemChannel] when
  /// they register themselves.
  static set instance(Settings$SystemChannel instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  net.Uri get contentUri;
  net.Uri get defaultAlarmAlertUri;
  net.Uri get defaultNotificationUri;
  net.Uri get defaultRingtoneUri;
  String get screenBrightness;
  String get time12_24;

  Settings$System create();
  bool canWrite();
  // Configuration getConfiguration();
  double getFloat(String name, [double? defaultValue]);
  int getInt(String name, [int? defaultValue]);
  int getLong(String name, [int? defaultValue]);
  bool getShowGTalkServiceStatus();
  String? getString(String name);
  net.Uri? getUriFor(String name);
  // bool putConfiguration(Configuration config);
  bool putFloat(String name, double value);
  bool putInt(String name, int value);
  bool putLong(String name, int value);
  bool putString(String name, String value);
  void setShowGTalkServiceStatus(bool flag);
}
