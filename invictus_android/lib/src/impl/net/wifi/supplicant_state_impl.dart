import 'package:invictus_android/src/api.dart';
import 'package:invictus_android/src/jni.dart' as jni;

final class SupplicantStateImpl {
  static bool isValidState(SupplicantState state) =>
      jni.SupplicantState.isValidState(state.api);
}

extension Invictus$SupplicantStateX on SupplicantState {
  jni.SupplicantState get api {
    switch (this) {
      case SupplicantState.associated:
        return jni.SupplicantState.ASSOCIATED;
      case SupplicantState.associating:
        return jni.SupplicantState.ASSOCIATING;
      case SupplicantState.authenticating:
        return jni.SupplicantState.AUTHENTICATING;
      case SupplicantState.completed:
        return jni.SupplicantState.COMPLETED;
      case SupplicantState.disconnected:
        return jni.SupplicantState.DISCONNECTED;
      case SupplicantState.dormant:
        return jni.SupplicantState.DORMANT;
      case SupplicantState.fourWayHandshake:
        return jni.SupplicantState.FOUR_WAY_HANDSHAKE;
      case SupplicantState.groupHandshake:
        return jni.SupplicantState.GROUP_HANDSHAKE;
      case SupplicantState.inactive:
        return jni.SupplicantState.INACTIVE;
      case SupplicantState.interfaceDisabled:
        return jni.SupplicantState.INTERFACE_DISABLED;
      case SupplicantState.invalid:
        return jni.SupplicantState.INVALID;
      case SupplicantState.scanning:
        return jni.SupplicantState.SCANNING;
      case SupplicantState.uninitialized:
        return jni.SupplicantState.UNINITIALIZED;
    }
  }
}

extension Invictus$JSupplicantStateX on jni.SupplicantState {
  SupplicantState get impl {
    final api = this;
    if (api == jni.SupplicantState.ASSOCIATED) {
      return SupplicantState.associated;
    }
    if (api == jni.SupplicantState.ASSOCIATING) {
      return SupplicantState.associating;
    }
    if (api == jni.SupplicantState.AUTHENTICATING) {
      return SupplicantState.authenticating;
    }
    if (api == jni.SupplicantState.COMPLETED) {
      return SupplicantState.completed;
    }
    if (api == jni.SupplicantState.DISCONNECTED) {
      return SupplicantState.disconnected;
    }
    if (api == jni.SupplicantState.DORMANT) {
      return SupplicantState.dormant;
    }
    if (api == jni.SupplicantState.FOUR_WAY_HANDSHAKE) {
      return SupplicantState.fourWayHandshake;
    }
    if (api == jni.SupplicantState.GROUP_HANDSHAKE) {
      return SupplicantState.groupHandshake;
    }
    if (api == jni.SupplicantState.INACTIVE) {
      return SupplicantState.inactive;
    }
    if (api == jni.SupplicantState.INTERFACE_DISABLED) {
      return SupplicantState.interfaceDisabled;
    }
    if (api == jni.SupplicantState.INVALID) {
      return SupplicantState.invalid;
    }
    if (api == jni.SupplicantState.SCANNING) {
      return SupplicantState.scanning;
    }
    if (api == jni.SupplicantState.UNINITIALIZED) {
      return SupplicantState.uninitialized;
    }
    throw ArgumentError.value(api, 'api');
  }
}
