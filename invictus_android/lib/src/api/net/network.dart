import 'package:invictus_android/src/api.dart';
import 'package:invictus_android/src/impl.dart';

abstract interface class Network {
  factory Network.fromNetworkHandle(int networkHandle) =>
      NetworkImpl.fromNetworkHandle(networkHandle);

  int get networkHandle;
  SocketFactory get socketFactory;

  void bindSocket(Socket socket);
  void bindDatagramSocket(DatagramSocket socket);
  void bindFileDescriptor(FileDescriptor fd);
  List<InetAddress> getAllByName(String host);
  InetAddress getByName(String host);
  UrlConnection openConnection(Url url, [Proxy? proxy]);
}
