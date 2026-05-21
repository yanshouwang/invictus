import 'package:invictus_android/src/impl.dart';
import 'package:invictus_android/src/jni.dart' as jni;
import 'package:invictus_api/invictus_api.dart';

final class TimeCapabilitiesImpl extends ObjectImpl
    implements TimeCapabilities {
  @override
  final jni.TimeCapabilities api;

  TimeCapabilitiesImpl.internal(this.api);

  @override
  Capabilities get configureAutoDetectionEnabledCapability =>
      api.configureAutoDetectionEnabledCapability.impl;

  @override
  Capabilities get setManualTimeCapability => api.setManualTimeCapability.impl;
}

final class TimeCapabilities$BuilderImpl extends ObjectImpl
    implements TimeCapabilities$Builder {
  @override
  final jni.TimeCapabilities$Builder api;

  TimeCapabilities$BuilderImpl.internal(this.api);

  @override
  TimeCapabilities build() => api.build().impl;

  @override
  TimeCapabilities$Builder setConfigureAutoDetectionEnabledCapability(
    Capabilities value,
  ) => api.setConfigureAutoDetectionEnabledCapability(value.api).impl;

  @override
  TimeCapabilities$Builder setSetManualTimeCapability(Capabilities value) =>
      api.setSetManualTimeCapability(value.api).impl;
}

final class TimeCapabilitiesChannelImpl extends TimeCapabilitiesChannel {
  @override
  TimeCapabilities$Builder createBuilder() {
    final userHandleApiOrNull = jni.Process.myUserHandle();
    final userHandleApi = ArgumentError.checkNotNull(
      userHandleApiOrNull,
      'userHandle',
    );
    final api = jni.TimeCapabilities$Builder.new$1(userHandleApi);
    return TimeCapabilities$BuilderImpl.internal(api);
  }
}

extension Invictus$JTimeCapabilitiesX on jni.TimeCapabilities {
  TimeCapabilities get impl => TimeCapabilitiesImpl.internal(this);
}

extension Invictus$JTimeCapabilities$BuilderX on jni.TimeCapabilities$Builder {
  TimeCapabilities$BuilderImpl get impl =>
      TimeCapabilities$BuilderImpl.internal(this);
}
