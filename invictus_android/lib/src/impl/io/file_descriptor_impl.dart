import 'package:invictus_android/src/api.dart';
import 'package:invictus_android/src/jni.dart' as jni;

final class FileDescriptorImpl implements FileDescriptor {
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
