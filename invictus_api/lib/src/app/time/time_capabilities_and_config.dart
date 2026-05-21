import 'time_capabilities.dart';
import 'time_configuration.dart';

abstract interface class TimeCapabilitiesAndConfig {
  TimeCapabilities get capabilities;
  TimeConfiguration get configuration;
}
