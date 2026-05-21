import 'package:invictus_android/src/impl.dart';
import 'package:invictus_android/src/jni.dart' as jni;
import 'package:invictus_api/invictus_api.dart';

final class UnixEpochTimeImpl extends ObjectImpl implements UnixEpochTime {
  @override
  final jni.UnixEpochTime api;

  UnixEpochTimeImpl.internal(this.api);

  @override
  int get elapsedRealtimeMillis => api.elapsedRealtimeMillis;

  @override
  int get unixEpochTimeMillis => api.unixEpochTimeMillis;

  @override
  UnixEpochTime at(int elapsedRealtimeMillis) =>
      api.at(elapsedRealtimeMillis).impl;
}

final class UnixEpochTimeChannelImpl extends UnixEpochTimeChannel {
  @override
  UnixEpochTime create({
    required int elapsedRealtimeMillis,
    required int unixEpochTimeMillis,
  }) {
    final api = jni.UnixEpochTime.new$1(
      elapsedRealtimeMillis,
      unixEpochTimeMillis,
    );
    return UnixEpochTimeImpl.internal(api);
  }

  @override
  int elapsedRealtimeDifference(UnixEpochTime one, UnixEpochTime two) =>
      jni.UnixEpochTime.Companion.elapsedRealtimeDifference(one.api, two.api);
}

extension Invictus$UnixEpochTimeX on UnixEpochTime {
  jni.UnixEpochTime get api {
    final impl = this;
    if (impl is! UnixEpochTimeImpl) throw TypeError();
    return impl.api;
  }
}

extension Invictus$JUnixEpochTimeX on jni.UnixEpochTime {
  UnixEpochTime get impl => UnixEpochTimeImpl.internal(this);
}
