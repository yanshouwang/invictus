import 'package:invictus_android/src/impl.dart';
import 'package:invictus_android/src/jni.dart' as jni;
import 'package:invictus_api/invictus_api.dart';

final class SocketFactoryImpl extends ObjectImpl implements SocketFactory {
  @override
  final jni.SocketFactory api;

  SocketFactoryImpl.internal(this.api);
}

extension Invictus$JSocketFactoryX on jni.SocketFactory {
  SocketFactory get impl => SocketFactoryImpl.internal(this);
}
