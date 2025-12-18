import 'package:invictus_api/src/net.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

abstract interface class EthernetManager$Listener {
  factory EthernetManager$Listener({
    required void Function(String iface, bool isAvailable)
    onAvailabilityChanged,
  }) => EthernetManagerChannel.instance.createListener(
    onAvailabilityChanged: onAvailabilityChanged,
  );
}

abstract interface class EthernetManager {
  factory EthernetManager() => EthernetManagerChannel.instance.create();

  List<String> get availableInterfaces;

  void addListener(EthernetManager$Listener listener);
  void removeListener(EthernetManager$Listener listener);
  bool isAvailable([String? iface]);
  IpConfiguration getConfiguration(String iface);
  void setConfiguration(String iface, IpConfiguration config);
}

abstract base class EthernetManagerChannel extends PlatformInterface {
  /// Constructs a [EthernetManagerChannel].
  EthernetManagerChannel() : super(token: _token);

  static final Object _token = Object();

  static EthernetManagerChannel? _instance;

  /// The default instance of [EthernetManagerChannel] to use.
  static EthernetManagerChannel get instance =>
      ArgumentError.checkNotNull(_instance, 'instance');

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [EthernetManagerChannel] when
  /// they register themselves.
  static set instance(EthernetManagerChannel instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  EthernetManager create();
  EthernetManager$Listener createListener({
    required void Function(String iface, bool isAvailable)
    onAvailabilityChanged,
  });
}
