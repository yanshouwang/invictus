import 'package:invictus_android/src/impl.dart';
import 'package:invictus_android/src/jni.dart' as jni;
import 'package:invictus_api/invictus_api.dart';

final class ParcelFileDescriptorImpl extends ObjectImpl
    implements ParcelFileDescriptor {
  @override
  final jni.ParcelFileDescriptor api;

  ParcelFileDescriptorImpl.internal(this.api);
}

extension Invictus$JParcelFileDescriptorX on jni.ParcelFileDescriptor {
  ParcelFileDescriptor get impl => ParcelFileDescriptorImpl.internal(this);
}
