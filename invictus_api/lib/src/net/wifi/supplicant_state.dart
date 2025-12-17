import 'package:plugin_platform_interface/plugin_platform_interface.dart';

enum SupplicantState {
  associated,
  associating,
  authenticating,
  completed,
  disconnected,
  dormant,
  fourWayHandshake,
  groupHandshake,
  inactive,
  interfaceDisabled,
  invalid,
  scanning,
  uninitialized;

  static bool isValidState(SupplicantState state) =>
      SupplicantStateChannel.instance.isValidState(state);
}

abstract base class SupplicantStateChannel extends PlatformInterface {
  /// Constructs a [SupplicantStateChannel].
  SupplicantStateChannel() : super(token: _token);

  static final Object _token = Object();

  static SupplicantStateChannel? _instance;

  /// The default instance of [SupplicantStateChannel] to use.
  static SupplicantStateChannel get instance =>
      ArgumentError.checkNotNull(_instance, 'instance');

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [SupplicantStateChannel] when
  /// they register themselves.
  static set instance(SupplicantStateChannel instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  bool isValidState(SupplicantState state);
}
