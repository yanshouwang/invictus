import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'invictus_darwin_method_channel.dart';

abstract class InvictusDarwinPlatform extends PlatformInterface {
  /// Constructs a InvictusDarwinPlatform.
  InvictusDarwinPlatform() : super(token: _token);

  static final Object _token = Object();

  static InvictusDarwinPlatform _instance = MethodChannelInvictusDarwin();

  /// The default instance of [InvictusDarwinPlatform] to use.
  ///
  /// Defaults to [MethodChannelInvictusDarwin].
  static InvictusDarwinPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [InvictusDarwinPlatform] when
  /// they register themselves.
  static set instance(InvictusDarwinPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
