import 'package:invictus_android/src/impl/invictus_object_impl.dart';
import 'package:invictus_android/src/jni.dart' as jni;
import 'package:invictus_api/invictus_api.dart';

final class Build$PartitionImpl extends InvictusObjectImpl
    implements Build$Partition {
  @override
  final jni.Build$Partition api;

  Build$PartitionImpl.internal(this.api);

  @override
  int get buildTimeMillis => api.getBuildTimeMillis();

  @override
  String get fingerprint => api.getFingerprint().impl;

  @override
  String get name => api.getName().impl;
}

final class Build$PartitionChannelImpl extends Build$PartitionChannel {
  @override
  String get partitionNameSystem => ArgumentError.checkNotNull(
    jni.Build$Partition.PARTITION_NAME_SYSTEM,
    'PARTITION_NAME_SYSTEM',
  ).impl;
}

final class Build$VersionChannelImpl extends Build$VersionChannel {
  @override
  String get baseOs =>
      ArgumentError.checkNotNull(jni.Build$VERSION.BASE_OS, 'BASE_OS').impl;

  @override
  String get codename =>
      ArgumentError.checkNotNull(jni.Build$VERSION.CODENAME, 'CODENAME').impl;

  @override
  String get incremental => ArgumentError.checkNotNull(
    jni.Build$VERSION.INCREMENTAL,
    'INCREMENTAL',
  ).impl;

  @override
  int get mediaPerformanceClass => jni.Build$VERSION.MEDIA_PERFORMANCE_CLASS;

  @override
  int get previewSdkInt => jni.Build$VERSION.PREVIEW_SDK_INT;

  @override
  String get release =>
      ArgumentError.checkNotNull(jni.Build$VERSION.RELEASE, 'RELEASE').impl;

  @override
  String get releaseOrCodename => jni.Build$VERSION.RELEASE_OR_CODENAME.impl;

  @override
  String get releaseOrPreviewDisplay =>
      jni.Build$VERSION.RELEASE_OR_PREVIEW_DISPLAY.impl;

  @override
  String get sdk =>
      ArgumentError.checkNotNull(jni.Build$VERSION.SDK, 'SDK').impl;

  @override
  int get sdkInt => jni.Build$VERSION.SDK_INT;

  @override
  int get sdkIntFull => jni.Build$VERSION.SDK_INT_FULL;

  @override
  String get securityPatch => ArgumentError.checkNotNull(
    jni.Build$VERSION.SECURITY_PATCH,
    'SECURITY_PATCH',
  ).impl;
}

final class Build$VersionCodesChannelImpl extends Build$VersionCodesChannel {
  @override
  int get baklava => jni.Build$VERSION_CODES.BAKLAVA;

  @override
  int get base => jni.Build$VERSION_CODES.BASE;

  @override
  int get base_1_1 => jni.Build$VERSION_CODES.BASE_1_1;

  @override
  int get cupcake => jni.Build$VERSION_CODES.CUPCAKE;

  @override
  int get curDevelopment => jni.Build$VERSION_CODES.CUR_DEVELOPMENT;

  @override
  int get donut => jni.Build$VERSION_CODES.DONUT;

  @override
  int get eclair => jni.Build$VERSION_CODES.ECLAIR;

  @override
  int get eclair_0_1 => jni.Build$VERSION_CODES.ECLAIR_0_1;

  @override
  int get eclairMr1 => jni.Build$VERSION_CODES.ECLAIR_MR1;

  @override
  int get froyo => jni.Build$VERSION_CODES.FROYO;

  @override
  int get gingerbread => jni.Build$VERSION_CODES.GINGERBREAD;

  @override
  int get gingerbreadMr1 => jni.Build$VERSION_CODES.GINGERBREAD_MR1;

  @override
  int get honeycomb => jni.Build$VERSION_CODES.HONEYCOMB;

  @override
  int get honeycombMr1 => jni.Build$VERSION_CODES.HONEYCOMB_MR1;

  @override
  int get honeycombMr2 => jni.Build$VERSION_CODES.HONEYCOMB_MR2;

  @override
  int get iceCreamSandwich => jni.Build$VERSION_CODES.ICE_CREAM_SANDWICH;

  @override
  int get iceCreamSandwichMr1 => jni.Build$VERSION_CODES.ICE_CREAM_SANDWICH_MR1;

  @override
  int get jellyBean => jni.Build$VERSION_CODES.JELLY_BEAN;

  @override
  int get jellyBeanMr1 => jni.Build$VERSION_CODES.JELLY_BEAN_MR1;

  @override
  int get jellyBeanMr2 => jni.Build$VERSION_CODES.JELLY_BEAN_MR2;

  @override
  int get kitkat => jni.Build$VERSION_CODES.KITKAT;

  @override
  int get kitkatWatch => jni.Build$VERSION_CODES.KITKAT_WATCH;

  @override
  int get lollipop => jni.Build$VERSION_CODES.LOLLIPOP;

