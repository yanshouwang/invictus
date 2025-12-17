import 'package:invictus_android/src/impl.dart';
import 'package:invictus_android/src/jni.dart' as jni;
import 'package:invictus_api/invictus_api.dart';

final class NetworkImpl extends InvictusObjectImpl implements Network {
  @override
  final jni.Network api;

  NetworkImpl.internal(this.api);

  @override
  int get networkHandle => api.getNetworkHandle();

  @override
  SocketFactory get socketFactory {
    final socketFactoryApiOrNull = api.getSocketFactory();
    final socketFactoryApi = ArgumentError.checkNotNull(
      socketFactoryApiOrNull,
      'socketFactoryApi',
    );
    return socketFactoryApi.impl;
  }

  @override
  void bindSocket(Socket socket) => api.bindSocket$2(socket.api);

  @override
  void bindDatagramSocket(DatagramSocket socket) =>
      api.bindSocket$1(socket.api);

  @override
  void bindFileDescriptor(FileDescriptor fd) => api.bindSocket(fd.api);

  @override
  List<InetAddress> getAllByName(String host) {
    final allApiOrNull = api.getAllByName(host.api);
    final allApi = ArgumentError.checkNotNull(allApiOrNull, 'allApi');
    return allApi.nonNulls.map((e) => e.impl).toList();
  }

  @override
  InetAddress getByName(String host) {
    final inetAddressApiOrNull = api.getByName(host.api);
    final inetAddressApi = ArgumentError.checkNotNull(
      inetAddressApiOrNull,
      'inetAddressApi',
    );
    return inetAddressApi.impl;
  }

  @override
  UrlConnection openConnection(Url url, [Proxy? proxy]) {
    final connectionApiOrNull = proxy == null
        ? api.openConnection(url.api)
        : api.openConnection$1(url.api, proxy.api);
    final connectionApi = ArgumentError.checkNotNull(
      connectionApiOrNull,
      'connectionApi',
    );
    return connectionApi.impl;
  }
}

final class NetworkChannelImpl extends NetworkChannel {
  @override
  Network createFromNetworkHandle(int networkHandle) {
    final apiOrNull = jni.Network.fromNetworkHandle(networkHandle);
    final api = ArgumentError.checkNotNull(apiOrNull, 'api');
    return NetworkImpl.internal(api);
  }
}

extension Invictus$NetworkX on Network {
  jni.Network get api {
    final impl = this;
    if (impl is! NetworkImpl) throw TypeError();
    return impl.api;
  }
}

extension Invictus$JNetworkX on jni.Network {
  Network get impl => NetworkImpl.internal(this);
}
