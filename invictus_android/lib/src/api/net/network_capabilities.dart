import 'package:invictus_android/src/api.dart';

enum NetworkCapabilities$NetCapability {
  mms,
  supl,
  dun,
  fota,
  ims,
  cbs,
  wifiP2p,
  ia,
  rcs,
  xcap,
  eims,
  notMetered,
  internet,
  notRestricted,
  trusted,
  notVpn,
  validated,
  captivePortal,
  notRoaming,
  foreground,
  notCongested,
  notSuspended,
  mcx,
  temporarilyNotMetered,
  enterprise,
  headUnit,
  mmtel,
  prioritizeLatency,
  prioritizeBandwidth,
  localNetwork,
  notBandwidthConstrained,
}

enum NetworkCapabilities$Transport {
  cellular,
  wifi,
  bluetooth,
  ethernet,
  vpn,
  wifiAware,
  lowpan,
  usb,
  thread,
  satellite,
}

abstract interface class NetworkCapabilities {
  List<NetworkCapabilities$NetCapability> get capabilities;
  List<int> get enterpriseIds;
  int get linkDownstreamBandwidthKbps;
  int get linkUpstreamBandwidthKbps;
  NetworkSpecifier? get networkSpecifier;
  int get ownerUid;
  int get signalStrength;
  Set<int> get subscriptionIds;
  TransportInfo? get transportInfo;
  bool hasCapability(NetworkCapabilities$NetCapability capability);
  bool hasEnterpriseId(int enterpriseId);
  bool hasTransport(NetworkCapabilities$Transport transportType);
}
