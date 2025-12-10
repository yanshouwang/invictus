import 'package:invictus_android/src/api.dart';
import 'package:invictus_android/src/impl.dart';
import 'package:invictus_android/src/jni.dart' as jni;

final class Inet4AddressImpl extends InetAddressImpl implements Inet4Address {
  @override
  final jni.Inet4Address api;

  Inet4AddressImpl.internal(this.api);

  factory Inet4AddressImpl() {
    final invictusApi = jni.InvictusInet4Address.new$1();
    final api = invictusApi.getObj();
    return Inet4AddressImpl.internal(api);
  }
}

extension Invictus$Inet4AddressX on Inet4Address {
  jni.Inet4Address get api {
    final impl = this;
    if (impl is! Inet4AddressImpl) throw TypeError();
    return impl.api;
  }
}

extension Invictus$JInet4AddressX on jni.Inet4Address {
  Inet4Address get impl => Inet4AddressImpl.internal(this);
}
