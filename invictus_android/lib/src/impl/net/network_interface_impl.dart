import 'dart:typed_data';

import 'package:invictus_android/src/impl.dart';
import 'package:invictus_android/src/jni.dart' as jni;
import 'package:invictus_api/invictus_api.dart';

final class NetworkInterfaceImpl extends ObjectImpl
    implements NetworkInterface {
  @override
  final jni.NetworkInterface api;

  NetworkInterfaceImpl.internal(this.api);

  @override
  String get displayName {
    final displayNameApiOrNull = api.getDisplayName();
    final displayNameApi = ArgumentError.checkNotNull(
      displayNameApiOrNull,
      'displayNameApi',
    );
    return displayNameApi.impl;
  }

  @override
  Uint8List? get hardwareAddress => api.getHardwareAddress()?.impl;

  @override
  int get index => api.getIndex();

  @override
  List<InetAddress> get inetAddresses {
    final inetAddressesApiOrNull = jni.Collections.list(
      api.getInetAddresses(),
      T: jni.InetAddress.type,
    );
    final inetAddressesApi = ArgumentError.checkNotNull(
      inetAddressesApiOrNull,
      'inetAddressesApi',
    );
    return inetAddressesApi
        .as(jni.JList.type(jni.InetAddress.type))
        .map((e) => e.impl)
        .toList();
  }

  @override
  List<InterfaceAddress> get interfaceAddresses {
    final interfaceAddressesApiOrNull = api.getInterfaceAddresses();
    final interfaceAddressesApi = ArgumentError.checkNotNull(
      interfaceAddressesApiOrNull,
      'interfaceAddressesApi',
    );
    return interfaceAddressesApi.nonNulls.map((e) => e.impl).toList();
  }

  @override
  bool get isLoopback => api.isLoopback();

  @override
  bool get isPointToPoint => api.isPointToPoint();

  @override
  bool get isUp => api.isUp();

  @override
  bool get isVirtual => api.isVirtual();

  @override
  int get mtu => api.getMTU();

  @override
  String get name {
    final nameApiOrNull = api.getName();
    final nameApi = ArgumentError.checkNotNull(nameApiOrNull, 'nameApi');
    return nameApi.impl;
  }

  @override
  NetworkInterface? get parent => api.getParent()?.impl;

  @override
  List<NetworkInterface> get subInterfaces {
    final subInterfacesApiOrNull = jni.Collections.list(
      api.getSubInterfaces(),
      T: jni.NetworkInterface.type,
    );
    final subInterfacesApi = ArgumentError.checkNotNull(
      subInterfacesApiOrNull,
      'subInterfacesApi',
    );
    return subInterfacesApi
        .as(jni.JList.type(jni.NetworkInterface.type))
        .map((e) => e.impl)
        .toList();
  }

  @override
  bool get supportsMulticast => api.supportsMulticast();
}

final class NetworkInterfaceChannelImpl extends NetworkInterfaceChannel {
  @override
  NetworkInterface? getByIndex(int index) {
    return jni.NetworkInterface.getByIndex(index)?.impl;
  }

  @override
  NetworkInterface? getByInetAddress(InetAddress addr) {
    return jni.NetworkInterface.getByInetAddress(addr.api)?.impl;
  }

  @override
  NetworkInterface? getByName(String name) {
    return jni.NetworkInterface.getByName(name.api)?.impl;
  }

  @override
  List<NetworkInterface> getNetworkInterfaces() {
    final enumeration = jni.NetworkInterface.getNetworkInterfaces();
    final networkInterfacesApiOrNull = enumeration == null
        ? null
        : jni.Collections.list(enumeration, T: jni.NetworkInterface.type);
    final networkInterfacesApi = ArgumentError.checkNotNull(
      networkInterfacesApiOrNull,
      'networkInterfacesApi',
    );
    return networkInterfacesApi
        .as(jni.JList.type(jni.NetworkInterface.type))
        .map((e) => e.impl)
        .toList();
  }
}

extension Invictus$NetworkInterfaceX on NetworkInterface {
  jni.NetworkInterface get api {
    final impl = this;
    if (impl is! NetworkInterfaceImpl) throw TypeError();
    return impl.api;
  }
}

extension Invictus$JNetworkInterfaceX on jni.NetworkInterface {
  NetworkInterface get impl => NetworkInterfaceImpl.internal(this);
}
