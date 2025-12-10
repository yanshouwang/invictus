import 'package:invictus_android/src/api.dart';
import 'package:invictus_android/src/jni.dart' as jni;

final class Build$PartitionImpl implements Build$Partition {
  static String get partitionNameSystem => ArgumentError.checkNotNull(
    jni.Build$Partition.PARTITION_NAME_SYSTEM,
    'PARTITION_NAME_SYSTEM',
  ).impl;

  final jni.Build$Partition api;

  Build$PartitionImpl.internal(this.api);

  @override
  int get buildTimeMillis => api.getBuildTimeMillis();

  @override
  String get fingerprint => api.getFingerprint().impl;

  @override
  String get name => api.getName().impl;
}

final class Build$VersionImpl implements Build$Version {
  static String get baseOs =>
      ArgumentError.checkNotNull(jni.Build$VERSION.BASE_OS, 'BASE_OS').impl;

  static String get codename =>
      ArgumentError.checkNotNull(jni.Build$VERSION.CODENAME, 'CODENAME').impl;

  static String get incremental => ArgumentError.checkNotNull(
    jni.Build$VERSION.INCREMENTAL,
    'INCREMENTAL',
  ).impl;

  static int get mediaPerformanceClass =>
      jni.Build$VERSION.MEDIA_PERFORMANCE_CLASS;

  static int get previewSdkInt => jni.Build$VERSION.PREVIEW_SDK_INT;

  static String get release =>
      ArgumentError.checkNotNull(jni.Build$VERSION.RELEASE, 'RELEASE').impl;

  static String get releaseOrCodename =>
      jni.Build$VERSION.RELEASE_OR_CODENAME.impl;

  static String get releaseOrPreviewDisplay =>
      jni.Build$VERSION.RELEASE_OR_PREVIEW_DISPLAY.impl;

  @Deprecated('Use SDK_INT to easily get this as an integer.')
  static String get sdk =>
      ArgumentError.checkNotNull(jni.Build$VERSION.SDK, 'SDK').impl;

  static int get sdkInt => jni.Build$VERSION.SDK_INT;

  static int get sdkIntFull => jni.Build$VERSION.SDK_INT_FULL;

  static String get securityPatch => ArgumentError.checkNotNull(
    jni.Build$VERSION.SECURITY_PATCH,
    'SECURITY_PATCH',
  ).impl;

  final jni.Build$VERSION api;

  Build$VersionImpl.internal(this.api);
}

final class Build$VersionCodesImpl implements Build$VersionCodes {
  static int get baklava => jni.Build$VERSION_CODES.BAKLAVA;

  static int get base => jni.Build$VERSION_CODES.BASE;

  static int get base_1_1 => jni.Build$VERSION_CODES.BASE_1_1;

  static int get cupcake => jni.Build$VERSION_CODES.CUPCAKE;

  static int get curDevelopment => jni.Build$VERSION_CODES.CUR_DEVELOPMENT;

  static int get donut => jni.Build$VERSION_CODES.DONUT;

  static int get eclair => jni.Build$VERSION_CODES.ECLAIR;

  static int get eclair_0_1 => jni.Build$VERSION_CODES.ECLAIR_0_1;

  static int get eclairMr1 => jni.Build$VERSION_CODES.ECLAIR_MR1;

  static int get froyo => jni.Build$VERSION_CODES.FROYO;

  static int get gingerbread => jni.Build$VERSION_CODES.GINGERBREAD;

  static int get gingerbreadMr1 => jni.Build$VERSION_CODES.GINGERBREAD_MR1;

  static int get honeycomb => jni.Build$VERSION_CODES.HONEYCOMB;

  static int get honeycombMr1 => jni.Build$VERSION_CODES.HONEYCOMB_MR1;

  static int get honeycombMr2 => jni.Build$VERSION_CODES.HONEYCOMB_MR2;

  static int get iceCreamSandwich => jni.Build$VERSION_CODES.ICE_CREAM_SANDWICH;

  static int get iceCreamSandwichMr1 =>
      jni.Build$VERSION_CODES.ICE_CREAM_SANDWICH_MR1;

  static int get jellyBean => jni.Build$VERSION_CODES.JELLY_BEAN;

  static int get jellyBeanMr1 => jni.Build$VERSION_CODES.JELLY_BEAN_MR1;

  static int get jellyBeanMr2 => jni.Build$VERSION_CODES.JELLY_BEAN_MR2;

  static int get kitkat => jni.Build$VERSION_CODES.KITKAT;

  static int get kitkatWatch => jni.Build$VERSION_CODES.KITKAT_WATCH;

  static int get lollipop => jni.Build$VERSION_CODES.LOLLIPOP;

  static int get lollipopMr1 => jni.Build$VERSION_CODES.LOLLIPOP_MR1;

  static int get m => jni.Build$VERSION_CODES.M;

