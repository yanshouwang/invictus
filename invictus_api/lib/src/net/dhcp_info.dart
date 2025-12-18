import 'package:plugin_platform_interface/plugin_platform_interface.dart';

abstract interface class DhcpInfo {
  factory DhcpInfo() => DhcpInfoChannel.instance.create();

  int get dns1;
  int get dns2;
  int get gateway;
  int get ipAddress;
  int get leaseDuration;
  int get netmask;
  int get serverAddress;
}

abstract base class DhcpInfoChannel extends PlatformInterface {
  /// Constructs a [DhcpInfoChannel].
  DhcpInfoChannel() : super(token: _token);

  static final Object _token = Object();

  static DhcpInfoChannel? _instance;

  /// The default instance of [DhcpInfoChannel] to use.
  static DhcpInfoChannel get instance =>
      ArgumentError.checkNotNull(_instance, 'instance');

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [DhcpInfoChannel] when
  /// they register themselves.
  static set instance(DhcpInfoChannel instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  DhcpInfo create();
}
