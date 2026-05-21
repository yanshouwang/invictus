import 'package:invictus_android/src/impl.dart';
import 'package:invictus_android/src/jni.dart' as jni;
import 'package:invictus_api/invictus_api.dart';

final class ActivityManagerImpl extends ObjectImpl implements ActivityManager {
  @override
  final jni.ActivityManager api;
  final jni.InvictusActivityManager invictusApi;

  ActivityManagerImpl.internal(this.api)
    : invictusApi = jni.InvictusActivityManager(api);

  @override
  List<Locale> get supportedLocales =>
      (invictusApi.supportedLocales as jni.JList<jni.Locale>)
          .asDart()
          .nonNulls
          .map((e) => e.impl)
          .toList();

  @override
  set deviceLocales(LocaleList locales) =>
      invictusApi.deviceLocales = locales.api;
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
