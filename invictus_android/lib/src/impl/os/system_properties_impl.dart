import 'package:invictus_android/src/impl.dart';
import 'package:invictus_android/src/jni.dart' as jni;
import 'package:invictus_api/invictus_api.dart';

final class SystemProperties$HandleImpl extends ObjectImpl
    implements SystemProperties$Handle {
  @override
  final jni.SystemProperties$Handle api;

  SystemProperties$HandleImpl.internal(this.api);

  @override
  String get() => api.get().impl;

  @override
  int? getInt([int? defaultValue]) => api.getInt(defaultValue?.int32Api)?.impl;

  @override
  int? getLong([int? defaultValue]) =>
      api.getLong(defaultValue?.int64Api)?.impl;

  @override
  bool? getBoolean([bool? defaultValue]) =>
      api.getBoolean(defaultValue?.api)?.impl;
}

final class SystemPropertiesChannelImpl extends SystemPropertiesChannel {
  @override
  String get(String key, [String? defaultValue]) => defaultValue == null
      ? jni.SystemProperties.INSTANCE.get(key.api).impl
      : jni.SystemProperties.INSTANCE.get$1(key.api, defaultValue.api).impl;

  @override
  int? getInt(String key, [int? defaultValue]) => jni.SystemProperties.INSTANCE
      .getInt(key.api, defaultValue?.int32Api)
      ?.impl;

  @override
  int? getLong(String key, [int? defaultValue]) => jni.SystemProperties.INSTANCE
      .getLong(key.api, defaultValue?.int64Api)
      ?.impl;

  @override
  bool? getBoolean(String key, [bool? defaultValue]) => jni
      .SystemProperties
      .INSTANCE
      .getBoolean(key.api, defaultValue?.api)
      ?.impl;

  @override
  void set(String key, String? defaultValue) =>
      jni.SystemProperties.INSTANCE.set(key.api, defaultValue?.api);

  @override
  void addChangeCallback(Runnable callback) =>
      jni.SystemProperties.INSTANCE.addChangeCallback(callback.api);

  @override
  void removeChangeCallback(Runnable callback) =>
      jni.SystemProperties.INSTANCE.removeChangeCallback(callback.api);

  @override
  String digestOf(List<String> keys) =>
      jni.SystemProperties.INSTANCE.digestOf(keys.api).impl;

  @override
  SystemProperties$Handle? find(String name) =>
      jni.SystemProperties.INSTANCE.find(name.api)?.impl;
}

extension Invictus$JSystemProperties$HandleX on jni.SystemProperties$Handle {
  SystemProperties$Handle get impl =>
      SystemProperties$HandleImpl.internal(this);
}
