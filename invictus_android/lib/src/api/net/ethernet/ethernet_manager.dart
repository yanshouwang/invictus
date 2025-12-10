import 'package:invictus_android/src/api.dart';
import 'package:invictus_android/src/impl.dart';

abstract interface class EthernetManager$Listener {
  factory EthernetManager$Listener({
    required void Function(String iface, bool isAvailable)
    onAvailabilityChanged,
  }) => EthernetManager$ListenerImpl(
    onAvailabilityChanged: onAvailabilityChanged,
  );
}

abstract interface class EthernetManager {
  factory EthernetManager() => EthernetManagerImpl();

  List<String> get availableInterfaces;

  void addListener(EthernetManager$Listener listener);
  void removeListener(EthernetManager$Listener listener);
  bool isAvailable([String? iface]);
  IpConfiguration getConfiguration(String iface);
  void setConfiguration(String iface, IpConfiguration config);
}
