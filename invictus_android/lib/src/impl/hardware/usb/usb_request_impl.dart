import 'package:invictus_android/src/impl.dart';
import 'package:invictus_android/src/jni.dart' as jni;
import 'package:invictus_api/invictus_api.dart';

final class UsbRequestImpl extends InvictusObjectImpl implements UsbRequest {
  @override
  final jni.UsbRequest api;

  UsbRequestImpl.internal(this.api);
}
