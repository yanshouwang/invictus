import 'package:invictus_android/src/impl.dart';
import 'package:invictus_android/src/jni.dart' as jni;
import 'package:invictus_api/invictus_api.dart';

final class LocalePicker$LocaleSelectionListenerImpl extends ObjectImpl
    implements LocalePicker$LocaleSelectionListener {
  @override
  final jni.LocalePicker$LocaleSelectionListener api;

  LocalePicker$LocaleSelectionListenerImpl.internal(this.api);
}

final class LocalePicker$LocaleInfoImpl extends ObjectImpl
    with ComparableImpl<LocalePicker$LocaleInfo>
    implements LocalePicker$LocaleInfo {
  @override
  final jni.LocalePicker$LocaleInfo api;

  LocalePicker$LocaleInfoImpl.internal(this.api);

  @override
  String get label => api.getLabel().impl;

  @override
  Locale get locale => api.getLocale().impl;
}

final class LocalePickerChannelImpl extends LocalePickerChannel {
  @override
  LocalePicker$LocaleSelectionListener createLocaleSelectionListener({
    required void Function(Locale locale) onLocaleSelected,
  }) {
    final api = jni.InvictusLocalePicker$InvictusLocaleSelectionListenerImpl(
      jni.InvictusLocalePicker$InvictusLocaleSelectionListener.implement(
        jni.$InvictusLocalePicker$InvictusLocaleSelectionListener(
          onLocaleSelected: (e) => onLocaleSelected(e.impl),
        ),
      ),
    );
    return LocalePicker$LocaleSelectionListenerImpl.internal(api);
  }

  @override
  LocalePicker$LocaleInfo createLocaleInfo(String label, Locale locale) {
    final api = jni.LocalePicker$LocaleInfo.new$1(label.api, locale.api);
    return LocalePicker$LocaleInfoImpl.internal(api);
  }

  @override
  List<String> getSystemAssetLocales() => jni.LocalePicker.Companion
      .getSystemAssetLocales()
      .map((e) => e.impl)
      .toList();

  @override
  List<String> getSupportedLocales() => jni.LocalePicker.Companion
      .getSupportedLocales(jni.context)
      .map((e) => e.impl)
      .toList();

  @override
  List<LocalePicker$LocaleInfo> getAllAssetLocales({
    bool isInDeveloperMode = false,
  }) => jni.LocalePicker.Companion
      .getAllAssetLocales(jni.context, isInDeveloperMode)
      .map((e) => e.impl)
      .toList();

  @override
  void setLocaleSelectionListener(
    LocalePicker$LocaleSelectionListener listener,
  ) => jni.LocalePicker.Companion.setLocaleSelectionListener(listener.api);

  @override
  void updateLocale(Locale locale) =>
      jni.LocalePicker.Companion.updateLocale(locale.api);

  @override
  void updateLocales(LocaleList locales) =>
      jni.LocalePicker.Companion.updateLocales(locales.api);

  @override
  LocaleList getLocales() => jni.LocalePicker.Companion.getLocales().impl;
}

extension Invictus$LocalePicker$LocaleSelectionListenerX
    on LocalePicker$LocaleSelectionListener {
  jni.LocalePicker$LocaleSelectionListener get api {
    final impl = this;
    if (impl is! LocalePicker$LocaleSelectionListenerImpl) throw TypeError();
    return impl.api;
  }
}

extension Invictus$JLocalePicker$LocaleInfoX on jni.LocalePicker$LocaleInfo {
  LocalePicker$LocaleInfo get impl =>
      LocalePicker$LocaleInfoImpl.internal(this);
}
