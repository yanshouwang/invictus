import 'package:invictus_android/src/impl.dart';
import 'package:invictus_android/src/jni.dart' as jni;
import 'package:invictus_api/invictus_api.dart';

final class UsbInterfaceImpl extends ObjectImpl implements UsbInterface {
  @override
  final jni.UsbInterface api;

  UsbInterfaceImpl.internal(this.api);

  @override
  int get alternateSetting => api.getAlternateSetting();

  @override
  UsbEndpoint getEndpoint(int index) {
    final endpointApiOrNull = api.getEndpoint(index);
    final endpointApi = ArgumentError.checkNotNull(
      endpointApiOrNull,
      'endpointApi',
    );
    return endpointApi.impl;
  }

  @override
  int get endpointCount => api.getEndpointCount();

  @override
  int get id => api.getId();

  @override
  int get interfaceClass => api.getInterfaceClass();

  @override
  int get interfaceProtocol => api.getInterfaceProtocol();

  @override
  int get interfaceSubclass => api.getInterfaceSubclass();

  @override
  String? get name => api.getName()?.impl;
}

extension Invictus$UsbInterfaceX on UsbInterface {
  jni.UsbInterface get api {
    final impl = this;
    if (impl is! UsbInterfaceImpl) throw TypeError();
    return impl.api;
  }
}

extension Invictus$JUsbInterfaceX on jni.UsbInterface {
  UsbInterface get impl => UsbInterfaceImpl.internal(this);
}
