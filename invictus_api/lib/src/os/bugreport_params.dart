import 'package:plugin_platform_interface/plugin_platform_interface.dart';

/// Mode of the bugreport to request.
enum BugreportParams$Mode {
  /// Options for a bugreport without user interference (and hence causing less
  /// interference to the system), but includes all sections.
  full,

  /// Options that allow user to monitor progress and enter additional data; might not
  /// include all sections.
  interactive,

  /// Options for a bugreport requested remotely by administrator of the Device Owner app,
  /// not the device's user.
  remote,

  /// Options for a bugreport on a wearable device.
  wear,

  /// Options for a lightweight version of bugreport that only includes a few, urgent
  /// sections used to report telephony bugs.
  telephony,

  /// Options for a lightweight bugreport that only includes a few sections related to
  /// Wifi.
  wifi,

  /// Options for a bugreport that is requested while the user is being onboarded.
  onboarding,
}

/// Additional options for the bugreport.
enum BugreportParams$Flag {
  /// Flag for reusing pre-dumped UI data.
  ///
  /// The pre-dump and bugreport request calls must be performed by the same UID,
  /// otherwise the flag is ignored.
  usePredumpedUiData,

  /// Flag for deferring user consent.
  ///
  /// This flag should be used in cases where it may not be possible for the user to
  /// respond to a consent dialog immediately, such as when the user is driving. The
  /// generated bugreport may be retrieved at a later time using
  /// `BugreportManager.retrieveBugreport`.
  deferConsent,

  /// Flag for keeping a bugreport stored even after it has been retrieved via
  /// `BugreportManager.retrieveBugreport`.
  ///
  /// This flag can only be used when [deferConsent] is set. The bugreport may be
  /// retrieved multiple times using `BugreportManager.retrieveBugreport`.
  keepBugreportOnRetrieval,
}

/// Parameters that specify what kind of bugreport should be taken.
abstract interface class BugreportParams {
  /// Constructs a [BugreportParams] object to specify what kind of bugreport should be
  /// taken.
  ///
  /// [mode] of the bugreport to request.
  ///
  /// [flags] additional options for the bugreport.
  factory BugreportParams({
    required BugreportParams$Mode mode,
    Set<BugreportParams$Flag>? flags,
  }) => BugreportParamsChannel.instance.create(mode: mode, flags: flags);
}

abstract base class BugreportParamsChannel extends PlatformInterface {
  /// Constructs a [BugreportParamsChannel].
  BugreportParamsChannel() : super(token: _token);

  static final Object _token = Object();

  static BugreportParamsChannel? _instance;

  /// The default instance of [BugreportParamsChannel] to use.
  static BugreportParamsChannel get instance =>
      ArgumentError.checkNotNull(_instance, 'instance');

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [BugreportParamsChannel] when
  /// they register themselves.
  static set instance(BugreportParamsChannel instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  BugreportParams create({
    required BugreportParams$Mode mode,
    Set<BugreportParams$Flag>? flags,
  });
}
