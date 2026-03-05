import 'package:invictus_api/src/lang.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

/// Handle to a pre-located property. Looking up a property handle in advance allows
/// for optimal repeated lookup of a single property.
abstract interface class SystemProperties$Handle {
  /// return Value of the property
  String get();

  /// return value or defaultValue on parse error
  int getInt(int defaultValue);

  /// return value or defaultValue on parse error
  int getLong(int defaultValue);

  /// return value or defaultValue on parse error
  bool getBoolean(bool defaultValue);
}

/// Gives access to the system properties store.  The system properties
/// store contains a list of string key-value pairs.
///
///  Use this class only for the system properties that are local. e.g., within
/// an app, a partition, or a module. For system properties used across the
/// boundaries, formally define them in <code>*.sysprop</code> files and use the
/// auto-generated methods. For more information, see <a href=
/// "https://source.android.com/devices/architecture/sysprops-apis">Implementing
/// System Properties as APIs</a>.
abstract interface class SystemProperties {
  /// Get the String value for the given key.
  static String get(String key, [String? defaultValue]) =>
      SystemPropertiesChannel.instance.get(key, defaultValue);

  /// Get the value for the given {@code key}, and return as an integer.
  static int getInt(String key, int defaultValue) =>
      SystemPropertiesChannel.instance.getInt(key, defaultValue);

  /// Get the value for the given {@code key}, and return as a long.
  static int getLong(String key, int defaultValue) =>
      SystemPropertiesChannel.instance.getLong(key, defaultValue);

  /// Get the value for the given {@code key}, returned as a boolean.
  /// Values 'n', 'no', '0', 'false' or 'off' are considered false.
  /// Values 'y', 'yes', '1', 'true' or 'on' are considered true.
  /// (case sensitive).
  /// If the key does not exist, or has any other value, then the default
  /// result is returned.
  static bool getBoolean(String key, bool defaultValue) =>
      SystemPropertiesChannel.instance.getBoolean(key, defaultValue);

  /// Set the value for the given key to value.
  ///
  /// throws IllegalArgumentException for non read-only properties if the val exceeds
  /// 91 characters
  ///
  /// throws RuntimeException if the property cannot be set, for example, if it was blocked by
  /// SELinux. libc will log the underlying reason.
  static void set(String key, String? value) =>
      SystemPropertiesChannel.instance.set(key, value);

  /// Add a callback that will be run whenever any system property changes.
  static void addChangeCallback(Runnable callback) =>
      SystemPropertiesChannel.instance.addChangeCallback(callback);

  /// Remove the target callback.
  static void removeChangeCallback(Runnable callback) =>
      SystemPropertiesChannel.instance.removeChangeCallback(callback);

  /// Return a {@code SHA-1} digest of the given keys and their values as a
  /// hex-encoded string. The ordering of the incoming keys doesn't change the
  /// digest result.
  static String digestOf(List<String> keys) =>
      SystemPropertiesChannel.instance.digestOf(keys);

  /// Look up a property location by name.
  static SystemProperties$Handle? find(String name) =>
      SystemPropertiesChannel.instance.find(name);
}

abstract base class SystemPropertiesChannel extends PlatformInterface {
  /// Constructs a [SystemPropertiesChannel].
  SystemPropertiesChannel() : super(token: _token);

  static final Object _token = Object();

  static SystemPropertiesChannel? _instance;

  /// The default instance of [SystemPropertiesChannel] to use.
  static SystemPropertiesChannel get instance =>
      ArgumentError.checkNotNull(_instance, 'instance');

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [SystemPropertiesChannel] when
  /// they register themselves.
  static set instance(SystemPropertiesChannel instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  String get(String key, [String? defaultValue]);
  int getInt(String key, int defaultValue);
  int getLong(String key, int defaultValue);
  bool getBoolean(String key, bool defaultValue);
  void set(String key, String? value);
  void addChangeCallback(Runnable callback);
  void removeChangeCallback(Runnable callback);
  String digestOf(List<String> keys);
  SystemProperties$Handle? find(String name);
}
