import 'package:invictus_android/src/impl.dart';
import 'package:invictus_android/src/jni.dart' as jni;
import 'package:invictus_api/invictus_api.dart';

final class InetAddressesImpl extends ObjectImpl implements InetAddresses {
  @override
  final jni.InetAddresses api;

  InetAddressesImpl.internal(this.api);
}

final class InetAddressesChannelImpl extends InetAddressesChannel {
  @override
  bool isNumericAddress(String address) =>
      jni.InetAddresses.isNumericAddress(address.api);

  @override
  InetAddress parseNumericAddress(String address) =>
      jni.InetAddresses.parseNumericAddress(address.api).impl;
}
