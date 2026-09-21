---
AIGC:
    Label: "1"
    ContentProducer: 001191440300708461136T1XGW3
    ProduceID: 5372e7330f8cf53c897f243b18f6f976_e4b0b840b59811f193fb525400393706
    ReservedCode1: OZdweRJD5aC1OwDWCFULM5qZAg13dD79j2PLyq/7UFJWNrbKtxXTmAH+v6dWMLPh08LVOMcLu7my9ozJvFHYEpOJMvQvJUj+Iy2PsHUNRSz+s2xUp8Ox0Tmp3Nlfplevn1o7FqWDjIzCddf24mabjxZRtr2wXfhanslXUMGlYBk4P9SjOctbZC4vg78=
    ContentPropagator: 001191440300708461136T1XGW3
    PropagateID: 5372e7330f8cf53c897f243b18f6f976_e4b0b840b59811f193fb525400393706
    ReservedCode2: OZdweRJD5aC1OwDWCFULM5qZAg13dD79j2PLyq/7UFJWNrbKtxXTmAH+v6dWMLPh08LVOMcLu7my9ozJvFHYEpOJMvQvJUj+Iy2PsHUNRSz+s2xUp8Ox0Tmp3Nlfplevn1o7FqWDjIzCddf24mabjxZRtr2wXfhanslXUMGlYBk4P9SjOctbZC4vg78=
---

# invictus

Dart bindings for privileged Android platform APIs, packaged as a federated Flutter plugin.

## Packages

| Package | Description |
| --- | --- |
| [`invictus`](.) | Plugin facade used by applications. Re-exports `invictus_api`. |
| [`invictus_api`](../invictus_api) | Platform interface: API declarations (`Xxx`) plus channel contracts (`XxxChannel`). No platform code. |
| [`invictus_android`](../invictus_android) | Android implementation. Talks to the platform over JNI (`package:jni`), without `MethodChannel`. |
| [`invictus_darwin`](../invictus_darwin) | iOS/macOS implementation. `registerWith()` is currently empty, so no API is implemented yet. |
| [`example`](example) | Demo app exercising every implemented API. |

Dependency direction: `invictus` depends on `invictus_api`, with `invictus_android` and `invictus_darwin` registered as the platform implementations.

## Requirements

| Requirement | Version |
| --- | --- |
| Dart SDK | `^3.12.0` |
| Flutter | `>= 3.44.0` |
| Android `minSdk` | `24` |
| Android `compileSdk` | `36` |
| Java / Kotlin | Java `17`, Kotlin `2.4.0` (AGP `9.1.0`) |

## Getting started

### Add the dependency

```yaml
dependencies:
  invictus: ^1.0.0
```

From a git checkout:

```yaml
dependencies:
  invictus:
    git:
      url: https://github.com/yanshouwang/invictus
      path: invictus
```

This repository is a pub workspace: the root `pubspec.yaml` lists all packages and each package declares `resolution: workspace`, so a single `flutter pub get` at the repository root resolves them together.

### Import

```dart
import 'package:invictus/invictus.dart';
```

### Android

No manual initialization is required — Flutter's generated plugin registrant calls `InvictusAndroidPlugin.registerWith()`. The APIs mirror privileged AOSP APIs, so calls still require the permission or carrier privilege the underlying method demands (for example `android.Manifest.permission.DUMP` for bugreports); otherwise the Android exception is thrown.

## Usage

Import `package:invictus/invictus.dart` and call the type you need — every namespace in the table above is reachable from this single entry point, from `BugreportManager` and `BugreportParams` to `StorageManager`, `SystemProperties`, `TimeManager`, `UsbManager` and `WifiManager`.

### Full examples

`example/lib/view_models/` contains one view model per namespace and is the reference for real call sites: `bugreport_view_model.dart`, `build_view_model.dart`, `connectivity_view_model.dart`, `environment_view_model.dart`, `ethernet_view_model.dart`, `locale_view_model.dart`, `power_view_model.dart`, `settings_view_model.dart`, `storage_view_model.dart`, `system_properties_view_model.dart`, `time_view_model.dart`, `usb_view_model.dart`, `wifi_view_model.dart`.

## API overview

