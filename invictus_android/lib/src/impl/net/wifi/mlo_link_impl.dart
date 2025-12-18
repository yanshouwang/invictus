import 'package:invictus_android/src/impl.dart';
import 'package:invictus_android/src/jni.dart' as jni;
import 'package:invictus_api/invictus_api.dart';

final class MloLinkImpl extends ObjectImpl implements MloLink {
  @override
  final jni.MloLink api;

  MloLinkImpl.internal(this.api);
}

extension Invictus$JMloLinkX on jni.MloLink {
  MloLink get impl => MloLinkImpl.internal(this);
}
