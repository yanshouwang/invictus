import 'package:invictus_android/src/impl.dart';
import 'package:invictus_android/src/jni.dart' as jni;
import 'package:invictus_api/invictus_api.dart';

final class ParcelFileDescriptorImpl extends ObjectImpl
    implements ParcelFileDescriptor {
  @override
  final jni.ParcelFileDescriptor api;

  ParcelFileDescriptorImpl.internal(this.api);

  @override
  void close() => api.close();
}

final class ParcelFileDescriptorChannelImpl
    extends ParcelFileDescriptorChannel {
  @override
  ParcelFileDescriptor open(
    String filePath, {
    required Set<ParcelFileDescriptor$Mode> mode,
  }) {
    final fileApi = jni.File.new$1(filePath.api);
    final modeApi = mode
        .map((e) => e.api)
        .reduce((total, next) => total | next);
    final apiOrNull = jni.ParcelFileDescriptor.open(fileApi, modeApi);
    final api = ArgumentError.checkNotNull(apiOrNull, 'api');
    return ParcelFileDescriptorImpl.internal(api);
  }
}

extension Invictus$JParcelFileDescriptorX on jni.ParcelFileDescriptor {
  ParcelFileDescriptor get impl => ParcelFileDescriptorImpl.internal(this);
}

extension Invictus$ParcelFileDescriptorX on ParcelFileDescriptor {
  jni.ParcelFileDescriptor get api {
    final impl = this;
    if (impl is! ParcelFileDescriptorImpl) throw TypeError();
    return impl.api;
  }
}

extension Invictus$ParcelFileDescriptor$ModeX on ParcelFileDescriptor$Mode {
  int get api {
    switch (this) {
      // The world-readable/writable modes are marked @Deprecated in AOSP, but they
      // remain valid arguments of `ParcelFileDescriptor.open`.
      // ignore: deprecated_member_use
      case ParcelFileDescriptor$Mode.worldReadable:
        return jni.ParcelFileDescriptor.MODE_WORLD_READABLE;
      // ignore: deprecated_member_use
      case ParcelFileDescriptor$Mode.worldWriteable:
        return jni.ParcelFileDescriptor.MODE_WORLD_WRITEABLE;
      case ParcelFileDescriptor$Mode.readOnly:
        return jni.ParcelFileDescriptor.MODE_READ_ONLY;
      case ParcelFileDescriptor$Mode.writeOnly:
        return jni.ParcelFileDescriptor.MODE_WRITE_ONLY;
      case ParcelFileDescriptor$Mode.readWrite:
        return jni.ParcelFileDescriptor.MODE_READ_WRITE;
      case ParcelFileDescriptor$Mode.create:
        return jni.ParcelFileDescriptor.MODE_CREATE;
      case ParcelFileDescriptor$Mode.truncate:
        return jni.ParcelFileDescriptor.MODE_TRUNCATE;
      case ParcelFileDescriptor$Mode.append:
        return jni.ParcelFileDescriptor.MODE_APPEND;
    }
  }
}
