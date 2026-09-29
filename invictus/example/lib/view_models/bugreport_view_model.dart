import 'package:clover/clover.dart';
import 'package:intl/intl.dart';
import 'package:invictus/invictus.dart';
import 'package:logging/logging.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as path;

Logger get _logger => Logger('BugreportViewModel');

class BugreportViewModel extends ViewModel {
  final BugreportManager _bugreportManager;
  double _progress;

  BugreportViewModel()
    : _bugreportManager = BugreportManager(),
      _progress = 0.0;

  double get progress => _progress;

  void startBugreprot() async {
    final tmpDir = await path.getTemporaryDirectory();
    final deviceName = Build.product;
    final id = Build.id;
    final now = DateTime.now();
    final time = DateFormat('yyyy-MM-dd-HH-mm-ss').format(now);
    final fileName = 'bugreport-$deviceName-$id-$time.zip';
    final bugreportPath = path.join(tmpDir.path, fileName);
    final bugreportFd = ParcelFileDescriptor.open(
      bugreportPath,
      mode: {.create, .writeOnly, .append},
    );
    final params = BugreportParams(mode: .interactive);
    final callback = BugreportManager$BugreportCallback(
      onProgress: (progress) {
        _progress = progress;
        notifyListeners();
      },
      onError: (errorCode) {
        _logger.info('onError: $errorCode');
      },
      onFinished: () {
        _logger.info('onFinished');
      },
      onFinished$1: (bugreportFile) {
        _logger.info('onFinished: $bugreportFile');
      },
      onEarlyReportFinished: () {
        _logger.info('onEarlyReportFinished');
      },
    );
    _bugreportManager.startBugreport(
      bugreportFd: bugreportFd,
      params: params,
      callback: callback,
    );
  }

  void cancelBugreport() => _bugreportManager.cancelBugreport();
}
