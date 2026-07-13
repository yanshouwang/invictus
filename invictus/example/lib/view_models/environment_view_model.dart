import 'package:clover/clover.dart';
import 'package:invictus/invictus.dart';

class EnvironmentViewModel extends ViewModel {
  bool get isExternalStorageEmulated => Environment.isExternalStorageEmulated();
  bool get isExternalStorageManager => Environment.isExternalStorageManager();
  bool get isExternalStorageRemovable =>
      Environment.isExternalStorageRemovable();

  Environment$Media get externalStorageState =>
      Environment.getExternalStorageState();

  String get rootDirectory => Environment.getRootDirectory();
  String get dataDirectory => Environment.getDataDirectory();
  String get downloadCacheDirectory => Environment.getDownloadCacheDirectory();
  String get externalStorageDirectory =>
      Environment.getExternalStorageDirectory();
  String get alarmsDirectory =>
      Environment.getExternalStoragePublicDirectory(.alarms);
  String get dcimDirectory =>
      Environment.getExternalStoragePublicDirectory(.dcim);
  String get documentsDirectory =>
      Environment.getExternalStoragePublicDirectory(.documents);
  String get downloadsDirectory =>
      Environment.getExternalStoragePublicDirectory(.downloads);
  String get moviesDirectory =>
      Environment.getExternalStoragePublicDirectory(.movies);
  String get musicDirectory =>
      Environment.getExternalStoragePublicDirectory(.music);
  String get notificationsDirectory =>
      Environment.getExternalStoragePublicDirectory(.notifications);
  String get picturesDirectory =>
      Environment.getExternalStoragePublicDirectory(.pictures);
  String get podcastsDirectory =>
      Environment.getExternalStoragePublicDirectory(.podcasts);
  String get ringtonesDirectory =>
      Environment.getExternalStoragePublicDirectory(.ringtones);
  String get screenshotsDirectory =>
      Environment.getExternalStoragePublicDirectory(.screenshots);
}