  @override
  int get lollipopMr1 => jni.Build$VERSION_CODES.LOLLIPOP_MR1;

  @override
  int get m => jni.Build$VERSION_CODES.M;

  @override
  int get n => jni.Build$VERSION_CODES.N;

  @override
  int get nMr1 => jni.Build$VERSION_CODES.N_MR1;

  @override
  int get o => jni.Build$VERSION_CODES.O;

  @override
  int get oMr1 => jni.Build$VERSION_CODES.O_MR1;

  @override
  int get p => jni.Build$VERSION_CODES.P;

  @override
  int get q => jni.Build$VERSION_CODES.Q;

  @override
  int get r => jni.Build$VERSION_CODES.R;

  @override
  int get s => jni.Build$VERSION_CODES.S;

  @override
  int get sV2 => jni.Build$VERSION_CODES.S_V2;

  @override
  int get tiramisu => jni.Build$VERSION_CODES.TIRAMISU;

  @override
  int get upsideDownCake => jni.Build$VERSION_CODES.UPSIDE_DOWN_CAKE;

  @override
  int get vanillaIceCream => jni.Build$VERSION_CODES.VANILLA_ICE_CREAM;
}

final class Build$VersionCodesFullChannelImpl
    extends Build$VersionCodesFullChannel {
  @override
  int get baklava => jni.Build$VERSION_CODES_FULL.BAKLAVA;

  // TODO: baklava_1
  @override
  int get baklava_1 => throw UnimplementedError();

  @override
  int get base => jni.Build$VERSION_CODES_FULL.BASE;

  @override
  int get base_1_1 => jni.Build$VERSION_CODES_FULL.BASE_1_1;

  @override
  int get cupcake => jni.Build$VERSION_CODES_FULL.CUPCAKE;

  @override
  int get donut => jni.Build$VERSION_CODES_FULL.DONUT;

  @override
  int get eclair => jni.Build$VERSION_CODES_FULL.ECLAIR;

  @override
  int get eclair_0_1 => jni.Build$VERSION_CODES_FULL.ECLAIR_0_1;

  @override
  int get eclairMr1 => jni.Build$VERSION_CODES_FULL.ECLAIR_MR1;

  @override
  int get froyo => jni.Build$VERSION_CODES_FULL.FROYO;

  @override
  int get gingerbread => jni.Build$VERSION_CODES_FULL.GINGERBREAD;

  @override
  int get gingerbreadMr1 => jni.Build$VERSION_CODES_FULL.GINGERBREAD_MR1;

  @override
  int get honeycomb => jni.Build$VERSION_CODES_FULL.HONEYCOMB;

  @override
  int get honeycombMr1 => jni.Build$VERSION_CODES_FULL.HONEYCOMB_MR1;

  @override
  int get honeycombMr2 => jni.Build$VERSION_CODES_FULL.HONEYCOMB_MR2;

  @override
  int get iceCreamSandwich => jni.Build$VERSION_CODES_FULL.ICE_CREAM_SANDWICH;

  @override
  int get iceCreamSandwichMr1 =>
      jni.Build$VERSION_CODES_FULL.ICE_CREAM_SANDWICH_MR1;

  @override
  int get jellyBean => jni.Build$VERSION_CODES_FULL.JELLY_BEAN;

  @override
  int get jellyBeanMr1 => jni.Build$VERSION_CODES_FULL.JELLY_BEAN_MR1;

  @override
  int get jellyBeanMr2 => jni.Build$VERSION_CODES_FULL.JELLY_BEAN_MR2;

  @override
  int get kitkat => jni.Build$VERSION_CODES_FULL.KITKAT;

  @override
  int get kitkatWatch => jni.Build$VERSION_CODES_FULL.KITKAT_WATCH;

  @override
  int get lollipop => jni.Build$VERSION_CODES_FULL.LOLLIPOP;

  @override
  int get lollipopMr1 => jni.Build$VERSION_CODES_FULL.LOLLIPOP_MR1;

  @override
  int get m => jni.Build$VERSION_CODES_FULL.M;

  @override
  int get n => jni.Build$VERSION_CODES_FULL.N;

  @override
  int get nMr1 => jni.Build$VERSION_CODES_FULL.N_MR1;

  @override
  int get o => jni.Build$VERSION_CODES_FULL.O;

  @override
  int get oMr1 => jni.Build$VERSION_CODES_FULL.O_MR1;

  @override
  int get p => jni.Build$VERSION_CODES_FULL.P;

  @override
  int get q => jni.Build$VERSION_CODES_FULL.Q;

  @override
  int get r => jni.Build$VERSION_CODES_FULL.R;

  @override
  int get s => jni.Build$VERSION_CODES_FULL.S;

  @override
  int get sV2 => jni.Build$VERSION_CODES_FULL.S_V2;

  @override
  int get tiramisu => jni.Build$VERSION_CODES_FULL.TIRAMISU;

  @override
  int get upsideDownCake => jni.Build$VERSION_CODES_FULL.UPSIDE_DOWN_CAKE;

  @override
  int get vanillaIceCream => jni.Build$VERSION_CODES_FULL.VANILLA_ICE_CREAM;
}

