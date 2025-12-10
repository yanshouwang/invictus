import 'package:invictus_android/src/api.dart';
import 'package:invictus_android/src/jni.dart' as jni;

final class ScanResult$InformationElementImpl
    implements ScanResult$InformationElement {
  final jni.ScanResult$InformationElement api;

  ScanResult$InformationElementImpl.internal(this.api);
}

extension Invictus$JScanResult$InformationElementX
    on jni.ScanResult$InformationElement {
  ScanResult$InformationElement get impl =>
      ScanResult$InformationElementImpl.internal(this);
}
