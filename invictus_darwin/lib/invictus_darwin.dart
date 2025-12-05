
import 'invictus_darwin_platform_interface.dart';

class InvictusDarwin {
  Future<String?> getPlatformVersion() {
    return InvictusDarwinPlatform.instance.getPlatformVersion();
  }
}
