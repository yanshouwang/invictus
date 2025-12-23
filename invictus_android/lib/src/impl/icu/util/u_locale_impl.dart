import 'package:invictus_android/src/impl.dart';
import 'package:invictus_android/src/jni.dart' as jni;
import 'package:invictus_api/invictus_api.dart';

final class ULocaleImpl extends ObjectImpl
    with ComparableImpl<ULocale>
    implements ULocale {
  @override
  final jni.ULocale api;

  ULocaleImpl.internal(this.api);
}

extension Invictus$ULocaleX on ULocale {
  jni.ULocale get api {
    final impl = this;
    if (impl is! ULocaleImpl) throw TypeError();
    return impl.api;
  }
}
