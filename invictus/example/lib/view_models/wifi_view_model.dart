import 'package:clover/clover.dart';
import 'package:invictus/invictus.dart';

class WifiViewModel extends ViewModel {
  final WifiManager _wifiManager;
  late WifiManager$WifiState _wifiState;
  late WifiInfo _connectionInfo;
  late DhcpInfo _dhcpInfo;
  late List<ScanResult> _scanResults;

  late final WifiManager$WifiStateChangedListener _wifiStateChangedListener;
  late final WifiManager$ScanResultsCallback _scanResultsCallback;

  WifiManager$WifiState get wifiState => _wifiState;
  WifiInfo get connectionInfo => _connectionInfo;
  DhcpInfo get dhcpInfo => _dhcpInfo;
  List<ScanResult> get scanResults => _scanResults;

  WifiViewModel() : _wifiManager = WifiManager() {
    _initialize();
  }

  void _initialize() {
    _wifiState = _wifiManager.wifiState;
    _connectionInfo = _wifiManager.connectionInfo;
    _dhcpInfo = _wifiManager.dhcpInfo;
    _scanResults = _wifiManager.scanResults;
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
        _scanResults = _wifiManager.scanResults;
        notifyListeners();
      },
    );
    _wifiManager.registerScanResultsCallback(_scanResultsCallback);
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
