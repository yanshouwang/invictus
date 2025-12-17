import 'package:invictus_android/src/impl.dart';
import 'package:invictus_android/src/jni.dart' as jni;
import 'package:invictus_api/invictus_api.dart';

final class IpSecManager$UdpEncapsulationSocketImpl extends InvictusObjectImpl
    implements IpSecManager$UdpEncapsulationSocket {
  @override
  final jni.IpSecManager$UdpEncapsulationSocket api;

  IpSecManager$UdpEncapsulationSocketImpl.internal(this.api);
}

extension Invictus$IpSecManager$UdpEncapsulationSocketX
    on IpSecManager$UdpEncapsulationSocket {
  jni.IpSecManager$UdpEncapsulationSocket get api {
    final impl = this;
    if (impl is! IpSecManager$UdpEncapsulationSocketImpl) throw TypeError();
    return impl.api;
  }
}
