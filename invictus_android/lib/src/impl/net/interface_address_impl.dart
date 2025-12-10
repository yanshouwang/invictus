import 'package:invictus_android/src/api.dart';
import 'package:invictus_android/src/jni.dart' as jni;

final class InterfaceAddressImpl implements InterfaceAddress {
  jni.InterfaceAddress api;

  InterfaceAddressImpl.internal(this.api);
}

extension Invictus$InterfaceAddressX on InterfaceAddress {
  jni.InterfaceAddress get api {
    final impl = this;
    if (impl is! InterfaceAddressImpl) throw TypeError();
    return impl.api;
  }
}
