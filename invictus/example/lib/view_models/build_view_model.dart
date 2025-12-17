import 'package:clover/clover.dart';
import 'package:invictus/invictus.dart';

class BuildViewModel extends ViewModel {
  final String board;
  final String bootloader;
  final String brand;
  final String device;
  final String display;
  final String fingerprint;
  final List<Build$Partition> fingerprintedPartitions;
  final String hardware;
  final String host;
  final String id;
  final String manufacturer;
  final String model;
  final String odmSku;
  final String product;
  final String? radio;
  final String serial;
  final String sku;
  final String socManufacturer;
  final String socModel;
  final List<String> supported32BitAbis;
  final List<String> supported64BitAbis;
  final List<String> supportedAbis;
  final String tags;
  final int time;
  final String type;
  final String user;

  BuildViewModel()
    : board = Build.board,
      bootloader = Build.bootloader,
      brand = Build.brand,
      device = Build.device,
      display = Build.display,
      fingerprint = Build.fingerprint,
      fingerprintedPartitions = Build.fingerprintedPartitions,
      hardware = Build.hardware,
      host = Build.host,
      id = Build.id,
      manufacturer = Build.manufacturer,
      model = Build.model,
      odmSku = Build.odmSku,
      product = Build.product,
      // radio = Build.radio,
      radio = Build.radioVersion,
      serial = Build.serial,
      sku = Build.sku,
      socManufacturer = Build.socManufacturer,
      socModel = Build.socModel,
      supported32BitAbis = Build.supported32BitAbis,
      supported64BitAbis = Build.supported64BitAbis,
      supportedAbis = Build.supportedAbis,
      tags = Build.tags,
      time = Build.time,
      type = Build.type,
      user = Build.user;
}
