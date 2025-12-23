import 'package:invictus_api/src/os.dart';
import 'package:invictus_api/src/util.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

abstract interface class ActivityManager {
  factory ActivityManager() => ActivityManagerChannel.instance.create();

  /// Returns a list of supported locales by this system. It includes all locales that are
  /// selectable by the user, potentially including locales that the framework does not have
  /// translated resources for. To get locales that the framework has translated resources for, use
  /// `Resources.getSystem().getAssets().getLocales()` instead.
  List<Locale> get supportedLocales;

  /// Sets the current locales of the device. Calling app must have the permission
  /// `android.permission.CHANGE_CONFIGURATION` and
  /// `android.permission.WRITE_SETTINGS`.
  set deviceLocales(LocaleList locales);
}

abstract base class ActivityManagerChannel extends PlatformInterface {
  /// Constructs a [ActivityManagerChannel].
  ActivityManagerChannel() : super(token: _token);

  static final Object _token = Object();

  static ActivityManagerChannel? _instance;

  /// The default instance of [ActivityManagerChannel] to use.
  static ActivityManagerChannel get instance =>
      ArgumentError.checkNotNull(_instance, 'instance');

  /// Sets the default instance of [ActivityManagerChannel] to use.
  ///
  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [ActivityManagerChannel] when
  /// they register themselves.
  static set instance(ActivityManagerChannel instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  ActivityManager create();
}
