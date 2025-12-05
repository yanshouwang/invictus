import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'invictus_android_platform_interface.dart';

/// An implementation of [InvictusAndroidPlatform] that uses method channels.
class MethodChannelInvictusAndroid extends InvictusAndroidPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('invictus_android');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
