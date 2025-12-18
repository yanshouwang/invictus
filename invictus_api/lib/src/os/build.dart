import 'package:plugin_platform_interface/plugin_platform_interface.dart';

enum Build$BackportedFixStatus {
  /// The status of the known issue on this device is not known.
  unknown, // 0
  /// The known issue is fixed on this device.
  fixed, // 1
  /// The known issue is not applicable to this device.
  ///
  /// For example if the issue only affects a specific brand, devices from other brands would report not applicable.
  notApplicable, // 2
  /// The known issue is not fixed on this device.
  notFixed, // 3
}

/// Build information for a particular device partition.
abstract interface class Build$Partition {
  /// The name identifying the system partition.
  static String get partitionNameSystem =>
      Build$PartitionChannel.instance.partitionNameSystem;

  /// The time (ms since epoch), at which this partition was built, see Build.TIME.
  int get buildTimeMillis;

  /// The build fingerprint of this partition, see Build.FINGERPRINT.
  String get fingerprint;

  /// The name of this partition, e.g. "system", or "vendor"
  String get name;
}

/// Various version strings.
abstract interface class Build$Version {
  /// The base OS build the product is based on.
  static String get baseOs => Build$VersionChannel.instance.baseOs;

  /// The current development codename, or the string "REL" if this is a release build.
  static String get codename => Build$VersionChannel.instance.codename;

  /// The internal value used by the underlying source control to represent this build. E.g., a perforce changelist number or
  /// a git hash.
  static String get incremental => Build$VersionChannel.instance.incremental;

  /// The media performance class of the device or 0 if none.
  ///
  /// If this value is not 0, the device conforms to the media performance class definition of the SDK version of this value.
  /// This value never changes while a device is booted, but it may increase when the hardware manufacturer provides an
  /// OTA update.
  ///
  /// Possible non-zero values are defined in Build.VERSION_CODES starting with Build.VERSION_CODES.R.
  static int get mediaPerformanceClass =>
      Build$VersionChannel.instance.mediaPerformanceClass;

  /// The developer preview revision of a prerelease SDK. This value will always be 0 on production platform
  /// builds/devices.
  ///
  /// When this value is nonzero, any new API added since the last officially published API level is only guaranteed to be
  /// present on that specific preview revision. For example, an API Activity.fooBar() might be present in preview
  /// revision 1 but renamed or removed entirely in preview revision 2, which may cause an app attempting to call it to crash
  /// at runtime.
  ///
  /// Experimental apps targeting preview APIs should check this value for equality (==) with the preview SDK revision
  /// they were built for before using any prerelease platform APIs. Apps that detect a preview SDK revision other than the
  /// specific one they expect should fall back to using APIs from the previously published API level only to avoid unwanted
  /// runtime exceptions.
  static int get previewSdkInt => Build$VersionChannel.instance.previewSdkInt;

  /// The user-visible version string. E.g., "1.0" or "3.4b5" or "bananas". This field is an opaque string. Do not assume that
  /// its value has any particular structure or that values of RELEASE from different releases can be somehow ordered.
  static String get release => Build$VersionChannel.instance.release;

  /// The version string. May be RELEASE or CODENAME if not a final release build.
  static String get releaseOrCodename =>
      Build$VersionChannel.instance.releaseOrCodename;

  /// The version string we show to the user; may be RELEASE or a descriptive string if not a final release build.
  static String get releaseOrPreviewDisplay =>
      Build$VersionChannel.instance.releaseOrPreviewDisplay;

  /// The user-visible SDK version of the framework in its raw String representation; use SDK_INT instead.
  @Deprecated('Use SDK_INT to easily get this as an integer.')
  static String get sdk => Build$VersionChannel.instance.sdk;

