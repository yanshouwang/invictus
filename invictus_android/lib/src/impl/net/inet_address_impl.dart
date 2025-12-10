import 'dart:typed_data';

import 'package:invictus_android/src/api.dart';
import 'package:invictus_android/src/impl.dart';
import 'package:invictus_android/src/jni.dart' as jni;

abstract base class InetAddressImpl implements InetAddress {
  static List<InetAddress> getAllByName(String? host) {
    final allApiOrNull = jni.InetAddress.getAllByName(host?.api);
    final allApi = ArgumentError.checkNotNull(allApiOrNull, 'allApi');
    return allApi.nonNulls.map((e) => e.impl).toList();
  }

  static InetAddress getByAddress({String? host, required Uint8List addr}) {
    final apiOrNull = host == null
        ? jni.InetAddress.getByAddress(addr.api)
        : jni.InetAddress.getByAddress$1(host.api, addr.api);
    final api = ArgumentError.checkNotNull(apiOrNull, 'api');
    return api.impl;
  }

  static InetAddress getByName(String? host) {
    final apiOrNull = jni.InetAddress.getByName(host?.api);
    final api = ArgumentError.checkNotNull(apiOrNull, 'api');
    return api.impl;
  }

  static InetAddress getLocalHost() {
    final apiOrNull = jni.InetAddress.getLocalHost();
    final api = ArgumentError.checkNotNull(apiOrNull, 'api');
    return api.impl;
  }

  static InetAddress getLoopbackAddress() {
    final apiOrNull = jni.InetAddress.getLoopbackAddress();
    final api = ArgumentError.checkNotNull(apiOrNull, 'api');
    return api.impl;
  }

  jni.InetAddress get api;

  @override
  Uint8List get address {
    final addressApiOrNull = api.getAddress();
    final addressApi = ArgumentError.checkNotNull(
      addressApiOrNull,
      'addressApi',
    );
    return addressApi.impl;
  }

  @override
  String get canonicalHostName {
    final canonicalHostNameApiOrNull = api.getCanonicalHostName();
    final canonicalHostNameApi = ArgumentError.checkNotNull(
      canonicalHostNameApiOrNull,
      'canonicalHostNameApi',
    );
    return canonicalHostNameApi.impl;
  }

  @override
  String? get hostAddress => api.getHostAddress()?.impl;

  @override
  String get hostName {
    final hostNameApiOrNull = api.getHostName();
    final hostNameApi = ArgumentError.checkNotNull(
      hostNameApiOrNull,
      'hostNameApi',
    );
    return hostNameApi.impl;
  }

  @override
  bool get isAnyLocalAddress => api.isAnyLocalAddress();

  @override
  bool get isLinkLocalAddress => api.isLinkLocalAddress();

  @override
  bool get isLoopbackAddress => api.isLoopbackAddress();

  @override
  bool get isMulticastAddress => api.isMulticastAddress();

  @override
  bool get isSiteLocalAddress => api.isSiteLocalAddress();

  @override
  bool get isMcGlobal => api.isMCGlobal();

  @override
  bool get isMcLinkLocal => api.isMCLinkLocal();

  @override
  bool get isMcNodeLocal => api.isMCNodeLocal();

  @override
  bool get isMcOrgLocal => api.isMCOrgLocal();

  @override
  bool get isMcSiteLocal => api.isMCSiteLocal();

  @override
  bool isReachableWithTimeout(int timeout) => api.isReachable(timeout);

  @override
  bool isReachableWithNetworkTtlTimeout({
    NetworkInterface? netif,
    required int ttl,
    required int timetout,
  }) => api.isReachable$1(netif?.api, ttl, timetout);
}

extension Invictus$InetAddressX on InetAddress {
  jni.InetAddress get api {
    final impl = this;
    if (impl is! InetAddressImpl) throw TypeError();
    return impl.api;
  }
}

extension Invictus$JInetAddressX on jni.InetAddress {
  InetAddress get impl {
    final api = this;
    final isInet4Address = api.isInstanceOf(jni.Inet4Address.type.jClass);
    if (isInet4Address) {
      final inet4AddressApi = api.as(jni.Inet4Address.type);
      return Inet4AddressImpl.internal(inet4AddressApi);
    }
    final isInet6Address = api.isInstanceOf(jni.Inet6Address.type.jClass);
    if (isInet6Address) {
      final inet6AddressApi = api.as(jni.Inet6Address.type);
      return Inet6AddressImpl.internal(inet6AddressApi);
    }
    throw TypeError();
  }
}
