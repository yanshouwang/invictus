
import 'invictus_android_platform_interface.dart';

class InvictusAndroid {
  Future<String?> getPlatformVersion() {
    return InvictusAndroidPlatform.instance.getPlatformVersion();
  }
}
