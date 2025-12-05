import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'invictus_api_platform_interface.dart';

/// An implementation of [InvictusApiPlatform] that uses method channels.
class MethodChannelInvictusApi extends InvictusApiPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('invictus_api');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