  /// The SDK version of the software currently running on this hardware device. This value never changes while a device is
  /// booted, but it may increase when the hardware manufacturer provides an OTA update.
  ///
  /// This constant records the major version of Android. Use SDK_INT_FULL if you need to consider the minor version of
  /// Android as well.
  ///
  /// Possible values are defined in Build.VERSION_CODES.
  static int get sdkInt => Build$VersionChannel.instance.sdkInt;

  /// The major and minor SDK version of the software currently running on this hardware device. This value never changes
  /// while a device is booted, but it may increase when the hardware manufacturer provides an OTA update.
  ///
  /// SDK_INT is increased on new Android dessert releases, also called major releases. Between these, Android may also
  /// release minor releases where SDK_INT remains unchanged. Minor releases can add new APIs, and have stricter
  /// guarantees around backwards compatibility (e.g. no changes gated by targetSdkVersion) compared to major
  /// releases.
  ///
  /// SDK_INT_FULL is increased on every release.
  ///
  /// Possible values are defined in .
  static int get sdkIntFull => Build$VersionChannel.instance.sdkIntFull;

  /// The user-visible security patch level. This value represents the date when the device most recently applied a security
  /// patch.
  static String get securityPatch =>
      Build$VersionChannel.instance.securityPatch;
}

/// Enumeration of the currently known SDK version codes. These are the values that can be found in VERSION.SDK.
/// Version numbers increment monotonically with each official platform release.
abstract interface class Build$VersionCodes {
  /// Baklava.
  static int get baklava => Build$VersionCodesChannel.instance.baklava;

  /// The original, first, version of Android. Yay!
  ///
  /// Released publicly as Android 1.0 in September 2008.
  static int get base => Build$VersionCodesChannel.instance.base;

  /// First Android update.
  ///
  /// Released publicly as Android 1.1 in February 2009.
  static int get base_1_1 => Build$VersionCodesChannel.instance.base_1_1;

  /// C.
  ///
  /// Released publicly as Android 1.5 in April 2009.
  static int get cupcake => Build$VersionCodesChannel.instance.cupcake;

  /// Magic version number for a current development build, which has not yet turned into an official release.
  static int get curDevelopment =>
      Build$VersionCodesChannel.instance.curDevelopment;

  /// D.
  ///
  /// Released publicly as Android 1.6 in September 2009.
  static int get donut => Build$VersionCodesChannel.instance.donut;

  /// E.
  ///
  /// Released publicly as Android 2.0 in October 2009.
  static int get eclair => Build$VersionCodesChannel.instance.eclair;

  /// E incremental update.
  ///
  /// Released publicly as Android 2.0.1 in December 2009.
  static int get eclair_0_1 => Build$VersionCodesChannel.instance.eclair_0_1;

  /// E MR1.
  ///
  /// Released publicly as Android 2.1 in January 2010.
  static int get eclairMr1 => Build$VersionCodesChannel.instance.eclairMr1;

  /// F.
  ///
  /// Released publicly as Android 2.2 in May 2010.
  static int get froyo => Build$VersionCodesChannel.instance.froyo;

  /// G.
  ///
  /// Released publicly as Android 2.3 in December 2010.
  static int get gingerbread => Build$VersionCodesChannel.instance.gingerbread;

  /// G MR1.
  ///
  /// Released publicly as Android 2.3.3 in February 2011.
  static int get gingerbreadMr1 =>
      Build$VersionCodesChannel.instance.gingerbreadMr1;

  /// H.
  ///
  /// Released publicly as Android 3.0 in February 2011.
  static int get honeycomb => Build$VersionCodesChannel.instance.honeycomb;

  /// H MR1.
  ///
  /// Released publicly as Android 3.1 in May 2011.
  static int get honeycombMr1 =>
      Build$VersionCodesChannel.instance.honeycombMr1;

  /// H MR2.
  ///
  /// Released publicly as Android 3.2 in July 2011.
  static int get honeycombMr2 =>
      Build$VersionCodesChannel.instance.honeycombMr2;

