import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'invictus_android_method_channel.dart';

abstract class InvictusAndroidPlatform extends PlatformInterface {
  /// Constructs a InvictusAndroidPlatform.
  InvictusAndroidPlatform() : super(token: _token);

  static final Object _token = Object();

  static InvictusAndroidPlatform _instance = MethodChannelInvictusAndroid();

  /// The default instance of [InvictusAndroidPlatform] to use.
  ///
  /// Defaults to [MethodChannelInvictusAndroid].
  static InvictusAndroidPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [InvictusAndroidPlatform] when
  /// they register themselves.
  static set instance(InvictusAndroidPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
