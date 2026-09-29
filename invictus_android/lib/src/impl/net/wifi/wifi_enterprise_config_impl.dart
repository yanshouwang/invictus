import 'package:invictus_android/src/impl.dart';
import 'package:invictus_android/src/jni.dart' as jni;
import 'package:invictus_api/invictus_api.dart';

final class WifiEnterpriseConfigImpl extends ObjectImpl
    implements WifiEnterpriseConfig {
  @override
  final jni.WifiEnterpriseConfig api;

  WifiEnterpriseConfigImpl.internal(this.api);
}

extension Invictus$WifiEnterpriseConfigX on WifiEnterpriseConfig {
  jni.WifiEnterpriseConfig get api {
    final impl = this;
    if (impl is! WifiEnterpriseConfigImpl) throw TypeError();
    return impl.api;
  }
}

extension Invictus$JWifiEnterpriseConfigX on jni.WifiEnterpriseConfig {
  WifiEnterpriseConfigImpl get impl => WifiEnterpriseConfigImpl.internal(this);
}
