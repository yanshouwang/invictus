import 'package:invictus_android/src/impl.dart';
import 'package:invictus_android/src/jni.dart' as jni;
import 'package:invictus_api/invictus_api.dart';

final class FileDescriptorImpl extends InvictusObjectImpl
    implements FileDescriptor {
  @override
  final jni.FileDescriptor api;

  FileDescriptorImpl.internal(this.api);
}

extension Invictus$FileDescriptorX on FileDescriptor {
  jni.FileDescriptor get api {
    final impl = this;
    if (impl is! FileDescriptorImpl) throw TypeError();
    return impl.api;
  }
}
