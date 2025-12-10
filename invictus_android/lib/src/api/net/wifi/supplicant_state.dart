import 'package:invictus_android/src/impl.dart';

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
      SupplicantStateImpl.isValidState(state);
}