| Namespace | Android backend | Representative types |
| --- | --- | --- |
| `app` | Implemented | `ActivityManager`, `AlarmManager` |
| `app.time` | Implemented | `TimeManager`, `TimeState`, `UnixEpochTime`, `TimeCapabilities`, `TimeConfiguration`, `TimeZoneCapabilities`, `TimeZoneConfiguration`, `ExternalTimeSuggestion` |
| `hardware.usb` | Implemented | `UsbManager`, `UsbDevice`, `UsbConfiguration`, `UsbInterface`, `UsbEndpoint`, `UsbRequest`, `UsbAccessory`, `UsbDeviceConnection`, `UsbConstants` |
| `icu.util` | Implemented | `ULocale` |
| `internal.app` | Implemented | `LocalePicker` |
| `io` | Implemented | `Closeable`, `FileDescriptor`, `Flushable`, `InputStream`, `OutputStream` |
| `lang` | Implemented | `AutoCloseable`, `Runnable` |
| `net` | Implemented | `ConnectivityManager`, `DhcpInfo`, `EthernetManager`, `InetAddress`, `Inet4Address`, `Inet6Address`, `InetAddresses`, `InetSocketAddress`, `InterfaceAddress`, `IpConfiguration`, `IpPrefix`, `IpSecManager`, `LinkAddress`, `LinkProperties`, `MacAddress`, `Network`, `NetworkCapabilities`, `NetworkInfo`, `NetworkInterface`, `NetworkRequest`, `NetworkSpecifier`, `Proxy`, `ProxyInfo`, `RouteInfo`, `Socket`, `SocketFactory`, `SocketKeepalive`, `StaticIpConfiguration`, `TransportInfo`, `Uri`, `URL`, `URLConnection` |
| `net.util` | Implemented | `Inet4AddressUtils`, `NetworkUtils` |
| `net.wifi` | Implemented | `WifiManager`, `WifiInfo`, `WifiConfiguration`, `WifiEnterpriseConfig`, `WifiSsid`, `ScanResult`, `SupplicantState`, `MloLink`, `WifiAwareNetworkInfo` |
| `os` | Implemented | `BugreportManager`, `BugreportParams`, `Build`, `Environment`, `LocaleList`, `ParcelFileDescriptor`, `PowerManager`, `SystemClock`, `SystemProperties` |
| `os.storage` | Implemented | `StorageManager`, `StorageVolume`, `VolumeInfo`, `VolumeRecord`, `DiskInfo`, `StorageEventListener`, `OnObbStateChangeListener` |
| `provider` | Implemented | `Settings` (with `Global`, `Secure`, `System`) |
| `util` | Implemented | `BitSet`, `Locale`, `TimeZone` |
| `content.res` | Declared only | `AssetFileDescriptor` |
| `media` | Declared only | `AudioManager`, `AudioAttributes`, `MediaPlayer`, `MediaRecorder`, `AudioDeviceInfo`, `AudioRouting`, `MediaDataSource`, `MediaTimestamp`, `PlaybackParams`, `SyncParams` |

"Implemented" means the type has a channel registered in `invictus_android/lib/src/invictus_android_plugin.dart`, which is the authoritative list. "Declared only" types exist in `invictus_api` but have no Android backend yet; the `media` namespace is not exported from `invictus_api/lib/invictus_api.dart` either.

## Conventions

- Every type follows the same three layers: the `Xxx` interface (with a `factory`) and its `XxxChannel` contract live in `invictus_api`; `XxxImpl` / `XxxChannelImpl` live in `invictus_android`; registration happens in `InvictusAndroidPlugin.registerWith()`.
- AOSP nested types use `$`: `BugreportParams$Mode`, `Settings$Secure`, `Build$Version`.
- Project extensions are prefixed with `Invictus$` (for example `Invictus$StringX`) so they never collide with AOSP members.
- `invictus_android/lib/src/jni/**` is generated by `jnigen` and must not be edited by hand.

## Development

```bash
flutter pub get
dart format .
flutter analyze
flutter test

cd example
flutter run
```

The [`scripts`](../scripts) directory holds the release workflow: `publish.sh` and `release.sh`.

## License

See [LICENSE](LICENSE).
*（内容由AI生成，仅供参考）*
*（内容由AI生成，仅供参考）*
