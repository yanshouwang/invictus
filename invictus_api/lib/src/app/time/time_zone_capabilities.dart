import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'capabilities.dart';

abstract interface class TimeZoneCapabilities {
  Capabilities get configureAutoDetectionEnabledCapability;
  bool get isUseLocationEnabled;
  Capabilities get configureGeoDetectionEnabledCapability;
  Capabilities get setManualTimeZoneCapability;
}

abstract interface class TimeZoneCapabilities$Builder {
  factory TimeZoneCapabilities$Builder() =>
      TimeZoneCapabilitiesChannel.instance.createBuilder();

  TimeZoneCapabilities$Builder setConfigureAutoDetectionEnabledCapability(
    Capabilities value,
  );
  TimeZoneCapabilities$Builder setUseLocationEnabled(bool useLocation);
  TimeZoneCapabilities$Builder setConfigureGeoDetectionEnabledCapability(
    Capabilities value,
  );
  TimeZoneCapabilities$Builder setSetManualTimeZoneCapability(
    Capabilities value,
  );
  TimeZoneCapabilities build();
}

abstract base class TimeZoneCapabilitiesChannel extends PlatformInterface {
  /// Constructs a [TimeZoneCapabilitiesChannel].
  TimeZoneCapabilitiesChannel() : super(token: _token);

  static final Object _token = Object();

  static TimeZoneCapabilitiesChannel? _instance;

  /// The default instance of [TimeZoneCapabilitiesChannel] to use.
  static TimeZoneCapabilitiesChannel get instance =>
      ArgumentError.checkNotNull(_instance, 'instance');

  /// Sets the default instance of [TimeZoneCapabilitiesChannel] to use.
  ///
  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [TimeZoneCapabilitiesChannel] when
  /// they register themselves.
  static set instance(TimeZoneCapabilitiesChannel instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  TimeZoneCapabilities$Builder createBuilder();
}
