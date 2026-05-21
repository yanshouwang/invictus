import 'package:invictus_android/src/impl.dart';
import 'package:invictus_android/src/jni.dart' as jni;
import 'package:invictus_api/invictus_api.dart';

final class UsbEndpointImpl extends ObjectImpl implements UsbEndpoint {
  @override
  final jni.UsbEndpoint api;

  UsbEndpointImpl.internal(this.api);

  @override
  int get address => api.address;

  @override
  int get attributes => api.attributes;

  @override
  UsbDir get direction => api.direction.usbDirImpl;

  @override
  int get endpointNumber => api.endpointNumber;

  @override
  int get interval => api.interval;

  @override
  int get maxPacketSize => api.maxPacketSize;

  @override
  UsbEndpointXfer get type => api.type$1.usbEndpointXferImpl;
}

extension Invictus$UsbEndpointX on UsbEndpoint {
  jni.UsbEndpoint get api {
    final impl = this;
    if (impl is! UsbEndpointImpl) throw TypeError();
    return impl.api;
  }
}

extension Invictus$JUsbEndpointX on jni.UsbEndpoint {
  UsbEndpoint get impl => UsbEndpointImpl.internal(this);
}
