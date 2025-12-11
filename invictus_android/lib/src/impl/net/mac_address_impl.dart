import 'package:invictus_android/src/api.dart';
import 'package:invictus_android/src/impl.dart';
import 'package:invictus_android/src/jni.dart' as jni;

final class MacAddressImpl extends InvictusObjectImpl implements MacAddress {
  @override
  final jni.MacAddress api;

  MacAddressImpl.internal(this.api);
}

extension Invictus$JMacAddressX on jni.MacAddress {
  MacAddress get impl => MacAddressImpl.internal(this);
}
