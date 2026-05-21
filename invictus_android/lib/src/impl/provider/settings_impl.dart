import 'package:invictus_android/src/impl.dart';
import 'package:invictus_android/src/jni.dart' as jni;
import 'package:invictus_api/invictus_api.dart';

final class SettingsImpl extends ObjectImpl implements Settings {
  @override
  final jni.Settings api;

  SettingsImpl.internal(this.api);
}

final class Settings$NameValueTableImpl extends ObjectImpl
    implements Settings$NameValueTable {
  @override
  final jni.Settings$NameValueTable api;

  Settings$NameValueTableImpl.internal(this.api);
}

final class Settings$GlobalImpl extends ObjectImpl implements Settings$Global {
  @override
  final jni.Settings$Global api;

  Settings$GlobalImpl.internal(this.api);
}

final class Settings$SecureImpl extends ObjectImpl implements Settings$Secure {
  @override
  final jni.Settings$Secure api;

  Settings$SecureImpl.internal(this.api);
}

final class Settings$SystemImpl extends ObjectImpl implements Settings$System {
  @override
  final jni.Settings$System api;

  Settings$SystemImpl.internal(this.api);
}

final class SettingsChannelImpl extends SettingsChannel {
  @override
  bool canDrawOverlays() => jni.Settings.canDrawOverlays(jni.context);

  @override
  Settings create() {
    final api = jni.Settings();
    return SettingsImpl.internal(api);
  }
}

final class Settings$NameValueTableChannelImpl
    extends Settings$NameValueTableChannel {
  @override
  Settings$NameValueTable create() {
    final api = jni.Settings$NameValueTable();
    return Settings$NameValueTableImpl.internal(api);
  }

  @override
  Uri? getUriFor(Uri uri, String name) =>
      jni.Settings$NameValueTable.getUriFor(uri.api, name.api)?.impl;

  @override
  String get name =>
      ArgumentError.checkNotNull(jni.Settings$NameValueTable.NAME, 'NAME').impl;

  @override
  String get value => ArgumentError.checkNotNull(
    jni.Settings$NameValueTable.VALUE,
    'VALUE',
  ).impl;
}

final class Settings$GlobalChannelImpl extends Settings$GlobalChannel {
  jni.ContentResolver get cr => ArgumentError.checkNotNull(
    jni.context.contentResolver,
    'contentResolver',
  );

  @override
  String get autoTime => ArgumentError.checkNotNull(
    jni.Settings$Global.AUTO_TIME,
    'AUTO_TIME',
  ).impl;

  @override
  String get autoTimeZone => ArgumentError.checkNotNull(
    jni.Settings$Global.AUTO_TIME_ZONE,
    'AUTO_TIME_ZONE',
  ).impl;

  @override
  Uri get contentUri => ArgumentError.checkNotNull(
    jni.Settings$Global.CONTENT_URI,
    'CONTENT_URI',
  ).impl;

  @override
  Settings$Global create() {
    final api = jni.Settings$Global();
    return Settings$GlobalImpl.internal(api);
  }

  @override
  double getFloat(String name, [double? defaultValue]) => defaultValue == null
      ? jni.Settings$Global.getFloat(cr, name.api)
      : jni.Settings$Global.getFloat$1(cr, name.api, defaultValue);

  @override
  int getInt(String name, [int? defaultValue]) => defaultValue == null
      ? jni.Settings$Global.getInt(cr, name.api)
      : jni.Settings$Global.getInt$1(cr, name.api, defaultValue);

  @override
  int getLong(String name, [int? defaultValue]) => defaultValue == null
      ? jni.Settings$Global.getLong(cr, name.api)
      : jni.Settings$Global.getLong$1(cr, name.api, defaultValue);

  @override
  String? getString(String name) =>
      jni.Settings$Global.getString(cr, name.api)?.impl;

  @override
  Uri? getUriFor(String name) =>
      jni.Settings$Global.getUriFor$1(name.api)?.impl;

  @override
  bool putFloat(String name, double value) =>
      jni.Settings$Global.putFloat(cr, name.api, value);

  @override
  bool putInt(String name, int value) =>
      jni.Settings$Global.putInt(cr, name.api, value);

  @override
  bool putLong(String name, int value) =>
      jni.Settings$Global.putLong(cr, name.api, value);

  @override
  bool putString(String name, String value) =>
      jni.Settings$Global.putString(cr, name.api, value.api);
}

final class Settings$SecureChannelImpl extends Settings$SecureChannel {
  jni.ContentResolver get cr => ArgumentError.checkNotNull(
    jni.context.contentResolver,
    'contentResolver',
  );

  @override
  Uri get contentUri => ArgumentError.checkNotNull(
    jni.Settings$Global.CONTENT_URI,
    'CONTENT_URI',
  ).impl;

  @override
  Settings$Secure create() {
    final api = jni.Settings$Secure();
    return Settings$SecureImpl.internal(api);
  }

  @override
  double getFloat(String name, [double? defaultValue]) => defaultValue == null
      ? jni.Settings$Secure.getFloat(cr, name.api)
      : jni.Settings$Secure.getFloat$1(cr, name.api, defaultValue);

  @override
  int getInt(String name, [int? defaultValue]) => defaultValue == null
      ? jni.Settings$Secure.getInt(cr, name.api)
      : jni.Settings$Secure.getInt$1(cr, name.api, defaultValue);

