import 'package:invictus_android/src/impl.dart';
import 'package:invictus_android/src/jni.dart' as jni;
import 'package:invictus_api/invictus_api.dart';

final class ExternalTimeSuggestionImpl extends ObjectImpl
    implements ExternalTimeSuggestion {
  @override
  final jni.ExternalTimeSuggestion api;

  ExternalTimeSuggestionImpl.internal(this.api);

  @override
  List<String> get debugInfo =>
      api.debugInfo.asDart().map((e) => e.impl).toList();

  @override
  UnixEpochTime get unixEpochTime => api.unixEpochTime.impl;

  @override
  void addDebugInfo(List<String> debugInfos) =>
      api.addDebugInfo(debugInfos.api);
}

final class ExternalTimeSuggestionChannelImpl
    extends ExternalTimeSuggestionChannel {
  @override
  ExternalTimeSuggestion create({
    required int elapsedRealtimeMillis,
    required int suggestionMillis,
  }) {
    final api = jni.ExternalTimeSuggestion.new$1(
      elapsedRealtimeMillis,
      suggestionMillis,
    );
    return ExternalTimeSuggestionImpl.internal(api);
  }
}

extension Invictus$ExternalTimeSuggestionX on ExternalTimeSuggestion {
  jni.ExternalTimeSuggestion get api {
    final impl = this;
    if (impl is! ExternalTimeSuggestionImpl) throw TypeError();
    return impl.api;
  }
}
