import 'package:invictus_android/src/impl.dart';
import 'package:invictus_android/src/jni.dart' as jni;
import 'package:invictus_api/invictus_api.dart';

final class TimeZoneCapabilitiesAndConfigImpl extends ObjectImpl
    implements TimeZoneCapabilitiesAndConfig {
  @override
  final jni.TimeZoneCapabilitiesAndConfig api;

  TimeZoneCapabilitiesAndConfigImpl.internal(this.api);

  @override
  TimeZoneCapabilities get capabilities => api.capabilities.impl;

  @override
  TimeZoneConfiguration get configuration => api.configuration.impl;
}

extension Invictus$JTimeZoneCapabilitiesAndConfigX
    on jni.TimeZoneCapabilitiesAndConfig {
  TimeZoneCapabilitiesAndConfig get impl =>
      TimeZoneCapabilitiesAndConfigImpl.internal(this);
}
