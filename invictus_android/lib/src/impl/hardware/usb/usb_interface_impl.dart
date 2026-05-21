import 'package:invictus_android/src/impl.dart';
import 'package:invictus_android/src/jni.dart' as jni;
import 'package:invictus_api/invictus_api.dart';

final class UsbInterfaceImpl extends ObjectImpl implements UsbInterface {
  @override
  final jni.UsbInterface api;

  UsbInterfaceImpl.internal(this.api);

  @override
  int get alternateSetting => api.alternateSetting;

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
  int get endpointCount => api.endpointCount;

  @override
  int get id => api.id;

  @override
  int get interfaceClass => api.interfaceClass;

  @override
  int get interfaceProtocol => api.interfaceProtocol;

  @override
  int get interfaceSubclass => api.interfaceSubclass;

  @override
  String? get name => api.name?.impl;
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
