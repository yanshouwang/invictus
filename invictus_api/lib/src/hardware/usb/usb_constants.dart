import 'package:plugin_platform_interface/plugin_platform_interface.dart';

enum UsbDir {
  out, // 0
  $in, // 128
}

enum UsbEndpointXfer {
  control, // 0
  isoc, // 1
  bulk, // 2
  int, // 3
}

abstract interface class UsbConstants {
  static int get usbClassAppSpec =>
      UsbConstantsChannel.instance.usbClassAppSpec;
  static int get usbClassAudio => UsbConstantsChannel.instance.usbClassAudio;
  static int get usbClassCdcData =>
      UsbConstantsChannel.instance.usbClassCdcData;
  static int get usbClassComm => UsbConstantsChannel.instance.usbClassComm;
  static int get usbClassContentSec =>
      UsbConstantsChannel.instance.usbClassContentSec;
  static int get usbClassCscid => UsbConstantsChannel.instance.usbClassCscid;
  static int get usbClassHid => UsbConstantsChannel.instance.usbClassHid;
  static int get usbClassHub => UsbConstantsChannel.instance.usbClassHub;
  static int get usbClassMassStorage =>
      UsbConstantsChannel.instance.usbClassMassStorage;
  static int get usbClassMisc => UsbConstantsChannel.instance.usbClassMisc;
  static int get usbClassPerInterface =>
      UsbConstantsChannel.instance.usbClassPerInterface;
  static int get usbClassPhysica =>
      UsbConstantsChannel.instance.usbClassPhysica;
  static int get usbClassPrinter =>
      UsbConstantsChannel.instance.usbClassPrinter;
  static int get usbClassStillImage =>
      UsbConstantsChannel.instance.usbClassStillImage;
  static int get usbClassVendorSpec =>
      UsbConstantsChannel.instance.usbClassVendorSpec;
  static int get usbClassVideo => UsbConstantsChannel.instance.usbClassVideo;
  static int get usbClassWirelessController =>
      UsbConstantsChannel.instance.usbClassWirelessController;
  static int get usbInterfaceSubclassBoot =>
      UsbConstantsChannel.instance.usbInterfaceSubclassBoot;
  static int get usbSubclassVendorSpec =>
      UsbConstantsChannel.instance.usbSubclassVendorSpec;
  static int get usbTypeClass => UsbConstantsChannel.instance.usbTypeClass;
  static int get usbTypeMask => UsbConstantsChannel.instance.usbTypeMask;
  static int get usbTypeReserved =>
      UsbConstantsChannel.instance.usbTypeReserved;
  static int get usbTypeStandard =>
      UsbConstantsChannel.instance.usbTypeStandard;
  static int get usbTypeVendor => UsbConstantsChannel.instance.usbTypeVendor;
}

abstract base class UsbConstantsChannel extends PlatformInterface {
  /// Constructs a [UsbConstantsChannel].
  UsbConstantsChannel() : super(token: _token);

  static final Object _token = Object();

  static UsbConstantsChannel? _instance;

  /// The default instance of [UsbConstantsChannel] to use.
  static UsbConstantsChannel get instance =>
      ArgumentError.checkNotNull(_instance, 'instance');

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [UsbConstantsChannel] when
  /// they register themselves.
  static set instance(UsbConstantsChannel instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  int get usbClassAppSpec;
  int get usbClassAudio;
  int get usbClassCdcData;
  int get usbClassComm;
  int get usbClassContentSec;
  int get usbClassCscid;
  int get usbClassHid;
  int get usbClassHub;
  int get usbClassMassStorage;
  int get usbClassMisc;
  int get usbClassPerInterface;
  int get usbClassPhysica;
  int get usbClassPrinter;
  int get usbClassStillImage;
  int get usbClassVendorSpec;
  int get usbClassVideo;
  int get usbClassWirelessController;
  int get usbInterfaceSubclassBoot;
  int get usbSubclassVendorSpec;
  int get usbTypeClass;
  int get usbTypeMask;
  int get usbTypeReserved;
  int get usbTypeStandard;
  int get usbTypeVendor;
}
