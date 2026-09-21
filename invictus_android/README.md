---
AIGC:
    Label: "1"
    ContentProducer: 001191440300708461136T1XGW3
    ProduceID: 5372e7330f8cf53c897f243b18f6f976_eb73a009b59811f188f9525400248c00
    ReservedCode1: wLtQW98/Uwviw/EVYMNxSIPH1dnXo6fN6YyaJk2hTCDvzazXizaKA4+P5RdKLT9HY5xwN7SZziYiYSAS3Da7W9Fasw93jSx7MOrn3gYtblyWpGh1CcLxhgvx7D5Rvt2cPVTvcbGlgo0rjpjLsp84Zh6K8gRS9DVOvryqP3SEiBZXzHktOPhl3KgVkHQ=
    ContentPropagator: 001191440300708461136T1XGW3
    PropagateID: 5372e7330f8cf53c897f243b18f6f976_eb73a009b59811f188f9525400248c00
    ReservedCode2: wLtQW98/Uwviw/EVYMNxSIPH1dnXo6fN6YyaJk2hTCDvzazXizaKA4+P5RdKLT9HY5xwN7SZziYiYSAS3Da7W9Fasw93jSx7MOrn3gYtblyWpGh1CcLxhgvx7D5Rvt2cPVTvcbGlgo0rjpjLsp84Zh6K8gRS9DVOvryqP3SEiBZXzHktOPhl3KgVkHQ=
---

# invictus_android

Android implementation of the [`invictus`](../invictus) plugin. It implements the channel contracts declared in [`invictus_api`](../invictus_api) by calling privileged Android platform APIs over JNI (`package:jni`); no `MethodChannel` is involved.

## Packages

| Package | Description |
| --- | --- |
| [`invictus`](../invictus) | Plugin facade used by applications. Re-exports `invictus_api`. |
| [`invictus_api`](../invictus_api) | Platform interface: API declarations (`Xxx`) plus channel contracts (`XxxChannel`). No platform code. |
| [`invictus_android`](.) | Android implementation. Talks to the platform over JNI (`package:jni`), without `MethodChannel`. |
| [`invictus_darwin`](../invictus_darwin) | iOS/macOS implementation. `registerWith()` is currently empty, so no API is implemented yet. |
| [`example`](../invictus/example) | Demo app exercising every implemented API. |

## How it works

| Path | Role |
| --- | --- |
| `lib/src/invictus_android_plugin.dart` | `InvictusAndroidPlugin.registerWith()` assigns an `XxxChannelImpl` to every `XxxChannel.instance`. This file is the authoritative list of implemented APIs. |
| `lib/src/impl/**` | One `XxxImpl` / `XxxChannelImpl` per API type, each wrapping the matching `jni` binding object. |
| `lib/src/jni/**` | Bindings produced by `jnigen`; generated code that must not be edited by hand. |
| `android/src/main/kotlin/dev/zeekr/invictus_android/**` | Kotlin side: `JniXxx` wrappers for hidden AOSP APIs, `XxxCompat` helpers, and the plugin entry point `InvictusAndroidPlugin.kt`. |
| `android/src/main/cpp/` | C++ shim (`os.cpp`, `CMakeLists.txt`) for the calls that need native code. |
| `tool/jnigen.dart` | `jnigen` configuration: the AOSP and Kotlin classes to bind, plus the output directory. |

## Requirements

| Requirement | Version |
| --- | --- |
| Dart SDK | `^3.12.0` |
| Flutter | `>= 3.44.0` |
| Android `minSdk` | `24` |
| Android `compileSdk` | `36` |
| Java / Kotlin | Java `17`, Kotlin `2.4.0` (AGP `9.1.0`) |
| CMake | `3.22.1` |

Most wrapped AOSP methods require a signature-level or privileged permission — for example `android.Manifest.permission.DUMP` for bugreports or `android.permission.REBOOT` for `PowerManager.reboot` — so the host app is usually installed as a system app. The bundled [`example`](../invictus/example) declares `android:sharedUserId="android.uid.system"` for that reason.

## Getting started

```yaml
dependencies:
  invictus_android: ^1.0.0
```

Registration is automatic: Flutter's generated plugin registrant calls the Dart `InvictusAndroidPlugin.registerWith()`, so no manual initialization is required. Applications normally depend on [`invictus`](../invictus), which pulls this package in on Android.

## Regenerating the JNI bindings

```bash
cd invictus_android
dart run tool/jnigen.dart
```

The generator reads the AOSP classes listed in `tool/jnigen.dart` together with `android/src/main/kotlin/`, uses `../invictus/example` as the Android example project, and writes the bindings into `lib/src/jni/`. Review the produced diff; never edit `lib/src/jni/**` by hand.

## Conventions

- Three layers per type: the `Xxx` interface and its `XxxChannel` contract live in [`invictus_api`](../invictus_api); `XxxImpl` / `XxxChannelImpl` live here; registration happens in `InvictusAndroidPlugin.registerWith()`.
- Kotlin helpers are only written when the AOSP API is hidden or the Dart binding alone is not enough; they are listed in `tool/jnigen.dart` as well.
- Project extensions are prefixed with `Invictus$` (for example `Invictus$UsbManager$UsbDeviceListenerX`) so they never collide with AOSP members.

## Development

```bash
flutter pub get
dart format .
flutter analyze
flutter test
```

## License

See [LICENSE](LICENSE).

*（内容由AI生成，仅供参考）*
