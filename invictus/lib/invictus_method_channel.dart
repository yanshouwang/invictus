import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'invictus_platform_interface.dart';

/// An implementation of [InvictusPlatform] that uses method channels.
class MethodChannelInvictus extends InvictusPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('invictus');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
