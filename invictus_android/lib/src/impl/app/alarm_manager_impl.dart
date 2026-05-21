import 'package:invictus_android/src/impl.dart';
import 'package:invictus_android/src/jni.dart' as jni;
import 'package:invictus_api/invictus_api.dart';

final class AlarmManagerImpl extends ObjectImpl implements AlarmManager {
  @override
  final jni.AlarmManager api;

  AlarmManagerImpl.internal(this.api);

  @override
  set time(int millis) => api.time = millis;

  @override
  set timeZone(String timeZone) => api.timeZone = timeZone.api;
}

final class AlarmManagerChannelImpl extends AlarmManagerChannel {
  @override
  AlarmManager create() {
    final apiOrNull = jni.ContextCompat.getSystemService<jni.AlarmManager>(
      jni.context,
      jni.AlarmManager.type.jClass,
    );
    final api = ArgumentError.checkNotNull(apiOrNull, 'api');
    return AlarmManagerImpl.internal(api);
  }
}
