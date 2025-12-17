import 'package:invictus_android/src/impl.dart';
import 'package:invictus_android/src/jni.dart' as jni;
import 'package:invictus_api/invictus_api.dart';

final class InterfaceAddressImpl extends InvictusObjectImpl
    implements InterfaceAddress {
  @override
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
