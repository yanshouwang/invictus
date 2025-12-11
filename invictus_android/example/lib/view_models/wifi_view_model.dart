import 'package:clover/clover.dart';
import 'package:invictus_android/invictus_android.dart';
import 'package:logging/logging.dart';

Logger get _logger => Logger('WifiViewModel');

class WifiViewModel extends ViewModel {
  final WifiManager _wifiManager;
  WifiManager$WifiState _wifiState;
  WifiInfo? _connectionInfo;
  DhcpInfo? _dhcpInfo;

  late final WifiManager$WifiStateChangedListener _wifiStateChangedListener;
  late final WifiManager$ScanResultsCallback _scanResultsCallback;

  WifiManager$WifiState get wifiState => _wifiState;
  WifiInfo? get connectionInfo => _connectionInfo;
  DhcpInfo? get dhcpInfo => _dhcpInfo;

  WifiViewModel()
    : _wifiManager = WifiManager(),
      _wifiState = WifiManager$WifiState.unknown {
    _initialize();
  }

  void _initialize() {
    _wifiState = _wifiManager.wifiState;
    _connectionInfo = _wifiManager.connectionInfo;
    _dhcpInfo = _wifiManager.dhcpInfo;
    notifyListeners();
    _wifiStateChangedListener = WifiManager$WifiStateChangedListener(
      onWifiStateChanged: () {
        _wifiState = _wifiManager.wifiState;
        notifyListeners();
      },
    );
    _wifiManager.addWifiStateChangedListener(_wifiStateChangedListener);
    _scanResultsCallback = WifiManager$ScanResultsCallback(
      onScanResultsAvailable: () {
        final scanResults = _wifiManager.scanResults;
        _logger.info('scanResults: $scanResults');
        final first = scanResults.firstOrNull;
        if (first == null) return;
        _logger.info(
          'first: ${first.wifiSsid}, ${first.ssid} ${first.operatorFriendlyName}, ${first.venueName}',
        );
      },
    );
    _wifiManager.registerScanResultsCallback(_scanResultsCallback);
    startScan();
  }

  void startScan() {
    final ok = _wifiManager.startScan();
    if (ok) return;
    throw StateError('startScan failed');
  }

  void setWifiEnabled(bool enabled) {
    final ok = _wifiManager.setWifiEnabled(enabled);
    if (ok) return;
    throw StateError('setWifiEnabled[$enabled] failed');
  }

  @override
  void dispose() {
    _wifiManager.removeWifiStateChangedListener(_wifiStateChangedListener);
    _wifiManager.unregisterScanResultsCallback(_scanResultsCallback);
    super.dispose();
  }
}
