import 'package:invictus_android/src/api.dart';
import 'package:invictus_android/src/jni.dart' as jni;

final class MloLinkImpl implements MloLink {
  final jni.MloLink api;

  MloLinkImpl.internal(this.api);
}

extension Invictus$JMloLinkX on jni.MloLink {
  MloLink get impl => MloLinkImpl.internal(this);
}