  /// I.
  ///
  /// Released publicly as Android 4.0 in October 2011.
  static int get iceCreamSandwich =>
      Build$VersionCodesChannel.instance.iceCreamSandwich;

  /// I MR1.
  ///
  /// Released publicly as Android 4.03 in December 2011.
  static int get iceCreamSandwichMr1 =>
      Build$VersionCodesChannel.instance.iceCreamSandwichMr1;

  /// J.
  ///
  /// Released publicly as Android 4.1 in July 2012.
  static int get jellyBean => Build$VersionCodesChannel.instance.jellyBean;

  /// J MR1.
  ///
  /// Released publicly as Android 4.2 in November 2012.
  static int get jellyBeanMr1 =>
      Build$VersionCodesChannel.instance.jellyBeanMr1;

  /// J MR2.
  ///
  /// Released publicly as Android 4.3 in July 2013.
  static int get jellyBeanMr2 =>
      Build$VersionCodesChannel.instance.jellyBeanMr2;

  /// K.
  ///
  /// Released publicly as Android 4.4 in October 2013.
  static int get kitkat => Build$VersionCodesChannel.instance.kitkat;

  /// K for watches.
  ///
  /// Released publicly as Android 4.4W in June 2014.
  static int get kitkatWatch => Build$VersionCodesChannel.instance.kitkatWatch;

  /// L.
  ///
  /// Released publicly as Android 5.0 in November 2014.
  static int get lollipop => Build$VersionCodesChannel.instance.lollipop;

  /// L MR1.
  ///
  /// Released publicly as Android 5.1 in March 2015.
  static int get lollipopMr1 => Build$VersionCodesChannel.instance.lollipopMr1;

  /// M.
  ///
  /// Released publicly as Android 6.0 in October 2015.
  static int get m => Build$VersionCodesChannel.instance.m;

  /// N.
  ///
  /// Released publicly as Android 7.0 in August 2016.
  static int get n => Build$VersionCodesChannel.instance.n;

  /// N MR1.
  ///
  /// Released publicly as Android 7.1 in October 2016.
  static int get nMr1 => Build$VersionCodesChannel.instance.nMr1;

  /// O.
  ///
  /// Released publicly as Android 8.0 in August 2017.
  static int get o => Build$VersionCodesChannel.instance.o;

  /// O MR1.
  ///
  /// Released publicly as Android 8.1 in December 2017.
  static int get oMr1 => Build$VersionCodesChannel.instance.oMr1;

  /// P.
  ///
  /// Released publicly as Android 9 in August 2018.
  static int get p => Build$VersionCodesChannel.instance.p;

  /// Q.
  ///
  /// Released publicly as Android 10 in September 2019.
  static int get q => Build$VersionCodesChannel.instance.q;

  /// R.
  ///
  /// Released publicly as Android 11 in September 2020.
  static int get r => Build$VersionCodesChannel.instance.r;

  /// S.
  static int get s => Build$VersionCodesChannel.instance.s;

  /// S V2. Once more unto the breach, dear friends, once more.
  static int get sV2 => Build$VersionCodesChannel.instance.sV2;

  /// Tiramisu.
  static int get tiramisu => Build$VersionCodesChannel.instance.tiramisu;

  /// Upside Down Cake.
  static int get upsideDownCake =>
      Build$VersionCodesChannel.instance.upsideDownCake;

  /// Vanilla Ice Cream.
  static int get vanillaIceCream =>
      Build$VersionCodesChannel.instance.vanillaIceCream;
}

/// Enumeration of the currently known SDK major and minor version codes. The numbers increase for every release, and
/// are guaranteed to be ordered by the release date of each release. The actual values should be considered an
/// implementation detail, and the current encoding scheme may change in the future.
abstract interface class Build$VersionCodesFull {
  /// Android 16.
  static int get baklava => Build$VersionCodesFullChannel.instance.baklava;

  /// Android 16, minor release 1.
  static int get baklava_1 => Build$VersionCodesFullChannel.instance.baklava_1;

