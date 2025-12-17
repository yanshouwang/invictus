import 'package:invictus_api/invictus_api.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

abstract interface class NetworkRequest {
  factory NetworkRequest({
    List<NetworkCapabilities$NetCapability>? capabilities,
    List<NetworkCapabilities$Transport>? transportTypes,
    bool? includeOtherUidNetworks,
    NetworkSpecifier? networkSpecifier,
    Set<int>? subIds,
  }) => NetworkRequestChannel.instance.create(
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

abstract base class NetworkRequestChannel extends PlatformInterface {
  /// Constructs a [NetworkRequestChannel].
  NetworkRequestChannel() : super(token: _token);

  static final Object _token = Object();

  static NetworkRequestChannel? _instance;

  /// The default instance of [NetworkRequestChannel] to use.
  static NetworkRequestChannel get instance =>
      ArgumentError.checkNotNull(_instance, 'instance');

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [NetworkRequestChannel] when
  /// they register themselves.
  static set instance(NetworkRequestChannel instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  NetworkRequest create({
    List<NetworkCapabilities$NetCapability>? capabilities,
    List<NetworkCapabilities$Transport>? transportTypes,
    bool? includeOtherUidNetworks,
    NetworkSpecifier? networkSpecifier,
    Set<int>? subIds,
  });
}
