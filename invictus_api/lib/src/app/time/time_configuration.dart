import 'package:plugin_platform_interface/plugin_platform_interface.dart';

abstract interface class TimeConfiguration {
  bool get isAutoDetectionEnabled;
}

abstract interface class TimeConfiguration$Builder {
  factory TimeConfiguration$Builder() =>
      TimeConfigurationChannel.instance.createBuilder();

  TimeConfiguration$Builder setAutoDetectionEnabled(bool enabled);

  TimeConfiguration build();
}

abstract base class TimeConfigurationChannel extends PlatformInterface {
  /// Constructs a [TimeConfigurationChannel].
  TimeConfigurationChannel() : super(token: _token);

  static final Object _token = Object();

  static TimeConfigurationChannel? _instance;

  /// The default instance of [TimeConfigurationChannel] to use.
  static TimeConfigurationChannel get instance =>
      ArgumentError.checkNotNull(_instance, 'instance');

  /// Sets the default instance of [TimeConfigurationChannel] to use.
  ///
  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [TimeConfigurationChannel] when
  /// they register themselves.
  static set instance(TimeConfigurationChannel instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  TimeConfiguration$Builder createBuilder();
}
