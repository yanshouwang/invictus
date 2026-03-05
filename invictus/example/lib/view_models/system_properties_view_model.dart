import 'package:clover/clover.dart';
import 'package:invictus/invictus.dart';

const _keyPersistSysCustomanimBoot = 'persist.sys.customanim.boot';

enum PersistSysCustomanimBoot {
  undefined(null),
  byConST('/product/media/bootanimation_const.zip'),
  byAdditel('/product/media/bootanimation_additel.zip');

  final String? value;
  const PersistSysCustomanimBoot(this.value);

  factory PersistSysCustomanimBoot.of(String value) =>
      PersistSysCustomanimBoot.values.firstWhere(
        (e) => e.value == value,
        orElse: () => PersistSysCustomanimBoot.undefined,
      );
}

class SystemPropertiesViewModel extends ViewModel {
  PersistSysCustomanimBoot _boot;
  PersistSysCustomanimBoot get boot => _boot;

  SystemPropertiesViewModel() : _boot = _getPersistSysCustomanimBoot();

  void setPersistSysCustomanimBoot(PersistSysCustomanimBoot value) {
    _setPersistSysCustomanimBoot(value);
    _boot = _getPersistSysCustomanimBoot();
    notifyListeners();
  }
}

PersistSysCustomanimBoot _getPersistSysCustomanimBoot() {
  final value = SystemProperties.get(_keyPersistSysCustomanimBoot);
  return PersistSysCustomanimBoot.of(value);
}

void _setPersistSysCustomanimBoot(PersistSysCustomanimBoot boot) {
  SystemProperties.set(_keyPersistSysCustomanimBoot, boot.value);
}
