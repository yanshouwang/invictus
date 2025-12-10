import 'package:invictus_android/src/api.dart';

enum RouteInfo$RTN { rtnUnicast, rtnUnreachable, rtnThrow }

abstract interface class RouteInfo {
  IpPrefix get destination;
  InetAddress? get gateway;
  bool get hasGateway;
  String? get interface;
  bool get isDefaultRoute;
  RouteInfo$RTN get type;

  bool matches(InetAddress destination);
}