  @override
  int getLong(String name, [int? defaultValue]) => defaultValue == null
      ? jni.Settings$Secure.getLong(cr, name.api)
      : jni.Settings$Secure.getLong$1(cr, name.api, defaultValue);

  @override
  String? getString(String name) =>
      jni.Settings$Secure.getString(cr, name.api)?.impl;

  @override
  Uri? getUriFor(String name) =>
      jni.Settings$Secure.getUriFor$1(name.api)?.impl;

  @override
  bool isLocationProviderEnabled(String provider) =>
      jni.Settings$Secure.isLocationProviderEnabled(cr, provider.api);

  @override
  bool putFloat(String name, double value) =>
      jni.Settings$Secure.putFloat(cr, name.api, value);

  @override
  bool putInt(String name, int value) =>
      jni.Settings$Secure.putInt(cr, name.api, value);

  @override
  bool putLong(String name, int value) =>
      jni.Settings$Secure.putLong(cr, name.api, value);

  @override
  bool putString(String name, String value) =>
      jni.Settings$Secure.putString(cr, name.api, value.api);

  @override
  void setLocationProviderEnabled(String provider, bool enabled) =>
      jni.Settings$Secure.setLocationProviderEnabled(cr, provider.api, enabled);
}

final class Settings$SystemChannelImpl extends Settings$SystemChannel {
  jni.ContentResolver get cr => ArgumentError.checkNotNull(
    jni.context.contentResolver,
    'contentResolver',
  );

  @override
  Uri get contentUri => ArgumentError.checkNotNull(
    jni.Settings$Global.CONTENT_URI,
    'CONTENT_URI',
  ).impl;

  @override
  Uri get defaultAlarmAlertUri => ArgumentError.checkNotNull(
    jni.Settings$System.DEFAULT_ALARM_ALERT_URI,
    'DEFAULT_ALARM_ALERT_URI',
  ).impl;

  @override
  Uri get defaultNotificationUri => ArgumentError.checkNotNull(
    jni.Settings$System.DEFAULT_NOTIFICATION_URI,
    'DEFAULT_NOTIFICATION_URI',
  ).impl;

  @override
  Uri get defaultRingtoneUri => ArgumentError.checkNotNull(
    jni.Settings$System.DEFAULT_RINGTONE_URI,
    'DEFAULT_RINGTONE_URI',
  ).impl;

  @override
  String get screenBrightness => ArgumentError.checkNotNull(
    jni.Settings$System.SCREEN_BRIGHTNESS,
    'SCREEN_BRIGHTNESS',
  ).impl;

  @override
  String get time12_24 => ArgumentError.checkNotNull(
    jni.Settings$System.TIME_12_24,
    'TIME_12_24',
  ).impl;

  @override
  bool canWrite() => jni.Settings$System.canWrite(jni.context);

  @override
  Settings$System create() {
    final api = jni.Settings$System();
    return Settings$SystemImpl.internal(api);
  }

  @override
  double getFloat(String name, [double? defaultValue]) => defaultValue == null
      ? jni.Settings$System.getFloat(cr, name.api)
      : jni.Settings$System.getFloat$1(cr, name.api, defaultValue);

  @override
  int getInt(String name, [int? defaultValue]) => defaultValue == null
      ? jni.Settings$System.getInt(cr, name.api)
      : jni.Settings$System.getInt$1(cr, name.api, defaultValue);

  @override
  int getLong(String name, [int? defaultValue]) => defaultValue == null
      ? jni.Settings$System.getLong(cr, name.api)
      : jni.Settings$System.getLong$1(cr, name.api, defaultValue);

  @override
  bool getShowGTalkServiceStatus() =>
      jni.Settings$System.getShowGTalkServiceStatus(cr);

  @override
  String? getString(String name) =>
      jni.Settings$System.getString(cr, name.api)?.impl;

  @override
  Uri? getUriFor(String name) =>
      jni.Settings$System.getUriFor$1(name.api)?.impl;

  @override
  bool putFloat(String name, double value) =>
      jni.Settings$System.putFloat(cr, name.api, value);

  @override
  bool putInt(String name, int value) =>
      jni.Settings$System.putInt(cr, name.api, value);

  @override
  bool putLong(String name, int value) =>
      jni.Settings$System.putLong(cr, name.api, value);

  @override
  bool putString(String name, String value) =>
      jni.Settings$System.putString(cr, name.api, value.api);

  @override
  void setShowGTalkServiceStatus(bool flag) =>
      jni.Settings$System.setShowGTalkServiceStatus(cr, flag);
}

extension Invictus$JSettingsX on jni.Settings {
  Settings get impl => SettingsImpl.internal(this);
}

extension Invictus$JSettings$NameValueTableX on jni.Settings$NameValueTable {
  Settings$NameValueTable get impl =>
      Settings$NameValueTableImpl.internal(this);
}

extension Invictus$JSettings$GlobalX on jni.Settings$Global {
  Settings$Global get impl => Settings$GlobalImpl.internal(this);
}

extension Invictus$JSettings$SecureX on jni.Settings$Secure {
  Settings$Secure get impl => Settings$SecureImpl.internal(this);
}

extension Invictus$JSettings$SystemX on jni.Settings$System {
  Settings$System get impl => Settings$SystemImpl.internal(this);
}