  /// Android 1.0.
  static int get base => Build$VersionCodesFullChannel.instance.base;

  /// Android 1.1.
  static int get base_1_1 => Build$VersionCodesFullChannel.instance.base_1_1;

  /// Android 1.5.
  static int get cupcake => Build$VersionCodesFullChannel.instance.cupcake;

  /// Android 1.6.
  static int get donut => Build$VersionCodesFullChannel.instance.donut;

  /// Android 2.0.
  static int get eclair => Build$VersionCodesFullChannel.instance.eclair;

  /// Android 2.0.1.
  static int get eclair_0_1 =>
      Build$VersionCodesFullChannel.instance.eclair_0_1;

  /// Android 2.1.x.
  static int get eclairMr1 => Build$VersionCodesFullChannel.instance.eclairMr1;

  /// Android 2.2.x.
  static int get froyo => Build$VersionCodesFullChannel.instance.froyo;

  /// Android 2.3.0-2.
  static int get gingerbread =>
      Build$VersionCodesFullChannel.instance.gingerbread;

  /// Android 2.3.3-4.
  static int get gingerbreadMr1 =>
      Build$VersionCodesFullChannel.instance.gingerbreadMr1;

  /// Android 3.0.x.
  static int get honeycomb => Build$VersionCodesFullChannel.instance.honeycomb;

  /// Android 3.1.x.
  static int get honeycombMr1 =>
      Build$VersionCodesFullChannel.instance.honeycombMr1;

  /// Android 3.2.
  static int get honeycombMr2 =>
      Build$VersionCodesFullChannel.instance.honeycombMr2;

  /// Android 4.0.0-2.
  static int get iceCreamSandwich =>
      Build$VersionCodesFullChannel.instance.iceCreamSandwich;

  /// Android 4.0.3-4.
  static int get iceCreamSandwichMr1 =>
      Build$VersionCodesFullChannel.instance.iceCreamSandwichMr1;

  /// Android 4.1.0-1.
  static int get jellyBean => Build$VersionCodesFullChannel.instance.jellyBean;

  /// Android 4.2.0-2.
  static int get jellyBeanMr1 =>
      Build$VersionCodesFullChannel.instance.jellyBeanMr1;

  /// Android 4.3.
  static int get jellyBeanMr2 =>
      Build$VersionCodesFullChannel.instance.jellyBeanMr2;

  /// Android 4.4.
  static int get kitkat => Build$VersionCodesFullChannel.instance.kitkat;

  /// Android 4.4W.
  static int get kitkatWatch =>
      Build$VersionCodesFullChannel.instance.kitkatWatch;

  /// Android 5.0.
  static int get lollipop => Build$VersionCodesFullChannel.instance.lollipop;

  /// Android 5.1.
  static int get lollipopMr1 =>
      Build$VersionCodesFullChannel.instance.lollipopMr1;

  /// Android 6.0.
  static int get m => Build$VersionCodesFullChannel.instance.m;

  /// Android 7.0.
  static int get n => Build$VersionCodesFullChannel.instance.n;

  /// Android 7.1.0-1.
  static int get nMr1 => Build$VersionCodesFullChannel.instance.nMr1;

  /// Android 8.0.
  static int get o => Build$VersionCodesFullChannel.instance.o;

  /// Android 8.1.
  static int get oMr1 => Build$VersionCodesFullChannel.instance.oMr1;

  /// Android 9.
  static int get p => Build$VersionCodesFullChannel.instance.p;

  /// Android 10.
  static int get q => Build$VersionCodesFullChannel.instance.q;

  /// Android 11.
  static int get r => Build$VersionCodesFullChannel.instance.r;

  /// Android 12.
  static int get s => Build$VersionCodesFullChannel.instance.s;

  /// Android 12v2.
  static int get sV2 => Build$VersionCodesFullChannel.instance.sV2;

  /// Android 13.
  static int get tiramisu => Build$VersionCodesFullChannel.instance.tiramisu;

