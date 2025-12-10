import 'package:invictus_android/src/api.dart';
import 'package:invictus_android/src/impl.dart';

abstract interface class NetworkRequest {
  factory NetworkRequest({
    List<NetworkCapabilities$NetCapability>? capabilities,
    List<NetworkCapabilities$Transport>? transportTypes,
    bool? includeOtherUidNetworks,
    NetworkSpecifier? networkSpecifier,
    Set<int>? subIds,
  }) => NetworkRequestImpl(
    capabilities: capabilities,
    transportTypes: transportTypes,
    includeOtherUidNetworks: includeOtherUidNetworks,
    networkSpecifier: networkSpecifier,
    subIds: subIds,
  );

  List<NetworkCapabilities$NetCapability> get capabilities;
  NetworkSpecifier? get networkSpecifier;
  Set<int> get subscriptionIds;
  List<NetworkCapabilities$Transport> get transportTypes;

  bool canBeSatisfiedBy(NetworkCapabilities nc);
  bool hasCapability(NetworkCapabilities$NetCapability capability);
  bool hasTransport(NetworkCapabilities$Transport transportType);
}
