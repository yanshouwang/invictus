import 'package:invictus_android/src/jni.dart' as jni;
import 'package:invictus_api/invictus_api.dart';

final class UsbConstantsChannelImpl extends UsbConstantsChannel {
  @override
  int get usbClassAppSpec => jni.UsbConstants.USB_CLASS_APP_SPEC;

  @override
  int get usbClassAudio => jni.UsbConstants.USB_CLASS_AUDIO;

  @override
  int get usbClassCdcData => jni.UsbConstants.USB_CLASS_CDC_DATA;

  @override
  int get usbClassComm => jni.UsbConstants.USB_CLASS_COMM;

  @override
  int get usbClassContentSec => jni.UsbConstants.USB_CLASS_CONTENT_SEC;

  @override
  int get usbClassCscid => jni.UsbConstants.USB_CLASS_CSCID;

  @override
  int get usbClassHid => jni.UsbConstants.USB_CLASS_HID;

  @override
  int get usbClassHub => jni.UsbConstants.USB_CLASS_HUB;

  @override
  int get usbClassMassStorage => jni.UsbConstants.USB_CLASS_MASS_STORAGE;

  @override
  int get usbClassMisc => jni.UsbConstants.USB_CLASS_MISC;

  @override
  int get usbClassPerInterface => jni.UsbConstants.USB_CLASS_PER_INTERFACE;

  @override
  int get usbClassPhysica => jni.UsbConstants.USB_CLASS_PHYSICA;

  @override
  int get usbClassPrinter => jni.UsbConstants.USB_CLASS_PRINTER;

  @override
  int get usbClassStillImage => jni.UsbConstants.USB_CLASS_STILL_IMAGE;

  @override
  int get usbClassVendorSpec => jni.UsbConstants.USB_CLASS_VENDOR_SPEC;

  @override
  int get usbClassVideo => jni.UsbConstants.USB_CLASS_VIDEO;

  @override
  int get usbClassWirelessController =>
      jni.UsbConstants.USB_CLASS_WIRELESS_CONTROLLER;

  @override
  int get usbInterfaceSubclassBoot =>
      jni.UsbConstants.USB_INTERFACE_SUBCLASS_BOOT;

  @override
  int get usbSubclassVendorSpec => jni.UsbConstants.USB_SUBCLASS_VENDOR_SPEC;

  @override
  int get usbTypeClass => jni.UsbConstants.USB_TYPE_CLASS;

  @override
  int get usbTypeMask => jni.UsbConstants.USB_TYPE_MASK;

  @override
  int get usbTypeReserved => jni.UsbConstants.USB_TYPE_RESERVED;

  @override
  int get usbTypeStandard => jni.UsbConstants.USB_TYPE_STANDARD;

  @override
  int get usbTypeVendor => jni.UsbConstants.USB_TYPE_VENDOR;
}

extension Invictus$JUsbConstants$intX on int {
  UsbDir get usbDirImpl {
    final api = this;
    switch (api) {
      case jni.UsbConstants.USB_DIR_OUT:
        return UsbDir.out;
      case jni.UsbConstants.USB_DIR_IN:
        return UsbDir.$in;
      default:
        throw ArgumentError.value(api, 'api');
    }
  }

  UsbEndpointXfer get usbEndpointXferImpl {
    final api = this;
    switch (api) {
      case jni.UsbConstants.USB_ENDPOINT_XFER_CONTROL:
        return UsbEndpointXfer.control;
      case jni.UsbConstants.USB_ENDPOINT_XFER_ISOC:
        return UsbEndpointXfer.isoc;
      case jni.UsbConstants.USB_ENDPOINT_XFER_BULK:
        return UsbEndpointXfer.bulk;
      case jni.UsbConstants.USB_ENDPOINT_XFER_INT:
        return UsbEndpointXfer.int;
      default:
        throw ArgumentError.value(api, 'api');
    }
  }
}
