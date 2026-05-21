import 'package:plugin_platform_interface/plugin_platform_interface.dart';

abstract interface class TimeZoneConfiguration {
  bool get isAutoDetectionEnabled;
  bool get isGeoDetectionEnabled;
}

abstract interface class TimeZoneConfiguration$Builder {
  factory TimeZoneConfiguration$Builder() =>
      TimeZoneConfigurationChannel.instance.createBuilder();

  TimeZoneConfiguration$Builder setAutoDetectionEnabled(bool enabled);
  TimeZoneConfiguration$Builder setGeoDetectionEnabled(bool enabled);
  TimeZoneConfiguration build();
}

abstract base class TimeZoneConfigurationChannel extends PlatformInterface {
  /// Constructs a [TimeZoneConfigurationChannel].
  TimeZoneConfigurationChannel() : super(token: _token);

  static final Object _token = Object();

  static TimeZoneConfigurationChannel? _instance;

  /// The default instance of [TimeZoneConfigurationChannel] to use.
  static TimeZoneConfigurationChannel get instance =>
      ArgumentError.checkNotNull(_instance, 'instance');

  /// Sets the default instance of [TimeZoneConfigurationChannel] to use.
  ///
  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [TimeZoneConfigurationChannel] when
  /// they register themselves.
  static set instance(TimeZoneConfigurationChannel instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  TimeZoneConfiguration$Builder createBuilder();
}
