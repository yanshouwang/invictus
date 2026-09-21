import 'package:invictus_android/src/jni.dart' as jni;
import 'package:invictus_api/invictus_api.dart';

final class EnvironmentChannelImpl extends EnvironmentChannel {
  @override
  String getDataDirectory() {
    final directoryApi = ArgumentError.checkNotNull(
      jni.Environment.dataDirectory,
      'directoryApi',
    );
    return ArgumentError.checkNotNull(directoryApi.path, 'path').impl;
  }

  @override
  String getDownloadCacheDirectory() {
    final directoryApi = ArgumentError.checkNotNull(
      jni.Environment.downloadCacheDirectory,
      'directoryApi',
    );
    return ArgumentError.checkNotNull(directoryApi.path, 'path').impl;
  }

  @override
  String getExternalStorageDirectory() {
    final directoryApi = ArgumentError.checkNotNull(
      jni.Environment.externalStorageDirectory,
      'directoryApi',
    );
    return ArgumentError.checkNotNull(directoryApi.path, 'path').impl;
  }

  @override
  String getExternalStoragePublicDirectory(Environment$Directory type) {
    final directoryApi = ArgumentError.checkNotNull(
      jni.Environment.getExternalStoragePublicDirectory(type.api),
      'directoryApi',
    );
    return ArgumentError.checkNotNull(directoryApi.path, 'path').impl;
  }

  @override
  Environment$Media getExternalStorageState([String? filePath]) {
    if (filePath == null) {
      final stateApi = ArgumentError.checkNotNull(
        jni.Environment.externalStorageState,
        'stateApi',
      );
      return stateApi.environment$MediaImpl;
    } else {
      final fileApi = jni.File.new$1(filePath.api);
      final stateApi = ArgumentError.checkNotNull(
        jni.Environment.getExternalStorageState(fileApi),
        'stateApi',
      );
      return stateApi.environment$MediaImpl;
    }
  }

  @override
  String getRootDirectory() {
    final directoryApi = ArgumentError.checkNotNull(
      jni.Environment.rootDirectory,
      'directoryApi',
    );
    return ArgumentError.checkNotNull(directoryApi.path, 'path').impl;
  }

  @override
  bool isExternalStorageEmulated([String? filePath]) {
    if (filePath == null) {
      return jni.Environment.isExternalStorageEmulated;
    } else {
      final fileApi = jni.File.new$1(filePath.api);
      return jni.Environment.isExternalStorageEmulated$1(fileApi);
    }
  }

  @override
  bool isExternalStorageManager([String? filePath]) {
    if (filePath == null) {
      return jni.Environment.isExternalStorageManager;
    } else {
      final fileApi = jni.File.new$1(filePath.api);
      return jni.Environment.isExternalStorageManager$1(fileApi);
    }
  }

  @override
  bool isExternalStorageRemovable([String? filePath]) {
    if (filePath == null) {
      return jni.Environment.isExternalStorageRemovable;
    } else {
      final fileApi = jni.File.new$1(filePath.api);
      return jni.Environment.isExternalStorageRemovable$1(fileApi);
    }
  }
}

extension Invictus$Environment$DirectoryX on Environment$Directory {
  jni.JString get api {
    switch (this) {
      case .alarms:
        return ArgumentError.checkNotNull(
          jni.Environment.DIRECTORY_ALARMS,
          'DIRECTORY_ALARMS',
        );
      case Environment$Directory.dcim:
        return ArgumentError.checkNotNull(
          jni.Environment.DIRECTORY_DCIM,
          'DIRECTORY_DCIM',
        );
      case Environment$Directory.documents:
        return ArgumentError.checkNotNull(
          jni.Environment.DIRECTORY_DOCUMENTS,
          'DIRECTORY_DOCUMENTS',
        );
      case Environment$Directory.downloads:
        return ArgumentError.checkNotNull(
          jni.Environment.DIRECTORY_DOWNLOADS,
          'DIRECTORY_DOWNLOADS',
        );
      case Environment$Directory.movies:
        return ArgumentError.checkNotNull(
          jni.Environment.DIRECTORY_MOVIES,
          'DIRECTORY_MOVIES',
        );
      case Environment$Directory.music:
        return ArgumentError.checkNotNull(
          jni.Environment.DIRECTORY_MUSIC,
          'DIRECTORY_MUSIC',
        );
      case Environment$Directory.notifications:
        return ArgumentError.checkNotNull(
          jni.Environment.DIRECTORY_NOTIFICATIONS,
          'DIRECTORY_NOTIFICATIONS',
        );
      case Environment$Directory.pictures:
        return ArgumentError.checkNotNull(
          jni.Environment.DIRECTORY_PICTURES,
          'DIRECTORY_PICTURES',
        );
      case Environment$Directory.podcasts:
        return ArgumentError.checkNotNull(
          jni.Environment.DIRECTORY_PODCASTS,
          'DIRECTORY_PODCASTS',
        );
      case Environment$Directory.ringtones:
        return ArgumentError.checkNotNull(
          jni.Environment.DIRECTORY_RINGTONES,
          'DIRECTORY_RINGTONES',
        );
      case Environment$Directory.screenshots:
        return ArgumentError.checkNotNull(
          jni.Environment.DIRECTORY_SCREENSHOTS,
          'DIRECTORY_SCREENSHOTS',
        );
    }
  }
}

extension Invictus$JEnvironment$JStriingX on jni.JString {
  Environment$Media get environment$MediaImpl {
    if (this == jni.Environment.MEDIA_UNKNOWN) return .unknown;
    if (this == jni.Environment.MEDIA_REMOVED) return .removed;
    if (this == jni.Environment.MEDIA_UNMOUNTED) return .unmounted;
    if (this == jni.Environment.MEDIA_CHECKING) return .checking;
    if (this == jni.Environment.MEDIA_NOFS) return .nofs;
    if (this == jni.Environment.MEDIA_MOUNTED) return .mounted;
    if (this == jni.Environment.MEDIA_MOUNTED_READ_ONLY) {
      return .mountedReadOnly;
    }
    if (this == jni.Environment.MEDIA_SHARED) return .shared;
    if (this == jni.Environment.MEDIA_BAD_REMOVAL) return .badRemoval;
    if (this == jni.Environment.MEDIA_UNMOUNTABLE) return .unmountable;
    if (this == jni.Environment.MEDIA_EJECTING) return .ejecting;
    throw ArgumentError.value(this, 'environment\$Media');
  }
}
