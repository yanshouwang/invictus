import 'time_zone_capabilities.dart';
import 'time_zone_configuration.dart';

abstract interface class TimeZoneCapabilitiesAndConfig {
  TimeZoneCapabilities get capabilities;
  TimeZoneConfiguration get configuration;
}
