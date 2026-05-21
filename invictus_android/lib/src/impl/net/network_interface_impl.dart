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
    final displayNameApiOrNull = api.displayName;
    final displayNameApi = ArgumentError.checkNotNull(
      displayNameApiOrNull,
      'displayNameApi',
    );
    return displayNameApi.impl;
  }

  @override
  Uint8List? get hardwareAddress => api.hardwareAddress?.impl;

  @override
  int get index => api.index;

  @override
  List<InetAddress> get inetAddresses {
    final inetAddressesApiOrNull = jni.Collections.list<jni.InetAddress>(
      api.inetAddresses,
    );
    final inetAddressesApi = ArgumentError.checkNotNull(
      inetAddressesApiOrNull,
      'inetAddressesApi',
    );
    return inetAddressesApi.asDart().nonNulls.map((e) => e.impl).toList();
  }

  @override
  List<InterfaceAddress> get interfaceAddresses {
    final interfaceAddressesApiOrNull = api.interfaceAddresses;
    final interfaceAddressesApi = ArgumentError.checkNotNull(
      interfaceAddressesApiOrNull,
      'interfaceAddressesApi',
    );
    return interfaceAddressesApi.asDart().nonNulls.map((e) => e.impl).toList();
  }

  @override
  bool get isLoopback => api.isLoopback;

  @override
  bool get isPointToPoint => api.isPointToPoint;

  @override
  bool get isUp => api.isUp;

  @override
  bool get isVirtual => api.isVirtual;

  @override
  int get mtu => api.mTU;

  @override
  String get name {
    final nameApiOrNull = api.name;
    final nameApi = ArgumentError.checkNotNull(nameApiOrNull, 'nameApi');
    return nameApi.impl;
  }

  @override
  NetworkInterface? get parent => api.parent?.impl;

  @override
  List<NetworkInterface> get subInterfaces {
    final subInterfacesApiOrNull = jni.Collections.list<jni.NetworkInterface>(
      api.subInterfaces,
    );
    final subInterfacesApi = ArgumentError.checkNotNull(
      subInterfacesApiOrNull,
      'subInterfacesApi',
    );
    return subInterfacesApi.asDart().nonNulls.map((e) => e.impl).toList();
  }

  @override
  bool get supportsMulticast => api.supportsMulticast();
}

final class NetworkInterfaceChannelImpl extends NetworkInterfaceChannel {
  @override
  List<NetworkInterface> getNetworkInterfaces() {
    final enumeration = jni.NetworkInterface.networkInterfaces;
    final networkInterfacesApiOrNull = enumeration == null
        ? null
        : jni.Collections.list<jni.NetworkInterface>(enumeration);
    final networkInterfacesApi = ArgumentError.checkNotNull(
      networkInterfacesApiOrNull,
      'networkInterfacesApi',
    );
    return networkInterfacesApi.asDart().nonNulls.map((e) => e.impl).toList();
  }

  @override
  NetworkInterface? getByIndex(int index) =>
      jni.NetworkInterface.getByIndex(index)?.impl;

  @override
  NetworkInterface? getByInetAddress(InetAddress addr) =>
      jni.NetworkInterface.getByInetAddress(addr.api)?.impl;

  @override
  NetworkInterface? getByName(String name) =>
      jni.NetworkInterface.getByName(name.api)?.impl;
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
