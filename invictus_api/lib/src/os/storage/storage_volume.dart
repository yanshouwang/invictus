import 'package:invictus_api/src/os.dart';

abstract interface class StorageVolume {
  String get id;
  int get fatVolumeId;
  String get userLabel;
  String get description;
  String get path;
  String get internalPath;
  // File get pathFile;
  // File? get directory;
  int get maxFileSize;
  // String? get mediaStoreVolumeName;
  // UserHandle get owner;
  Environment$Media get state;
  // UUID? get storageUuid;
  String? get uuid;
  // String? get normalizedUuid;
  bool get isEmulated;
  bool get isPrimary;
  bool get isRemovable;
  // bool get isExternallyManaged;
  // bool get allowMassStorage;

  // Intent? createAccessIntent(String? directoryName);
  // Intent createOpenDocumentTreeIntent();
  // String dump();
}