  /// Android 14.
  static int get upsideDownCake =>
      Build$VersionCodesFullChannel.instance.upsideDownCake;

  /// Android 15.
  static int get vanillaIceCream =>
      Build$VersionCodesFullChannel.instance.vanillaIceCream;
}

/// Information about the current build, extracted from system properties.
abstract interface class Build {
  /// The name of the underlying board, like "goldfish".
  static String get board => BuildChannel.instance.board;

  /// The system bootloader version number.
  static String get bootloader => BuildChannel.instance.bootloader;

  /// The consumer-visible brand with which the product/hardware will be associated, if any.
  static String get brand => BuildChannel.instance.brand;

  /// The name of the instruction set (CPU type + ABI convention) of native code.
  @Deprecated('Use SUPPORTED_ABIS instead.')
  static String get cpuAbi => BuildChannel.instance.cpuAbi;

  /// The name of the second instruction set (CPU type + ABI convention) of native code.
  @Deprecated('Use SUPPORTED_ABIS instead.')
  static String get cpuAbi2 => BuildChannel.instance.cpuAbi2;

  /// The name of the industrial design.
  static String get device => BuildChannel.instance.device;

  /// A build ID string meant for displaying to the user
  static String get display => BuildChannel.instance.display;

  /// A string that uniquely identifies this build. Do not attempt to parse this value.
  static String get fingerprint => BuildChannel.instance.fingerprint;

  /// Get build information about partitions that have a separate fingerprint defined. The list includes partitions that are
  /// suitable candidates for over-the-air updates. This is not an exhaustive list of partitions on the device.
  static List<Build$Partition> get fingerprintedPartitions =>
      BuildChannel.instance.fingerprintedPartitions;

  /// The name of the hardware (from the kernel command line or /proc).
  static String get hardware => BuildChannel.instance.hardware;

  /// TODO: host
  static String get host => BuildChannel.instance.host;

  /// Either a changelist number, or a label like "M4-rc20".
  static String get id => BuildChannel.instance.id;

  /// The manufacturer of the product/hardware.
  static String get manufacturer => BuildChannel.instance.manufacturer;

  /// The end-user-visible name for the end product.
  static String get model => BuildChannel.instance.model;

  /// The SKU of the device as set by the original design manufacturer (ODM).
  ///
  /// This is a runtime-initialized property set during startup to configure device services. If no value is set, this is reported
  /// as UNKNOWN.
  ///
  /// The ODM SKU may have multiple variants for the same system SKU in case a manufacturer produces variants of the
  /// same design. For example, the same build may be released with variations in physical keyboard and/or display
  /// hardware, each with a different ODM SKU.
  static String get odmSku => BuildChannel.instance.odmSku;

  /// The name of the overall product.
  static String get product => BuildChannel.instance.product;

  /// The radio firmware version number.
  @Deprecated(
    'The radio firmware version is frequently not available when this class is initialized, leading to a blank or "unknown" value for this string. Use getRadioVersion instead.',
  )
  static String get radio => BuildChannel.instance.radio;

  /// Returns the version string for the radio firmware. May return null (if, for instance, the radio is not currently on).
  static String? get radioVersion => BuildChannel.instance.radioVersion;

  /// A hardware serial number, if available. Alphanumeric only, case-insensitive. This field is always set to Build.UNKNOWN.
  ///
  /// Requires android.Manifest.permission.READ_PRIVILEGED_PHONE_STATE
  static String get serial => BuildChannel.instance.serial;

  /// The SKU of the hardware (from the kernel command line).
  ///
  /// The SKU is reported by the bootloader to configure system software features. If no value is supplied by the
  /// bootloader, this is reported as UNKNOWN.
  static String get sku => BuildChannel.instance.sku;

  /// The manufacturer of the device's primary system-on-chip.
  static String get socManufacturer => BuildChannel.instance.socManufacturer;

