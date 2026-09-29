import 'package:invictus_android/src/impl.dart';
import 'package:invictus_android/src/jni.dart' as jni;
import 'package:invictus_api/invictus_api.dart';

/// Parameters that specify what kind of bugreport should be taken.
final class BugreportParamsImpl extends ObjectImpl implements BugreportParams {
  @override
  final jni.BugreportParams api;

  BugreportParamsImpl.internal(this.api);
}

final class BugreportParamsChannelImpl extends BugreportParamsChannel {
  @override
  BugreportParams create({
    required BugreportParams$Mode mode,
    Set<BugreportParams$Flag>? flags,
  }) {
    final api = flags == null || flags.isEmpty
        ? jni.BugreportParams(mode.api)
        : jni.BugreportParams.new$1(
            mode.api,
            flags.map((e) => e.api).reduce((total, next) => total | next),
          );
    return BugreportParamsImpl.internal(api);
  }
}

extension Invictus$JBugreportParamsX on jni.BugreportParams {
  BugreportParams get impl => BugreportParamsImpl.internal(this);
}

extension Invictus$BugreportParamsX on BugreportParams {
  jni.BugreportParams get api {
    final impl = this;
    if (impl is! BugreportParamsImpl) throw TypeError();
    return impl.api;
  }
}

extension Invictus$BugreportParams$ModeX on BugreportParams$Mode {
  int get api {
    switch (this) {
      case BugreportParams$Mode.full:
        return jni.BugreportParams.Companion.bUGREPORT_MODE_FULL;
      case BugreportParams$Mode.interactive:
        return jni.BugreportParams.Companion.bUGREPORT_MODE_INTERACTIVE;
      case BugreportParams$Mode.remote:
        return jni.BugreportParams.Companion.bUGREPORT_MODE_REMOTE;
      case BugreportParams$Mode.wear:
        return jni.BugreportParams.Companion.bUGREPORT_MODE_WEAR;
      case BugreportParams$Mode.telephony:
        return jni.BugreportParams.Companion.bUGREPORT_MODE_TELEPHONY;
      case BugreportParams$Mode.wifi:
        return jni.BugreportParams.Companion.bUGREPORT_MODE_WIFI;
      case BugreportParams$Mode.onboarding:
        return jni.BugreportParams.Companion.bUGREPORT_MODE_ONBOARDING;
    }
  }
}

extension Invictus$BugreportParams$FlagX on BugreportParams$Flag {
  int get api {
    switch (this) {
      case BugreportParams$Flag.usePredumpedUiData:
        return jni
            .BugreportParams
            .Companion
            .bUGREPORT_FLAG_USE_PREDUMPED_UI_DATA;
      case BugreportParams$Flag.deferConsent:
        return jni.BugreportParams.Companion.bUGREPORT_FLAG_DEFER_CONSENT;
      case BugreportParams$Flag.keepBugreportOnRetrieval:
        return jni
            .BugreportParams
            .Companion
            .bUGREPORT_FLAG_KEEP_BUGREPORT_ON_RETRIEVAL;
    }
  }
}
