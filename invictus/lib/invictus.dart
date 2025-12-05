
import 'invictus_platform_interface.dart';

class Invictus {
  Future<String?> getPlatformVersion() {
    return InvictusPlatform.instance.getPlatformVersion();
  }
}
