import 'package:invictus_android/src/impl.dart';
import 'package:invictus_api/invictus_api.dart';

final class WifiEnterpriseConfigImpl extends ObjectImpl
    implements WifiEnterpriseConfig {
  @override
  final jni.WifiEnterpriseConfig api;

  WifiEnterpriseConfigImpl.internal(this.api);
}
