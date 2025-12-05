import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'invictus_darwin_platform_interface.dart';

/// An implementation of [InvictusDarwinPlatform] that uses method channels.
class MethodChannelInvictusDarwin extends InvictusDarwinPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('invictus_darwin');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
