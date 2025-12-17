import 'package:invictus_android/src/impl.dart';
import 'package:invictus_android/src/jni.dart' as jni;
import 'package:invictus_api/invictus_api.dart';

final class UsbEndpointImpl extends InvictusObjectImpl implements UsbEndpoint {
  @override
  final jni.UsbEndpoint api;

  UsbEndpointImpl.internal(this.api);
}