  /// The model name of the device's primary system-on-chip.
  static String get socModel => BuildChannel.instance.socModel;

  /// An ordered list of 32 bit ABIs supported by this device. The most preferred ABI is the first element in the list. See
  /// SUPPORTED_ABIS and SUPPORTED_64_BIT_ABIS.
  static List<String> get supported32BitAbis =>
      BuildChannel.instance.supported32BitAbis;

  /// An ordered list of 64 bit ABIs supported by this device. The most preferred ABI is the first element in the list. See
  /// SUPPORTED_ABIS and SUPPORTED_32_BIT_ABIS.
  static List<String> get supported64BitAbis =>
      BuildChannel.instance.supported64BitAbis;

  /// An ordered list of ABIs supported by this device. The most preferred ABI is the first element in the list. See
  /// SUPPORTED_32_BIT_ABIS and SUPPORTED_64_BIT_ABIS.
  static List<String> get supportedAbis => BuildChannel.instance.supportedAbis;

  /// Comma-separated tags describing the build, like "unsigned,debug".
  static String get tags => BuildChannel.instance.tags;

  /// The time at which the build was produced, given in milliseconds since the UNIX epoch.
  static int get time => BuildChannel.instance.time;

  /// The type of build, like "user" or "eng".
  static String get type => BuildChannel.instance.type;

  /// TODO: user
  static String get user => BuildChannel.instance.user;

  /// The status of the backported fix for a known issue on this device.
  ///
  /// [id] The id of the known issue to check.
  static Build$BackportedFixStatus getBackportedFixStatus(int id) =>
      BuildChannel.instance.getBackportedFixStatus(id);

  /// Obtain the major version encoded in a VERSION_CODES_FULL value. This value is guaranteed to be non-negative.
  static int getMajorSdkVersion(int sdkIntFull) =>
      BuildChannel.instance.getMajorSdkVersion(sdkIntFull);

  /// Obtain the minor version encoded in a VERSION_CODES_FULL value. This value is guaranteed to be non-negative.
  static int getMinorSdkVersion(int sdkIntFull) =>
      BuildChannel.instance.getMinorSdkVersion(sdkIntFull);
}

