import 'package:invictus_android/src/impl.dart';
import 'package:invictus_android/src/jni.dart' as jni;
import 'package:invictus_api/invictus_api.dart';

final class TimeCapabilitiesAndConfigImpl extends ObjectImpl
    implements TimeCapabilitiesAndConfig {
  @override
  final jni.TimeCapabilitiesAndConfig api;

  TimeCapabilitiesAndConfigImpl.internal(this.api);

  @override
  TimeCapabilities get capabilities => api.capabilities.impl;

  @override
  TimeConfiguration get configuration => api.configuration.impl;
}

extension Invictus$JTimeCapabilitiesAndConfigX
    on jni.TimeCapabilitiesAndConfig {
  TimeCapabilitiesAndConfig get impl =>
      TimeCapabilitiesAndConfigImpl.internal(this);
}