  static int get n => jni.Build$VERSION_CODES.N;

  static int get nMr1 => jni.Build$VERSION_CODES.N_MR1;

  static int get o => jni.Build$VERSION_CODES.O;

  static int get oMr1 => jni.Build$VERSION_CODES.O_MR1;

  static int get p => jni.Build$VERSION_CODES.P;

  static int get q => jni.Build$VERSION_CODES.Q;

  static int get r => jni.Build$VERSION_CODES.R;

  static int get s => jni.Build$VERSION_CODES.S;

  static int get sV2 => jni.Build$VERSION_CODES.S_V2;

  static int get tiramisu => jni.Build$VERSION_CODES.TIRAMISU;

  static int get upsideDownCake => jni.Build$VERSION_CODES.UPSIDE_DOWN_CAKE;

  static int get vanillaIceCream => jni.Build$VERSION_CODES.VANILLA_ICE_CREAM;

  final jni.Build$VERSION_CODES api;

  Build$VersionCodesImpl.internal(this.api);
}

final class Build$VersionCodesFullImpl implements Build$VersionCodesFull {
  static int get baklava => jni.Build$VERSION_CODES_FULL.BAKLAVA;

  // TODO: baklava_1
  static int get baklava_1 => throw UnimplementedError();

  static int get base => jni.Build$VERSION_CODES_FULL.BASE;

  static int get base_1_1 => jni.Build$VERSION_CODES_FULL.BASE_1_1;

  static int get cupcake => jni.Build$VERSION_CODES_FULL.CUPCAKE;

  static int get donut => jni.Build$VERSION_CODES_FULL.DONUT;

  static int get eclair => jni.Build$VERSION_CODES_FULL.ECLAIR;

  static int get eclair_0_1 => jni.Build$VERSION_CODES_FULL.ECLAIR_0_1;

  static int get eclairMr1 => jni.Build$VERSION_CODES_FULL.ECLAIR_MR1;

  static int get froyo => jni.Build$VERSION_CODES_FULL.FROYO;

  static int get gingerbread => jni.Build$VERSION_CODES_FULL.GINGERBREAD;

  static int get gingerbreadMr1 => jni.Build$VERSION_CODES_FULL.GINGERBREAD_MR1;

  static int get honeycomb => jni.Build$VERSION_CODES_FULL.HONEYCOMB;

  static int get honeycombMr1 => jni.Build$VERSION_CODES_FULL.HONEYCOMB_MR1;

  static int get honeycombMr2 => jni.Build$VERSION_CODES_FULL.HONEYCOMB_MR2;

  static int get iceCreamSandwich =>
      jni.Build$VERSION_CODES_FULL.ICE_CREAM_SANDWICH;

  static int get iceCreamSandwichMr1 =>
      jni.Build$VERSION_CODES_FULL.ICE_CREAM_SANDWICH_MR1;

  static int get jellyBean => jni.Build$VERSION_CODES_FULL.JELLY_BEAN;

  static int get jellyBeanMr1 => jni.Build$VERSION_CODES_FULL.JELLY_BEAN_MR1;

  static int get jellyBeanMr2 => jni.Build$VERSION_CODES_FULL.JELLY_BEAN_MR2;

  static int get kitkat => jni.Build$VERSION_CODES_FULL.KITKAT;

  static int get kitkatWatch => jni.Build$VERSION_CODES_FULL.KITKAT_WATCH;

  static int get lollipop => jni.Build$VERSION_CODES_FULL.LOLLIPOP;

  static int get lollipopMr1 => jni.Build$VERSION_CODES_FULL.LOLLIPOP_MR1;

  static int get m => jni.Build$VERSION_CODES_FULL.M;

  static int get n => jni.Build$VERSION_CODES_FULL.N;

  static int get nMr1 => jni.Build$VERSION_CODES_FULL.N_MR1;

  static int get o => jni.Build$VERSION_CODES_FULL.O;

  static int get oMr1 => jni.Build$VERSION_CODES_FULL.O_MR1;

  static int get p => jni.Build$VERSION_CODES_FULL.P;

  static int get q => jni.Build$VERSION_CODES_FULL.Q;

  static int get r => jni.Build$VERSION_CODES_FULL.R;

  static int get s => jni.Build$VERSION_CODES_FULL.S;

  static int get sV2 => jni.Build$VERSION_CODES_FULL.S_V2;

  static int get tiramisu => jni.Build$VERSION_CODES_FULL.TIRAMISU;

  static int get upsideDownCake =>
      jni.Build$VERSION_CODES_FULL.UPSIDE_DOWN_CAKE;

  static int get vanillaIceCream =>
      jni.Build$VERSION_CODES_FULL.VANILLA_ICE_CREAM;

  final jni.Build$VERSION_CODES_FULL api;

  Build$VersionCodesFullImpl.internal(this.api);
}

