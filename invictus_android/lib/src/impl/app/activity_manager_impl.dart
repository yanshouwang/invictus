import 'package:invictus_android/src/impl.dart';
import 'package:invictus_android/src/jni.dart' as jni;
import 'package:invictus_api/invictus_api.dart';

final class ActivityManagerImpl extends ObjectImpl implements ActivityManager {
  @override
  final jni.ActivityManager api;

  ActivityManagerImpl.internal(this.api);

  @override
  List<Locale> get supportedLocales {
    final supportedLocaleApis =
        jni.ActivityManagerCompat.INSTANCE.getSupportedLocales(api)
            as jni.JList<jni.Locale>;
    return supportedLocaleApis.asDart().nonNulls.map((e) => e.impl).toList();
  }

  @override
  set deviceLocales(LocaleList locales) =>
      jni.ActivityManagerCompat.INSTANCE.setDeviceLocales(api, locales.api);
}

final class ActivityManagerChannelImpl extends ActivityManagerChannel {
  @override
  ActivityManager create() {
    final apiOrNull = jni.ContextCompat.getSystemService<jni.ActivityManager>(
      jni.context,
      jni.ActivityManager.type.jClass,
    );
    final api = ArgumentError.checkNotNull(apiOrNull, 'api');
    return ActivityManagerImpl.internal(api);
  }
}
