import 'package:invictus_android/src/impl.dart';
import 'package:invictus_android/src/jni.dart' as jni;
import 'package:invictus_api/invictus_api.dart';

final class TimeZoneConfigurationImpl extends ObjectImpl
    implements TimeZoneConfiguration {
  @override
  final jni.TimeZoneConfiguration api;

  TimeZoneConfigurationImpl.internal(this.api);

  @override
  bool get isAutoDetectionEnabled => api.isAutoDetectionEnabled;

  @override
  bool get isGeoDetectionEnabled => api.isGeoDetectionEnabled;
}

final class TimeZoneConfiguration$BuilderImpl extends ObjectImpl
    implements TimeZoneConfiguration$Builder {
  @override
  final jni.TimeZoneConfiguration$Builder api;

  TimeZoneConfiguration$BuilderImpl.internal(this.api);

  @override
  TimeZoneConfiguration build() => api.build().impl;

  @override
  TimeZoneConfiguration$Builder setAutoDetectionEnabled(bool enabled) =>
      api.setAutoDetectionEnabled(enabled).impl;

  @override
  TimeZoneConfiguration$Builder setGeoDetectionEnabled(bool enabled) =>
      api.setGeoDetectionEnabled(enabled).impl;
}

final class TimeZoneConfigurationChannelImpl
    extends TimeZoneConfigurationChannel {
  @override
  TimeZoneConfiguration$Builder createBuilder() {
    final api = jni.TimeZoneConfiguration$Builder.new$1();
    return TimeZoneConfiguration$BuilderImpl.internal(api);
  }
}

extension Invictus$TimeZoneConfigurationX on TimeZoneConfiguration {
  jni.TimeZoneConfiguration get api {
    final impl = this;
    if (impl is! TimeZoneConfigurationImpl) throw TypeError();
    return impl.api;
  }
}

extension Invictus$JTimeZoneConfigurationX on jni.TimeZoneConfiguration {
  TimeZoneConfigurationImpl get impl =>
      TimeZoneConfigurationImpl.internal(this);
}

extension Invictus$JTimeZoneConfiguration$BuilderX
    on jni.TimeZoneConfiguration$Builder {
  TimeZoneConfiguration$BuilderImpl get impl =>
      TimeZoneConfiguration$BuilderImpl.internal(this);
}
