import 'package:plugin_platform_interface/plugin_platform_interface.dart';

abstract interface class Runnable {
  factory Runnable({required void Function() run}) =>
      RunnableChannel.instance.create(run: run);
}

abstract base class RunnableChannel extends PlatformInterface {
  /// Constructs a [RunnableChannel].
  RunnableChannel() : super(token: _token);

  static final Object _token = Object();

  static RunnableChannel? _instance;

  /// The default instance of [RunnableChannel] to use.
  static RunnableChannel get instance =>
      ArgumentError.checkNotNull(_instance, 'instance');

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [RunnableChannel] when
  /// they register themselves.
  static set instance(RunnableChannel instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Runnable create({required void Function() run});
}
