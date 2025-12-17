import 'package:invictus_android/src/impl.dart';
import 'package:invictus_android/src/jni.dart' as jni;
import 'package:invictus_api/invictus_api.dart';
import 'package:logging/logging.dart';

Logger get _logger => Logger('WifiManager');

final class WifiManager$WifiStateChangedListenerImpl extends InvictusObjectImpl
    implements WifiManager$WifiStateChangedListener {
  @override
  final jni.BroadcastReceiver api;

  WifiManager$WifiStateChangedListenerImpl.internal(this.api);
}

final class WifiManager$WifiStateChangedListenerImpl36
    extends InvictusObjectImpl
    implements WifiManager$WifiStateChangedListener {
  @override
  final jni.WifiManager$WifiStateChangedListener api;

  WifiManager$WifiStateChangedListenerImpl36.internal(this.api);
}

final class WifiManager$ScanResultsCallbackImpl extends InvictusObjectImpl
    implements WifiManager$ScanResultsCallback {
  @override
  final jni.WifiManager$ScanResultsCallback api;

  WifiManager$ScanResultsCallbackImpl.internal(this.api);
}

final class WifiManagerImpl extends InvictusObjectImpl implements WifiManager {
  @override
  final jni.WifiManager api;

  WifiManagerImpl.internal(this.api);

  @override
  List<WifiConfiguration> get configuredNetworks {
    final configuredNetworksApiOrNull = api.getConfiguredNetworks();
    final configuredNetworksApi = ArgumentError.checkNotNull(
      configuredNetworksApiOrNull,
      'configuredNetworksApi',
    );
    return configuredNetworksApi.nonNulls.map((e) => e.impl).toList();
  }

  @override
  WifiInfo get connectionInfo {
    final connectionInfoApiOrNull = api.getConnectionInfo();
    final connectionInfoApi = ArgumentError.checkNotNull(
      connectionInfoApiOrNull,
      'connectionInfoApi',
    );
    return connectionInfoApi.impl;
  }

  @override
  DhcpInfo get dhcpInfo {
    final dhcpInfoApiOrNull = api.getDhcpInfo();
    final dhcpInfoApi = ArgumentError.checkNotNull(
      dhcpInfoApiOrNull,
      'dhcpInfoApi',
    );
    return dhcpInfoApi.impl;
  }

  @override
  bool get isWifiEnabled => api.isWifiEnabled();

  @override
  List<ScanResult> get scanResults {
    final scanResultsApiOrNull = api.getScanResults();
    final scanResultsApi = ArgumentError.checkNotNull(
      scanResultsApiOrNull,
      'scanResultsApi',
    );
    return scanResultsApi.nonNulls.map((e) => e.impl).toList();
  }

  @override
  WifiManager$WifiState get wifiState =>
      api.getWifiState().wifiManager$WifiStateImpl;

  @override
  int addNetwork(WifiConfiguration config) => api.addNetwork(config.api);

  @override
  void addWifiStateChangedListener(
    WifiManager$WifiStateChangedListener listener,
  ) => jni.Build$VERSION.SDK_INT >= jni.Build$VERSION_CODES.BAKLAVA
      ? api.addWifiStateChangedListener(
          jni.context.mainExecutor,
          listener.api36,
        )
      : jni.ContextCompat.registerReceiver(
          jni.context,
          listener.api,
          jni.IntentFilter.new$2(jni.WifiManager.WIFI_STATE_CHANGED_ACTION),
          jni.ContextCompat.RECEIVER_NOT_EXPORTED,
        );

  @override
  int calculateSignalLevel(int rssi) => api.calculateSignalLevel(rssi);

  @override
  bool disableNetwork(int netId) => api.disableNetwork(netId);

  @override
  bool disconnect() => api.disconnect();

  @override
  bool enableNetwork(int nedId, bool attemptConnect) =>
      api.enableNetwork(nedId, attemptConnect);

  @override
  bool reassociate() => api.reassociate();

  @override
  bool reconnect() => api.reconnect();

  @override
  void registerScanResultsCallback(WifiManager$ScanResultsCallback callback) =>
      api.registerScanResultsCallback(jni.context.mainExecutor, callback.api);

  @override
  bool removeNetwork(int netId) => api.removeNetwork(netId);

  @override
  bool removeNonCallerConfiguredNetworks() =>
      api.removeNonCallerConfiguredNetworks();

  @override
  void removeWifiStateChangedListener(
    WifiManager$WifiStateChangedListener listener,
  ) => jni.Build$VERSION.SDK_INT >= jni.Build$VERSION_CODES.BAKLAVA
      ? api.removeWifiStateChangedListener(listener.api36)
      : jni.context.unregisterReceiver(listener.api);

