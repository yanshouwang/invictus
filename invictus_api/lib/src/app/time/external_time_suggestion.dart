import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'unix_epoch_time.dart';

abstract interface class ExternalTimeSuggestion {
  factory ExternalTimeSuggestion({
    required int elapsedRealtimeMillis,
    required int suggestionMillis,
  }) => ExternalTimeSuggestionChannel.instance.create(
    elapsedRealtimeMillis: elapsedRealtimeMillis,
    suggestionMillis: suggestionMillis,
  );

  UnixEpochTime get unixEpochTime;
  List<String> get debugInfo;

  void addDebugInfo(List<String> debugInfos);
}

abstract base class ExternalTimeSuggestionChannel extends PlatformInterface {
  /// Constructs a [ExternalTimeSuggestionChannel].
  ExternalTimeSuggestionChannel() : super(token: _token);

  static final Object _token = Object();

  static ExternalTimeSuggestionChannel? _instance;

  /// The default instance of [ExternalTimeSuggestionChannel] to use.
  static ExternalTimeSuggestionChannel get instance =>
      ArgumentError.checkNotNull(_instance, 'instance');

  /// Sets the default instance of [ExternalTimeSuggestionChannel] to use.
  ///
  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [ExternalTimeSuggestionChannel] when
  /// they register themselves.
  static set instance(ExternalTimeSuggestionChannel instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  ExternalTimeSuggestion create({
    required int elapsedRealtimeMillis,
    required int suggestionMillis,
  });
}