abstract base class Build$PartitionChannel extends PlatformInterface {
  /// Constructs a [Build$PartitionChannel].
  Build$PartitionChannel() : super(token: _token);

  static final Object _token = Object();

  static Build$PartitionChannel? _instance;

  /// The default instance of [Build$PartitionChannel] to use.
  static Build$PartitionChannel get instance =>
      ArgumentError.checkNotNull(_instance, 'instance');

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [Build$PartitionChannel] when
  /// they register themselves.
  static set instance(Build$PartitionChannel instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  String get partitionNameSystem;
}

abstract base class Build$VersionChannel extends PlatformInterface {
  /// Constructs a [Build$VersionChannel].
  Build$VersionChannel() : super(token: _token);

  static final Object _token = Object();

  static Build$VersionChannel? _instance;

  /// The default instance of [Build$VersionChannel] to use.
  static Build$VersionChannel get instance =>
      ArgumentError.checkNotNull(_instance, 'instance');

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [Build$VersionChannel] when
  /// they register themselves.
  static set instance(Build$VersionChannel instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  String get baseOs;
  String get codename;
  String get incremental;
  int get mediaPerformanceClass;
  int get previewSdkInt;
  String get release;
  String get releaseOrCodename;
  String get releaseOrPreviewDisplay;
  String get sdk;
  int get sdkInt;
  int get sdkIntFull;
  String get securityPatch;
}

abstract base class Build$VersionCodesChannel extends PlatformInterface {
  /// Constructs a [Build$VersionCodesChannel].
  Build$VersionCodesChannel() : super(token: _token);

  static final Object _token = Object();

  static Build$VersionCodesChannel? _instance;

  /// The default instance of [Build$VersionCodesChannel] to use.
  static Build$VersionCodesChannel get instance =>
      ArgumentError.checkNotNull(_instance, 'instance');

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [Build$VersionCodesChannel] when
  /// they register themselves.
  static set instance(Build$VersionCodesChannel instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  int get baklava;
  int get base;
  int get base_1_1;
  int get cupcake;
  int get curDevelopment;
  int get donut;
  int get eclair;
  int get eclair_0_1;
  int get eclairMr1;
  int get froyo;
  int get gingerbread;
  int get gingerbreadMr1;
  int get honeycomb;
  int get honeycombMr1;
  int get honeycombMr2;
  int get iceCreamSandwich;
  int get iceCreamSandwichMr1;
  int get jellyBean;
  int get jellyBeanMr1;
  int get jellyBeanMr2;
  int get kitkat;
  int get kitkatWatch;
  int get lollipop;
  int get lollipopMr1;
  int get m;
  int get n;
  int get nMr1;
  int get o;
  int get oMr1;
  int get p;
  int get q;
  int get r;
  int get s;
  int get sV2;
  int get tiramisu;
  int get upsideDownCake;
  int get vanillaIceCream;
}

abstract base class Build$VersionCodesFullChannel extends PlatformInterface {
  /// Constructs a [Build$VersionCodesFullChannel].
  Build$VersionCodesFullChannel() : super(token: _token);

  static final Object _token = Object();

  static Build$VersionCodesFullChannel? _instance;

  /// The default instance of [Build$VersionCodesFullChannel] to use.
  static Build$VersionCodesFullChannel get instance =>
      ArgumentError.checkNotNull(_instance, 'instance');

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [Build$VersionCodesFullChannel] when
  /// they register themselves.
  static set instance(Build$VersionCodesFullChannel instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  int get baklava;
  int get baklava_1;
  int get base;
  int get base_1_1;
  int get cupcake;
  int get donut;
  int get eclair;
  int get eclair_0_1;
  int get eclairMr1;
  int get froyo;
  int get gingerbread;
  int get gingerbreadMr1;
  int get honeycomb;
  int get honeycombMr1;
  int get honeycombMr2;
  int get iceCreamSandwich;
  int get iceCreamSandwichMr1;
  int get jellyBean;
  int get jellyBeanMr1;
  int get jellyBeanMr2;
  int get kitkat;
  int get kitkatWatch;
  int get lollipop;
  int get lollipopMr1;
  int get m;
  int get n;
  int get nMr1;
  int get o;
  int get oMr1;
  int get p;
  int get q;
  int get r;
  int get s;
  int get sV2;
  int get tiramisu;
  int get upsideDownCake;
  int get vanillaIceCream;
}

abstract base class BuildChannel extends PlatformInterface {
  /// Constructs a [BuildChannel].
  BuildChannel() : super(token: _token);

  static final Object _token = Object();

  static BuildChannel? _instance;

  /// The default instance of [BuildChannel] to use.
  static BuildChannel get instance =>
      ArgumentError.checkNotNull(_instance, 'instance');

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [BuildChannel] when
  /// they register themselves.
  static set instance(BuildChannel instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  String get board;
  String get bootloader;
  String get brand;
  String get cpuAbi;
  String get cpuAbi2;
  String get device;
  String get display;
  String get fingerprint;
  List<Build$Partition> get fingerprintedPartitions;
  String get hardware;
  String get host;
  String get id;
  String get manufacturer;
  String get model;
  String get odmSku;
  String get product;
  String get radio;
  String? get radioVersion;
  String get serial;
  String get sku;
  String get socManufacturer;
  String get socModel;
  List<String> get supported32BitAbis;
  List<String> get supported64BitAbis;
  List<String> get supportedAbis;
  String get tags;
  int get time;
  String get type;
  String get user;

  Build$BackportedFixStatus getBackportedFixStatus(int id);
  int getMajorSdkVersion(int sdkIntFull);
  int getMinorSdkVersion(int sdkIntFull);
}
