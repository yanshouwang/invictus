import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'invictus_api_method_channel.dart';

abstract class InvictusApiPlatform extends PlatformInterface {
  /// Constructs a InvictusApiPlatform.
  InvictusApiPlatform() : super(token: _token);

  static final Object _token = Object();

  static InvictusApiPlatform _instance = MethodChannelInvictusApi();

  /// The default instance of [InvictusApiPlatform] to use.
  ///
  /// Defaults to [MethodChannelInvictusApi].
  static InvictusApiPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [InvictusApiPlatform] when
  /// they register themselves.
  static set instance(InvictusApiPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