  @override
  bool saveConfiguration() => api.saveConfiguration();

  @override
  bool setWifiEnabled(bool enabled) => api.setWifiEnabled(enabled);

  @override
  bool startScan() => api.startScan();

  @override
  void unregisterScanResultsCallback(
    WifiManager$ScanResultsCallback callback,
  ) => api.unregisterScanResultsCallback(callback.api);

  @override
  int updateNetwork(WifiConfiguration config) => api.updateNetwork(config.api);
}

final class WifiManager$WifiStateChangedListenerChannelImpl
    extends WifiManager$WifiStateChangedListenerChannel {
  @override
  WifiManager$WifiStateChangedListener create({
    required void Function() onWifiStateChanged,
  }) {
    if (jni.Build$VERSION.SDK_INT >= jni.Build$VERSION_CODES.BAKLAVA) {
      final api = jni.WifiManager$WifiStateChangedListener.implement(
        jni.$WifiManager$WifiStateChangedListener(
          onWifiStateChanged: onWifiStateChanged,
        ),
      );
      return WifiManager$WifiStateChangedListenerImpl36.internal(api);
    } else {
      final api = jni.InvictusBroadcastReceiverImpl(
        jni.InvictusBroadcastReceiver.implement(
          jni.$InvictusBroadcastReceiver(
            onReceive: (context, intent) {
              if (intent == null) {
                _logger.warning('intent is null');
                return;
              }
              final action = intent.getAction();
              if (action != jni.WifiManager.WIFI_STATE_CHANGED_ACTION) return;
              onWifiStateChanged();
            },
          ),
        ),
      );
      return WifiManager$WifiStateChangedListenerImpl.internal(api);
    }
  }
}

final class WifiManager$ScanResultsCallbackChannelImpl
    extends WifiManager$ScanResultsCallbackChannel {
  @override
  WifiManager$ScanResultsCallback create({
    required void Function() onScanResultsAvailable,
  }) {
    final invictusApi =
        jni.InvictusWifiManager$InvictusScanResultsCallback.implement(
          jni.$InvictusWifiManager$InvictusScanResultsCallback(
            onScanResultsAvailable: onScanResultsAvailable,
          ),
        );
    final api = jni.InvictusWifiManager$InvictusScanResultsCallbackImpl(
      invictusApi,
    );
    return WifiManager$ScanResultsCallbackImpl.internal(api);
  }
}

final class WifiManagerChannelImpl extends WifiManagerChannel {
  @override
  WifiManager create() {
    final apiOrNull = jni.ContextCompat.getSystemService(
      jni.context,
      jni.WifiManager.type.jClass,
      T: jni.WifiManager.type,
    );
    final api = ArgumentError.checkNotNull(apiOrNull, 'api');
    return WifiManagerImpl.internal(api);
  }
}

extension Invictus$JWifiManager$intX on int {
  WifiManager$WifiState get wifiManager$WifiStateImpl {
    final api = this;
    switch (api) {
      case jni.WifiManager.WIFI_STATE_DISABLING:
        return WifiManager$WifiState.disabling;
      case jni.WifiManager.WIFI_STATE_DISABLED:
        return WifiManager$WifiState.disabled;
      case jni.WifiManager.WIFI_STATE_ENABLING:
        return WifiManager$WifiState.enabling;
      case jni.WifiManager.WIFI_STATE_ENABLED:
        return WifiManager$WifiState.enabled;
      case jni.WifiManager.WIFI_STATE_UNKNOWN:
        return WifiManager$WifiState.unknown;
      default:
        throw ArgumentError.value(api, 'api');
    }
  }
}

extension Invictus$WifiManager$WifiStateChangedListenerX
    on WifiManager$WifiStateChangedListener {
  jni.BroadcastReceiver get api {
    final impl = this;
    if (impl is! WifiManager$WifiStateChangedListenerImpl) throw TypeError();
    return impl.api;
  }

  jni.WifiManager$WifiStateChangedListener get api36 {
    final impl = this;
    if (impl is! WifiManager$WifiStateChangedListenerImpl36) throw TypeError();
    return impl.api;
  }
}

extension Invictus$WifiManager$ScanResultsCallbackX
    on WifiManager$ScanResultsCallback {
  jni.WifiManager$ScanResultsCallback get api {
    final impl = this;
    if (impl is! WifiManager$ScanResultsCallbackImpl) throw TypeError();
    return impl.api;
  }
}
