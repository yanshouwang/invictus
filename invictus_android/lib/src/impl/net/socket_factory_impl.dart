import 'package:invictus_android/src/api.dart';
import 'package:invictus_android/src/jni.dart' as jni;

final class SocketFactoryImpl implements SocketFactory {
  final jni.SocketFactory api;

  SocketFactoryImpl.internal(this.api);
}

extension Invictus$JSocketFactoryX on jni.SocketFactory {
  SocketFactory get impl => SocketFactoryImpl.internal(this);
}
