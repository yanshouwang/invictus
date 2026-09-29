import 'package:plugin_platform_interface/plugin_platform_interface.dart';

enum OnObbStateChangeListener$State {
  mounted,
  unmounted,
  internal,
  couldNotMount,
  couldNotUnmount,
  notMounted,
  alreadyMounted,
}

abstract interface class OnObbStateChangeListener {
  factory OnObbStateChangeListener({
    required void Function(String path, OnObbStateChangeListener$State state)
    onObbStateChange,
  }) => OnObbStateChangeListenerChannel.instance.createOnObbStateChangeListener(
    onObbStateChange: onObbStateChange,
  );
}

abstract base class OnObbStateChangeListenerChannel extends PlatformInterface {
  /// Constructs a [OnObbStateChangeListenerChannel].
  OnObbStateChangeListenerChannel() : super(token: _token);

  static final Object _token = Object();

  static OnObbStateChangeListenerChannel? _instance;

  /// The default instance of [OnObbStateChangeListenerChannel] to use.
  static OnObbStateChangeListenerChannel get instance =>
      ArgumentError.checkNotNull(_instance, 'instance');

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [OnObbStateChangeListenerChannel] when
  /// they register themselves.
  static set instance(OnObbStateChangeListenerChannel instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  OnObbStateChangeListener createOnObbStateChangeListener({
    required void Function(String path, OnObbStateChangeListener$State state)
    onObbStateChange,
  });
}
