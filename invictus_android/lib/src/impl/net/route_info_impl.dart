import 'package:invictus_android/src/api.dart';
import 'package:invictus_android/src/impl.dart';
import 'package:invictus_android/src/jni.dart' as jni;

final class RouteInfoImpl implements RouteInfo {
  final jni.RouteInfo api;

  RouteInfoImpl.internal(this.api);

  @override
  IpPrefix get destination => api.getDestination().impl;

  @override
  InetAddress? get gateway => api.getGateway()?.impl;

  @override
  bool get hasGateway => api.hasGateway();

  @override
  String? get interface => api.getInterface()?.impl;

  @override
  bool get isDefaultRoute => api.isDefaultRoute();

  @override
  RouteInfo$RTN get type => api.getType().routeInfoRtnImpl;

  @override
  bool matches(InetAddress destination) => api.matches(destination.api);
}

extension Invictus$JRouteInfo$intX on int {
  RouteInfo$RTN get routeInfoRtnImpl {
    final api = this;
    switch (api) {
      case jni.RouteInfo.RTN_UNICAST:
        return RouteInfo$RTN.rtnUnicast;
      case jni.RouteInfo.RTN_UNREACHABLE:
        return RouteInfo$RTN.rtnUnreachable;
      case jni.RouteInfo.RTN_THROW:
        return RouteInfo$RTN.rtnThrow;
      default:
        throw ArgumentError.value(api, 'api');
    }
  }
}

extension Invictus$RouteInfoX on RouteInfo {
  jni.RouteInfo get api {
    final impl = this;
    if (impl is! RouteInfoImpl) throw TypeError();
    return impl.api;
  }
}

extension Invictus$JRouteInfoX on jni.RouteInfo {
  RouteInfo get impl => RouteInfoImpl.internal(this);
}
