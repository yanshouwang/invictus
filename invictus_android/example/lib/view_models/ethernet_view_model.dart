import 'package:clover/clover.dart';
import 'package:invictus_android/invictus_android.dart';
import 'package:logging/logging.dart';

Logger get _logger => Logger('EthernetViewModel');

class EthernetViewModel extends ViewModel {
  final EthernetManager _ethernetManager;
  final Set<String> _ifaces;

  late final EthernetManager$Listener _listener;

  Set<String> get ifaces => _ifaces;

  String? get iface => ifaces.firstOrNull;

  EthernetViewModel() : _ethernetManager = EthernetManager(), _ifaces = {} {
    _initialize();
  }

  void _initialize() {
    final ifaces = _ethernetManager.availableInterfaces;
    _logger.info('ifaces: $ifaces');
    _ifaces.addAll(ifaces);
    notifyListeners();
    _listener = EthernetManager$Listener(
      onAvailabilityChanged: (iface, isAvailable) {
        _logger.info('onAvailabilityChanged: $iface, $isAvailable');
        if (isAvailable) {
          final isAdded = _ifaces.add(iface);
          if (!isAdded) return;
        } else {
          final isRemoved = _ifaces.remove(iface);
          if (!isRemoved) return;
        }
        notifyListeners();
      },
    );
    _ethernetManager.addListener(_listener);
  }

  IpConfiguration getConfiguration(String iface) =>
      _ethernetManager.getConfiguration(iface);

  void setConfiguration(String iface, IpConfiguration config) =>
      _ethernetManager.setConfiguration(iface, config);

  @override
  void dispose() {
    _ethernetManager.removeListener(_listener);
    super.dispose();
  }
}
