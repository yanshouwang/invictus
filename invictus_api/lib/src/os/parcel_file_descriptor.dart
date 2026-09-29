import 'package:plugin_platform_interface/plugin_platform_interface.dart';

/// Desired access mode of the file to be opened.
///
/// The constants are declared in `android.os.ParcelFileDescriptor` of AOSP, and are
/// translated into the POSIX flags of `android.system.OsConstants` when the file is
/// actually opened.
enum ParcelFileDescriptor$Mode {
  /// For use with `ParcelFileDescriptor.open`: if [create] has been supplied and this
  /// file doesn't already exist, then create the file with permissions such that any
  /// application can read it.
  ///
  /// Creating world-readable files is very dangerous, and likely to cause security
  /// holes in applications. It is strongly discouraged; instead, applications should
  /// use more formal mechanism for interactions such as `ContentProvider`,
  /// `BroadcastReceiver`, and `android.app.Service`. There are no guarantees that this
  /// access mode will remain on a file, such as when it goes through a backup and
  /// restore.
  @Deprecated(
    'Creating world-readable files is very dangerous, and likely to cause security holes in applications.',
  )
  worldReadable,

  /// For use with `ParcelFileDescriptor.open`: if [create] has been supplied and this
  /// file doesn't already exist, then create the file with permissions such that any
  /// application can write it.
  ///
  /// Creating world-writable files is very dangerous, and likely to cause security
  /// holes in applications. It is strongly discouraged; instead, applications should
  /// use more formal mechanism for interactions such as `ContentProvider`,
  /// `BroadcastReceiver`, and `android.app.Service`. There are no guarantees that this
  /// access mode will remain on a file, such as when it goes through a backup and
  /// restore.
  @Deprecated(
    'Creating world-writable files is very dangerous, and likely to cause security holes in applications.',
  )
  worldWriteable,

  /// For use with `ParcelFileDescriptor.open`: open the file with read-only access,
  /// equivalent to `OsConstants.O_RDONLY`.
  readOnly,

  /// For use with `ParcelFileDescriptor.open`: open the file with write-only access,
  /// equivalent to `OsConstants.O_WRONLY`.
  writeOnly,

  /// For use with `ParcelFileDescriptor.open`: open the file with read and write
  /// access, equivalent to `OsConstants.O_RDWR`.
  readWrite,

  /// For use with `ParcelFileDescriptor.open`: create the file if it doesn't already
  /// exist, equivalent to `OsConstants.O_CREAT`.
  create,

  /// For use with `ParcelFileDescriptor.open`: erase contents of file when opening,
  /// equivalent to `OsConstants.O_TRUNC`.
  truncate,

  /// For use with `ParcelFileDescriptor.open`: append to end of file while writing,
  /// equivalent to `OsConstants.O_APPEND`.
  append,
}

abstract interface class ParcelFileDescriptor {
  /// Creates a new [ParcelFileDescriptor] accessing a given file.
  ///
  /// This method should only be used for files that you have direct access to; if you'd
  /// like to work with files hosted outside your app, use an API like
  /// `ContentResolver#openFile(Uri, String, CancellationSignal)`.
  ///
  /// [file] the path of the file to be opened.
  ///
  /// [mode] the desired access mode, must be one of `MODE_READ_ONLY`,
  /// `MODE_WRITE_ONLY`, or `MODE_READ_WRITE`; may also be any combination of
  /// `MODE_CREATE`, `MODE_TRUNCATE`, `MODE_WORLD_READABLE`, and `MODE_WORLD_WRITEABLE`.
  ///
  /// Returns a new [ParcelFileDescriptor] pointing to the given file.
  ///
  /// throws FileNotFoundException if the given file does not exist or can not be opened
  /// with the requested mode.
  factory ParcelFileDescriptor.open(
    String filePath, {
    required Set<ParcelFileDescriptor$Mode> mode,
  }) => ParcelFileDescriptorChannel.instance.open(filePath, mode: mode);

  /// Closes the [ParcelFileDescriptor].
  ///
  /// This implementation closes the underlying OS resources allocated to represent this
  /// stream.
  ///
  /// throws IOException if an error occurs attempting to close this
  /// [ParcelFileDescriptor].
  void close();
}

abstract base class ParcelFileDescriptorChannel extends PlatformInterface {
  /// Constructs a [ParcelFileDescriptorChannel].
  ParcelFileDescriptorChannel() : super(token: _token);

  static final Object _token = Object();

  static ParcelFileDescriptorChannel? _instance;

  /// The default instance of [ParcelFileDescriptorChannel] to use.
  static ParcelFileDescriptorChannel get instance =>
      ArgumentError.checkNotNull(_instance, 'instance');

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [ParcelFileDescriptorChannel] when
  /// they register themselves.
  static set instance(ParcelFileDescriptorChannel instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  ParcelFileDescriptor open(
    String filePath, {
    required Set<ParcelFileDescriptor$Mode> mode,
  });
}
