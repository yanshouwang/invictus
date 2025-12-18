import 'dart:typed_data';

import 'package:plugin_platform_interface/plugin_platform_interface.dart';

abstract interface class WifiSsid {
  factory WifiSsid.fromBytes(Uint8List bytes) =>
      WifiSsidChannel.instance.createFromBytes(bytes);

  Uint8List get bytes;
}

abstract base class WifiSsidChannel extends PlatformInterface {
  WifiSsidChannel() : super(token: _token);

  static final Object _token = Object();

  static WifiSsidChannel? _instance;

  /// The default instance of [WifiSsidChannel] to use.
  static WifiSsidChannel get instance =>
      ArgumentError.checkNotNull(_instance, 'instance');

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [WifiSsidChannel] when
  /// they register themselves.
  static set instance(WifiSsidChannel instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  WifiSsid createFromBytes(Uint8List bytes);
}
