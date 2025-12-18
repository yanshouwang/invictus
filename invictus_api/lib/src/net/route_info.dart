import 'package:invictus_api/src/net.dart';

enum RouteInfo$RTN { unicast, unreachable, $throw }

abstract interface class RouteInfo {
  IpPrefix get destination;
  InetAddress? get gateway;
  bool get hasGateway;
  String? get interface;
  bool get isDefaultRoute;
  RouteInfo$RTN get type;

  bool matches(InetAddress destination);
}
