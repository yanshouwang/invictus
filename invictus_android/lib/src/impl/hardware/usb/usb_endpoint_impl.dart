import 'package:invictus_android/src/impl.dart';
import 'package:invictus_android/src/jni.dart' as jni;
import 'package:invictus_api/invictus_api.dart';

final class UsbEndpointImpl extends ObjectImpl implements UsbEndpoint {
  @override
  final jni.UsbEndpoint api;

  UsbEndpointImpl.internal(this.api);

  @override
  int get address => api.getAddress();

  @override
  int get attributes => api.getAttributes();

  @override
  UsbDir get direction => api.getDirection().usbDirImpl;

  @override
  int get endpointNumber => api.getEndpointNumber();

  @override
  int get interval => api.getInterval();

  @override
  int get maxPacketSize => api.getMaxPacketSize();

  @override
  UsbEndpointXfer get type => api.getType().usbEndpointXferImpl;
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
