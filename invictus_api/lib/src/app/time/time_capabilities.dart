import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'capabilities.dart';

abstract interface class TimeCapabilities {
  Capabilities get configureAutoDetectionEnabledCapability;
  Capabilities get setManualTimeCapability;
}

abstract interface class TimeCapabilities$Builder {
  factory TimeCapabilities$Builder() =>
      TimeCapabilitiesChannel.instance.createBuilder();

  TimeCapabilities$Builder setConfigureAutoDetectionEnabledCapability(
    Capabilities value,
  );

  TimeCapabilities$Builder setSetManualTimeCapability(Capabilities value);

  TimeCapabilities build();
}

abstract base class TimeCapabilitiesChannel extends PlatformInterface {
  /// Constructs a [TimeCapabilitiesChannel].
  TimeCapabilitiesChannel() : super(token: _token);

  static final Object _token = Object();

  static TimeCapabilitiesChannel? _instance;

  /// The default instance of [TimeCapabilitiesChannel] to use.
  static TimeCapabilitiesChannel get instance =>
      ArgumentError.checkNotNull(_instance, 'instance');

  /// Sets the default instance of [TimeCapabilitiesChannel] to use.
  ///
  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [TimeCapabilitiesChannel] when
  /// they register themselves.
  static set instance(TimeCapabilitiesChannel instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  TimeCapabilities$Builder createBuilder();
}
