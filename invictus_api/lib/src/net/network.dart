import 'package:invictus_api/invictus_api.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

abstract interface class Network {
  factory Network.fromNetworkHandle(int networkHandle) =>
      NetworkChannel.instance.createFromNetworkHandle(networkHandle);

  int get networkHandle;
  SocketFactory get socketFactory;

  void bindSocket(Socket socket);
  void bindDatagramSocket(DatagramSocket socket);
  void bindFileDescriptor(FileDescriptor fd);
  List<InetAddress> getAllByName(String host);
  InetAddress getByName(String host);
  UrlConnection openConnection(Url url, [Proxy? proxy]);
}

abstract base class NetworkChannel extends PlatformInterface {
  /// Constructs a [NetworkChannel].
  NetworkChannel() : super(token: _token);

  static final Object _token = Object();

  static NetworkChannel? _instance;

  /// The default instance of [NetworkChannel] to use.
  static NetworkChannel get instance =>
      ArgumentError.checkNotNull(_instance, 'instance');

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [NetworkChannel] when
  /// they register themselves.
  static set instance(NetworkChannel instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Network createFromNetworkHandle(int networkHandle);
}
