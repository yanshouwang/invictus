import 'package:invictus_android/src/impl.dart';
import 'package:invictus_android/src/jni.dart' as jni;
import 'package:invictus_api/invictus_api.dart';

final class TimeConfigurationImpl extends ObjectImpl
    implements TimeConfiguration {
  @override
  final jni.TimeConfiguration api;

  TimeConfigurationImpl.internal(this.api);

  @override
  bool get isAutoDetectionEnabled => api.isAutoDetectionEnabled;
}

final class TimeConfigruation$BuilderImpl extends ObjectImpl
    implements TimeConfiguration$Builder {
  @override
  final jni.TimeConfiguration$Builder api;

  TimeConfigruation$BuilderImpl.internal(this.api);

  @override
  TimeConfiguration build() => api.build().impl;

  @override
  TimeConfiguration$Builder setAutoDetectionEnabled(bool enabled) =>
      api.setAutoDetectionEnabled(enabled).impl;
}

final class TimeConfigurationChannelImpl extends TimeConfigurationChannel {
  @override
  TimeConfiguration$Builder createBuilder() {
    final api = jni.TimeConfiguration$Builder.new$1();
    return TimeConfigruation$BuilderImpl.internal(api);
  }
}

extension Invictus$TimeConfigurationX on TimeConfiguration {
  jni.TimeConfiguration get api {
    final impl = this;
    if (impl is! TimeConfigurationImpl) throw TypeError();
    return impl.api;
  }
}

extension Invictus$JTimeConfigurationX on jni.TimeConfiguration {
  TimeConfiguration get impl => TimeConfigurationImpl.internal(this);
}

extension Invictus$JTimeConfiguration$BuilderX
    on jni.TimeConfiguration$Builder {
  TimeConfigruation$BuilderImpl get impl =>
      TimeConfigruation$BuilderImpl.internal(this);
}
