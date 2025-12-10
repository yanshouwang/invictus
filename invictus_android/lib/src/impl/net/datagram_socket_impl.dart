import 'package:invictus_android/src/api.dart';
import 'package:invictus_android/src/jni.dart' as jni;

final class DatagramSocketImpl implements DatagramSocket {
  final jni.DatagramSocket api;

  DatagramSocketImpl.internal(this.api);
}

extension Invictus$DatagramSocketX on DatagramSocket {
  jni.DatagramSocket get api {
    final impl = this;
    if (impl is! DatagramSocketImpl) throw TypeError();
    return impl.api;
  }
}
