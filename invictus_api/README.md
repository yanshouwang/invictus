---
AIGC:
    Label: "1"
    ContentProducer: 001191440300708461136T1XGW3
    ProduceID: 5372e7330f8cf53c897f243b18f6f976_e8cc74e9b59811f193fb525400393706
    ReservedCode1: HDeLxPyn30qYYvMBVROdNM3eWQ1Wly8YDfdB5SPAsRK8Tdxu3SD4rXwRBXsPWhzv9FS3CNMh52KaW06TlVqE0I+QAWsvj/Nz6ARP/e8ymNbnNJbI31TqedOOj987MpgY29o1MBod3dhMLexunBBSjvGYl8+COSIVCm5v7xQiBftpaC/87JqJRMJ+ccs=
    ContentPropagator: 001191440300708461136T1XGW3
    PropagateID: 5372e7330f8cf53c897f243b18f6f976_e8cc74e9b59811f193fb525400393706
    ReservedCode2: HDeLxPyn30qYYvMBVROdNM3eWQ1Wly8YDfdB5SPAsRK8Tdxu3SD4rXwRBXsPWhzv9FS3CNMh52KaW06TlVqE0I+QAWsvj/Nz6ARP/e8ymNbnNJbI31TqedOOj987MpgY29o1MBod3dhMLexunBBSjvGYl8+COSIVCm5v7xQiBftpaC/87JqJRMJ+ccs=
---

# invictus_api

Platform interface of the [`invictus`](../invictus) plugin. It declares the privileged Android APIs in Dart and owns the channel contracts that connect an application to a platform implementation. No platform-specific code lives in this package.

## Packages

| Package | Description |
| --- | --- |
| [`invictus`](../invictus) | Plugin facade used by applications. Re-exports `invictus_api`. |
| [`invictus_api`](.) | Platform interface: API declarations (`Xxx`) plus channel contracts (`XxxChannel`). No platform code. |
| [`invictus_android`](../invictus_android) | Android implementation. Talks to the platform over JNI (`package:jni`), without `MethodChannel`. |
| [`invictus_darwin`](../invictus_darwin) | iOS/macOS implementation. `registerWith()` is currently empty, so no API is implemented yet. |
| [`example`](../invictus/example) | Demo app exercising every implemented API. |

## What this package provides

- **API declarations** — one file per AOSP type under `lib/src/<namespace>/`, keeping the AOSP names (`BugreportManager`, `Settings$Secure`, `Build$Version`); nested types are spelled with `$`.
- **Channel contracts** — every API type is paired with an `abstract base class XxxChannel extends PlatformInterface` that owns the static `instance` used by the declarations. A platform implementation assigns `XxxChannel.instance` while registering itself.
- **Namespace barrels** — `lib/src/app.dart`, `lib/src/net.dart`, `lib/src/os.dart`, … re-exported from `lib/invictus_api.dart`.

Exported namespaces: `app` (with `app.time`), `content.res`, `hardware.usb`, `icu.util`, `internal.app`, `io`, `lang`, `net` (with `net.util` and `net.wifi`), `os` (with `os.storage`), `provider` and `util`. The `media` namespace only exists under `lib/src/media/` for now: it is not re-exported and has no Android backend.

For the types inside each namespace, and which of them are actually backed by the Android implementation, see the API overview table in [`invictus`](../invictus#api-overview).

## Getting started

```yaml
dependencies:
  invictus_api: ^1.0.0
```

```dart
import 'package:invictus_api/invictus_api.dart';
```

Applications normally depend on [`invictus`](../invictus) instead; only platform implementations, and packages that need the raw declarations, depend on `invictus_api` directly.

This repository is a pub workspace: the root `pubspec.yaml` lists all packages and each package declares `resolution: workspace`, so a single `flutter pub get` at the repository root resolves them together.

## Conventions

- A declaration is an `abstract interface class` that exposes either static members (`SystemProperties.get`) or a `factory Xxx() => XxxChannel.instance.create()` plus instance members (`BugreportManager`) — it never contains platform code.
- `XxxChannel` extends `PlatformInterface` and verifies the implementation token on assignment, so only a real `XxxChannelImpl` can be registered.
- AOSP nested types use `$`: `BugreportParams$Mode`, `Settings$Secure`.
- Project extensions are prefixed with `Invictus$` (for example `Invictus$UsbDeviceConnectionX`) so they never collide with AOSP members.
- Calling an API whose channel was never registered fails with an `ArgumentError`.

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
