import 'package:invictus_android/src/jni.dart' as jni;
import 'package:invictus_api/invictus_api.dart';

final class SystemClockChannelImpl extends SystemClockChannel {
  @override
  int get currentThreadTimeMillis => jni.SystemClock.currentThreadTimeMillis();

  @override
  int get elapsedRealtime => jni.SystemClock.elapsedRealtime();

  @override
  int get elapsedRealtimeNanos => jni.SystemClock.elapsedRealtimeNanos();

  @override
  int get uptimeMillis => jni.SystemClock.uptimeMillis();

  @override
  bool setCurrentTimeMillis(int millis) =>
      jni.SystemClock.setCurrentTimeMillis(millis);

  @override
  void sleep(int ms) => jni.SystemClock.sleep(ms);
}
