import 'package:invictus_android/src/impl.dart';
import 'package:invictus_android/src/jni.dart' as jni;
import 'package:invictus_api/invictus_api.dart';

final class TimeZoneCapabilitiesImpl extends ObjectImpl
    implements TimeZoneCapabilities {
  @override
  final jni.TimeZoneCapabilities api;

  TimeZoneCapabilitiesImpl.internal(this.api);

  @override
  Capabilities get configureAutoDetectionEnabledCapability =>
      api.configureAutoDetectionEnabledCapability.impl;

  @override
  Capabilities get configureGeoDetectionEnabledCapability =>
      api.configureGeoDetectionEnabledCapability.impl;

  @override
  bool get isUseLocationEnabled => api.isUseLocationEnabled;

  @override
  Capabilities get setManualTimeZoneCapability =>
      api.setManualTimeZoneCapability.impl;
}

final class TimeZoneCapabilities$BuilderImpl extends ObjectImpl
    implements TimeZoneCapabilities$Builder {
  @override
  final jni.TimeZoneCapabilities$Builder api;

  TimeZoneCapabilities$BuilderImpl.internal(this.api);

  @override
  TimeZoneCapabilities build() => api.build().impl;

  @override
  TimeZoneCapabilities$Builder setConfigureAutoDetectionEnabledCapability(
    Capabilities value,
  ) => api.setConfigureAutoDetectionEnabledCapability(value.api).impl;

  @override
  TimeZoneCapabilities$Builder setConfigureGeoDetectionEnabledCapability(
    Capabilities value,
  ) => api.setConfigureGeoDetectionEnabledCapability(value.api).impl;

  @override
  TimeZoneCapabilities$Builder setSetManualTimeZoneCapability(
    Capabilities value,
  ) => api.setSetManualTimeZoneCapability(value.api).impl;

  @override
  TimeZoneCapabilities$Builder setUseLocationEnabled(bool useLocation) =>
      api.setUseLocationEnabled(useLocation).impl;
}

final class TimeZoneCapabilitiesChannelImpl
    extends TimeZoneCapabilitiesChannel {
  @override
  TimeZoneCapabilities$Builder createBuilder() {
    final userHandleApiOrNull = jni.Process.myUserHandle();
    final userHandleApi = ArgumentError.checkNotNull(
      userHandleApiOrNull,
      'userHandle',
    );
    final api = jni.TimeZoneCapabilities$Builder.new$1(userHandleApi);
    return TimeZoneCapabilities$BuilderImpl.internal(api);
  }
}

extension Invictus$JTimeZoneCapabilitiesX on jni.TimeZoneCapabilities {
  TimeZoneCapabilitiesImpl get impl => TimeZoneCapabilitiesImpl.internal(this);
}

extension Invictus$JTimeZoneCapabilities$BuilderX
    on jni.TimeZoneCapabilities$Builder {
  TimeZoneCapabilities$BuilderImpl get impl =>
      TimeZoneCapabilities$BuilderImpl.internal(this);
}
