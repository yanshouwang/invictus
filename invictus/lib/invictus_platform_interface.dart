import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'invictus_method_channel.dart';

abstract class InvictusPlatform extends PlatformInterface {
  /// Constructs a InvictusPlatform.
  InvictusPlatform() : super(token: _token);

  static final Object _token = Object();

  static InvictusPlatform _instance = MethodChannelInvictus();

  /// The default instance of [InvictusPlatform] to use.
  ///
  /// Defaults to [MethodChannelInvictus].
  static InvictusPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [InvictusPlatform] when
  /// they register themselves.
  static set instance(InvictusPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
