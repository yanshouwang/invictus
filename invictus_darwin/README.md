---
AIGC:
    Label: "1"
    ContentProducer: 001191440300708461136T1XGW3
    ProduceID: 5372e7330f8cf53c897f243b18f6f976_ee3440f3b59811f188f9525400248c00
    ReservedCode1: GKvXDwFAv8uNQOEK+AiT3rhn8nMWcKmbxEIxssObRGZ8fXpoJq3kQpToJslizoYeljMR6oTLs/RWLVKV7GXcRcbUO/LggNPpldHfTBORu6gL/em3nYbfLqOjlkTovukBZy/szzDD5xSX29L/Y2NZmy46bOFrOGCowANlslLpvfDL4ckhTAhHkyfVg10=
    ContentPropagator: 001191440300708461136T1XGW3
    PropagateID: 5372e7330f8cf53c897f243b18f6f976_ee3440f3b59811f188f9525400248c00
    ReservedCode2: GKvXDwFAv8uNQOEK+AiT3rhn8nMWcKmbxEIxssObRGZ8fXpoJq3kQpToJslizoYeljMR6oTLs/RWLVKV7GXcRcbUO/LggNPpldHfTBORu6gL/em3nYbfLqOjlkTovukBZy/szzDD5xSX29L/Y2NZmy46bOFrOGCowANlslLpvfDL4ckhTAhHkyfVg10=
---

# invictus_darwin

iOS and macOS implementation slot of the [`invictus`](../invictus) plugin. The package is registered as the default implementation for both platforms, but `InvictusDarwinPlugin.registerWith()` is still empty, so no API declared in [`invictus_api`](../invictus_api) is implemented yet.

## Packages

| Package | Description |
| --- | --- |
| [`invictus`](../invictus) | Plugin facade used by applications. Re-exports `invictus_api`. |
| [`invictus_api`](../invictus_api) | Platform interface: API declarations (`Xxx`) plus channel contracts (`XxxChannel`). No platform code. |
| [`invictus_android`](../invictus_android) | Android implementation. Talks to the platform over JNI (`package:jni`), without `MethodChannel`. |
| [`invictus_darwin`](.) | iOS/macOS implementation. `registerWith()` is currently empty, so no API is implemented yet. |
| [`example`](../invictus/example) | Demo app exercising every implemented API. |

## Current state

| Item | State |
| --- | --- |
| Dart `InvictusDarwinPlugin.registerWith()` | Empty — no `XxxChannel.instance` is assigned, so API calls on iOS/macOS fail. |
| `InvictusDarwinPlugin.swift` | Flutter plugin skeleton: one `invictus_darwin` `FlutterMethodChannel` and the template `getPlatformVersion` handler. |
| `darwin/invictus_darwin.podspec`, `darwin/invictus_darwin/Package.swift` | CocoaPods and Swift Package Manager definitions, shared by iOS and macOS through `sharedDarwinSource: true`. |
| `darwin/invictus_darwin/Sources/invictus_darwin/PrivacyInfo.xcprivacy` | Privacy manifest shipped with the plugin. |

## Layout

- `lib/invictus_darwin.dart` re-exports `lib/src/invictus_darwin_plugin.dart`.
- `darwin/` holds the native plugin sources together with their build definitions.

## Adding an API

1. Declare the type and its `XxxChannel` in [`invictus_api`](../invictus_api) if they do not exist yet.
2. Implement `XxxChannelImpl` (and any `XxxImpl`) under `lib/src/impl/`.
3. Assign it in `InvictusDarwinPlugin.registerWith()`.
4. Update the API overview table in [`invictus`](../invictus#api-overview), whose `Implemented` column currently describes the Android backend only.

## Requirements

| Requirement | Version |
| --- | --- |
| Dart SDK | `^3.12.0` |
| Flutter | `>= 3.44.0` |
| Platforms | iOS, macOS (shared Darwin sources) |

## Getting started

```yaml
dependencies:
  invictus_darwin: ^1.0.0
```

Usually added transitively: depending on [`invictus`](../invictus) makes Flutter select `invictus_android` on Android and `invictus_darwin` on iOS and macOS, as declared in the `invictus` pubspec.

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