final class BuildImpl implements Build {
  static String get board =>
      ArgumentError.checkNotNull(jni.Build.BOARD, 'BOARD').impl;

  static String get bootloader =>
      ArgumentError.checkNotNull(jni.Build.BOOTLOADER, 'BOOTLOADER').impl;

  static String get brand =>
      ArgumentError.checkNotNull(jni.Build.BRAND, 'BRAND').impl;

  @Deprecated('Use SUPPORTED_ABIS instead.')
  static String get cpuAbi =>
      ArgumentError.checkNotNull(jni.Build.CPU_ABI, 'CPU_ABI').impl;

  @Deprecated('Use SUPPORTED_ABIS instead.')
  static String get cpuAbi2 =>
      ArgumentError.checkNotNull(jni.Build.CPU_ABI2, 'CPU_ABI2').impl;

  static String get device =>
      ArgumentError.checkNotNull(jni.Build.DEVICE, 'DEVICE').impl;

  static String get display =>
      ArgumentError.checkNotNull(jni.Build.DISPLAY, 'DISPLAY').impl;

  static String get fingerprint =>
      ArgumentError.checkNotNull(jni.Build.FINGERPRINT, 'FINGERPRINT').impl;

  static List<Build$Partition> get fingerprintedPartitions =>
      jni.Build.getFingerprintedPartitions().nonNulls
          .map((e) => e.impl)
          .toList();

  static String get hardware =>
      ArgumentError.checkNotNull(jni.Build.HARDWARE, 'HARDWARE').impl;

  static String get host =>
      ArgumentError.checkNotNull(jni.Build.HOST, 'HOST').impl;

  static String get id => ArgumentError.checkNotNull(jni.Build.ID, 'ID').impl;

  static String get manufacturer =>
      ArgumentError.checkNotNull(jni.Build.MANUFACTURER, 'MANUFACTURER').impl;

  static String get model =>
      ArgumentError.checkNotNull(jni.Build.MODEL, 'MODEL').impl;

  static String get odmSku => jni.Build.ODM_SKU.impl;

  static String get product =>
      ArgumentError.checkNotNull(jni.Build.PRODUCT, 'PRODUCT').impl;

  @Deprecated(
    'The radio firmware version is frequently not available when this class is initialized, leading to a blank or "unknown" value for this string. Use getRadioVersion instead.',
  )
  static String get radio =>
      ArgumentError.checkNotNull(jni.Build.RADIO, 'RADIO').impl;

  static String? get radioVersion => jni.Build.getRadioVersion()?.impl;

  static String get serial {
    final serialApiOrNull =
        jni.Build$VERSION.SDK_INT >= jni.Build$VERSION_CODES.O
        ? jni.Build.getSerial()
        : jni.Build.SERIAL;
    final serialApi = ArgumentError.checkNotNull(serialApiOrNull, 'serialApi');
    return serialApi.impl;
  }

  static String get sku => jni.Build.SKU.impl;

  static String get socManufacturer => jni.Build.SOC_MANUFACTURER.impl;

  static String get socModel => jni.Build.SOC_MODEL.impl;

  static List<String> get supported32BitAbis => ArgumentError.checkNotNull(
    jni.Build.SUPPORTED_32_BIT_ABIS,
    'SUPPORTED_32_BIT_ABIS',
  ).nonNulls.map((e) => e.impl).toList();

  static List<String> get supported64BitAbis => ArgumentError.checkNotNull(
    jni.Build.SUPPORTED_64_BIT_ABIS,
    'SUPPORTED_64_BIT_ABIS',
  ).nonNulls.map((e) => e.impl).toList();

  static List<String> get supportedAbis => ArgumentError.checkNotNull(
    jni.Build.SUPPORTED_ABIS,
    'SUPPORTED_ABIS',
  ).nonNulls.map((e) => e.impl).toList();

  static String get tags =>
      ArgumentError.checkNotNull(jni.Build.TAGS, 'TAGS').impl;

  static int get time => jni.Build.TIME;

  static String get type =>
      ArgumentError.checkNotNull(jni.Build.TYPE, 'TYPE').impl;

  static String get user =>
      ArgumentError.checkNotNull(jni.Build.USER, 'USER').impl;

  // TODO: getBackportedFixStatus
  static Build$BackportedFixStatus getBackportedFixStatus(int id) =>
      throw UnimplementedError();

  static int getMajorSdkVersion(int sdkIntFull) =>
      jni.Build.getMajorSdkVersion(sdkIntFull);

  static int getMinorSdkVersion(int sdkIntFull) =>
      jni.Build.getMinorSdkVersion(sdkIntFull);

  final jni.Build api;

  BuildImpl.internal(this.api);
}

extension Invictus$JBuild$PartitionX on jni.Build$Partition {
  Build$Partition get impl => Build$PartitionImpl.internal(this);
}
