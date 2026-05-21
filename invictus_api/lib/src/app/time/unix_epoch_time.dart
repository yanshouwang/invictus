import 'package:plugin_platform_interface/plugin_platform_interface.dart';

abstract interface class UnixEpochTime {
  static int elapsedRealtimeDifference(UnixEpochTime one, UnixEpochTime two) =>
      UnixEpochTimeChannel.instance.elapsedRealtimeDifference(one, two);

  factory UnixEpochTime({
    required int elapsedRealtimeMillis,
    required int unixEpochTimeMillis,
  }) => UnixEpochTimeChannel.instance.create(
    elapsedRealtimeMillis: elapsedRealtimeMillis,
    unixEpochTimeMillis: unixEpochTimeMillis,
  );

  int get elapsedRealtimeMillis;
  int get unixEpochTimeMillis;

  UnixEpochTime at(int elapsedRealtimeMillis);
}

abstract base class UnixEpochTimeChannel extends PlatformInterface {
  /// Constructs a [UnixEpochTimeChannel].
  UnixEpochTimeChannel() : super(token: _token);

  static final Object _token = Object();

  static UnixEpochTimeChannel? _instance;

  /// The default instance of [UnixEpochTimeChannel] to use.
  static UnixEpochTimeChannel get instance =>
      ArgumentError.checkNotNull(_instance, 'instance');

  /// Sets the default instance of [UnixEpochTimeChannel] to use.
  ///
  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [UnixEpochTimeChannel] when
  /// they register themselves.
  static set instance(UnixEpochTimeChannel instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  UnixEpochTime create({
    required int elapsedRealtimeMillis,
    required int unixEpochTimeMillis,
  });

  int elapsedRealtimeDifference(UnixEpochTime one, UnixEpochTime two);
}