final class BuildChannelImpl extends BuildChannel {
  @override
  String get board => ArgumentError.checkNotNull(jni.Build.BOARD, 'BOARD').impl;

  @override
  String get bootloader =>
      ArgumentError.checkNotNull(jni.Build.BOOTLOADER, 'BOOTLOADER').impl;

  @override
  String get brand => ArgumentError.checkNotNull(jni.Build.BRAND, 'BRAND').impl;

  @override
  String get cpuAbi =>
      ArgumentError.checkNotNull(jni.Build.CPU_ABI, 'CPU_ABI').impl;

  @override
  String get cpuAbi2 =>
      ArgumentError.checkNotNull(jni.Build.CPU_ABI2, 'CPU_ABI2').impl;

  @override
  String get device =>
      ArgumentError.checkNotNull(jni.Build.DEVICE, 'DEVICE').impl;

  @override
  String get display =>
      ArgumentError.checkNotNull(jni.Build.DISPLAY, 'DISPLAY').impl;

  @override
  String get fingerprint =>
      ArgumentError.checkNotNull(jni.Build.FINGERPRINT, 'FINGERPRINT').impl;

  @override
  List<Build$Partition> get fingerprintedPartitions =>
      jni.Build.getFingerprintedPartitions().nonNulls
          .map((e) => e.impl)
          .toList();

  @override
  String get hardware =>
      ArgumentError.checkNotNull(jni.Build.HARDWARE, 'HARDWARE').impl;

  @override
  String get host => ArgumentError.checkNotNull(jni.Build.HOST, 'HOST').impl;

  @override
  String get id => ArgumentError.checkNotNull(jni.Build.ID, 'ID').impl;

  @override
  String get manufacturer =>
      ArgumentError.checkNotNull(jni.Build.MANUFACTURER, 'MANUFACTURER').impl;

  @override
  String get model => ArgumentError.checkNotNull(jni.Build.MODEL, 'MODEL').impl;

  @override
  String get odmSku => jni.Build.ODM_SKU.impl;

  @override
  String get product =>
      ArgumentError.checkNotNull(jni.Build.PRODUCT, 'PRODUCT').impl;

  @override
  String get radio => ArgumentError.checkNotNull(jni.Build.RADIO, 'RADIO').impl;

  @override
  String? get radioVersion => jni.Build.getRadioVersion()?.impl;

  @override
  String get serial {
    final serialApiOrNull =
        jni.Build$VERSION.SDK_INT >= jni.Build$VERSION_CODES.O
        ? jni.Build.getSerial()
        : jni.Build.SERIAL;
    final serialApi = ArgumentError.checkNotNull(serialApiOrNull, 'serialApi');
    return serialApi.impl;
  }

  @override
  String get sku => jni.Build.SKU.impl;

  @override
  String get socManufacturer => jni.Build.SOC_MANUFACTURER.impl;

  @override
  String get socModel => jni.Build.SOC_MODEL.impl;

  @override
  List<String> get supported32BitAbis => ArgumentError.checkNotNull(
    jni.Build.SUPPORTED_32_BIT_ABIS,
    'SUPPORTED_32_BIT_ABIS',
  ).nonNulls.map((e) => e.impl).toList();

  @override
  List<String> get supported64BitAbis => ArgumentError.checkNotNull(
    jni.Build.SUPPORTED_64_BIT_ABIS,
    'SUPPORTED_64_BIT_ABIS',
  ).nonNulls.map((e) => e.impl).toList();

  @override
  List<String> get supportedAbis => ArgumentError.checkNotNull(
    jni.Build.SUPPORTED_ABIS,
    'SUPPORTED_ABIS',
  ).nonNulls.map((e) => e.impl).toList();

  @override
  String get tags => ArgumentError.checkNotNull(jni.Build.TAGS, 'TAGS').impl;

  @override
  int get time => jni.Build.TIME;

  @override
  String get type => ArgumentError.checkNotNull(jni.Build.TYPE, 'TYPE').impl;

  @override
  String get user => ArgumentError.checkNotNull(jni.Build.USER, 'USER').impl;

  // TODO: getBackportedFixStatus
  @override
  Build$BackportedFixStatus getBackportedFixStatus(int id) =>
      throw UnimplementedError();

  @override
  int getMajorSdkVersion(int sdkIntFull) =>
      jni.Build.getMajorSdkVersion(sdkIntFull);

  @override
  int getMinorSdkVersion(int sdkIntFull) =>
      jni.Build.getMinorSdkVersion(sdkIntFull);
}

extension Invictus$JBuild$PartitionX on jni.Build$Partition {
  Build$Partition get impl => Build$PartitionImpl.internal(this);
}
