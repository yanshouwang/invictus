import 'package:plugin_platform_interface/plugin_platform_interface.dart';

/// Environment.MEDIA_*
enum Environment$Media {
  unknown,
  removed,
  unmounted,
  checking,
  nofs,
  mounted,
  mountedReadOnly,
  shared,
  badRemoval,
  unmountable,
  ejecting,
}

/// Environment.DIRECTORY_*
enum Environment$Directory {
  alarms,
  // audiobooks,
  dcim,
  documents,
  downloads,
  movies,
  music,
  notifications,
  pictures,
  podcasts,
  // recordings,
  ringtones,
  screenshots,
}

/// Provides access to environment variables.
abstract interface class Environment {
  /// Return the user data directory.
  static String getDataDirectory() =>
      EnvironmentChannel.instance.getDataDirectory();

  /// Return the download/cache content directory.
  static String getDownloadCacheDirectory() =>
      EnvironmentChannel.instance.getDownloadCacheDirectory();

  /// Return the primary shared/external storage directory. This directory may not currently be accessible if it has been
  /// mounted by the user on their computer, has been removed from the device, or some other problem has happened.
  /// You can determine its current state with getExternalStorageState().
  static String getExternalStorageDirectory() =>
      EnvironmentChannel.instance.getExternalStorageDirectory();

  /// Get a top-level shared/external storage directory for placing files of a particular type. This is where the user will
  /// typically place and manage their own files, so you should be careful about what you put here to ensure you don't
  /// erase their files or get in the way of their own organization.
  static String getExternalStoragePublicDirectory(Environment$Directory type) =>
      EnvironmentChannel.instance.getExternalStoragePublicDirectory(type);

  /// Returns the current state of the primary shared/external storage media.
  static Environment$Media getExternalStorageState([String? path]) =>
      EnvironmentChannel.instance.getExternalStorageState(path);

  /// Return root of the "system" partition holding the core Android OS. Always present and mounted read-only.
  static String getRootDirectory() =>
      EnvironmentChannel.instance.getRootDirectory();

  /// Return root directory where all external storage devices will be mounted. For example, getExternalStorageDirectory() will appear under this location.
  // static String getStorageDirectory();

  /// Returns whether the primary shared/external storage media is emulated.
  static bool isExternalStorageEmulated([String? path]) =>
      EnvironmentChannel.instance.isExternalStorageEmulated(path);

  /// Returns whether the shared/external storage media is a legacy view that includes files not owned by the app.
  // static bool isExternalStorageLegacy([String? path]);

  /// Returns whether the calling app has All Files Access on the primary shared/external storage media.
  static bool isExternalStorageManager([String? path]) =>
      EnvironmentChannel.instance.isExternalStorageManager(path);

  /// Returns whether the primary shared/external storage media is physically removable.
  static bool isExternalStorageRemovable([String? path]) =>
      EnvironmentChannel.instance.isExternalStorageRemovable(path);
}

abstract base class EnvironmentChannel extends PlatformInterface {
  /// Constructs a [EnvironmentChannel].
  EnvironmentChannel() : super(token: _token);

  static final Object _token = Object();

  static EnvironmentChannel? _instance;

  /// The default instance of [EnvironmentChannel] to use.
  static EnvironmentChannel get instance =>
      ArgumentError.checkNotNull(_instance, 'instance');

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [EnvironmentChannel] when
  /// they register themselves.
  static set instance(EnvironmentChannel instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  String getDataDirectory();
  String getDownloadCacheDirectory();
  String getExternalStorageDirectory();
  String getExternalStoragePublicDirectory(Environment$Directory type);
  Environment$Media getExternalStorageState([String? path]);
  String getRootDirectory();
  // String getStorageDirectory();
  bool isExternalStorageEmulated([String? path]);
  // bool isExternalStorageLegacy([String? path]);
  bool isExternalStorageManager([String? path]);
  bool isExternalStorageRemovable([String? path]);
}
