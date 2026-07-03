import 'package:invictus_android/src/jni.dart' as jni;
import 'package:invictus_api/invictus_api.dart';

extension Invictus$CapabilitiesX on Capabilities {
  int get api {
    switch (this) {
      case .notSupported:
        return jni.Capabilities.INSTANCE.cAPABILITY_NOT_SUPPORTED;
      case .notAllowed:
        return jni.Capabilities.INSTANCE.cAPABILITY_NOT_ALLOWED;
      case .notApplicable:
        return jni.Capabilities.INSTANCE.cAPABILITY_NOT_APPLICABLE;
      case .processed:
        return jni.Capabilities.INSTANCE.cAPABILITY_POSSESSED;
    }
  }
}

extension Invictus$JCapabilitiesX on int {
  Capabilities get impl {
    final value = this;
    if (value == jni.Capabilities.INSTANCE.cAPABILITY_NOT_SUPPORTED) {
      return .notSupported;
    }
    if (value == jni.Capabilities.INSTANCE.cAPABILITY_NOT_ALLOWED) {
      return .notAllowed;
    }
    if (value == jni.Capabilities.INSTANCE.cAPABILITY_NOT_APPLICABLE) {
      return .notApplicable;
    }
    if (value == jni.Capabilities.INSTANCE.cAPABILITY_POSSESSED) {
      return .processed;
    }
    throw ArgumentError.value(value);
  }
}
