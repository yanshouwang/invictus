import 'package:invictus_android/src/api.dart';
import 'package:invictus_android/src/impl.dart';
import 'package:invictus_android/src/jni.dart' as jni;

final class NetworkInfo$DetailedStateImpl extends InvictusObjectImpl
    implements NetworkInfo$DetailedState {
  @override
  final jni.NetworkInfo$DetailedState api;

  NetworkInfo$DetailedStateImpl.internal(this.api);
}

final class NetworkInfoImpl extends InvictusObjectImpl implements NetworkInfo {
  @override
  final jni.NetworkInfo api;

  NetworkInfoImpl.internal(this.api);
}

extension Invictus$JNetworkInfo$DetailedStateX
    on jni.NetworkInfo$DetailedState {
  NetworkInfo$DetailedState get impl =>
      NetworkInfo$DetailedStateImpl.internal(this);
}

extension Invictus$JNetworkInfoX on jni.NetworkInfo {
  NetworkInfo get impl => NetworkInfoImpl.internal(this);
}
