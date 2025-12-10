import 'package:invictus_android/src/api.dart';
import 'package:invictus_android/src/impl.dart';
import 'package:invictus_android/src/jni.dart' as jni;

final class InetAddressesImpl implements InetAddresses {
  static bool isNumericAddress(String address) =>
      jni.InetAddresses.isNumericAddress(address.api);

  static InetAddress parseNumericAddress(String address) =>
      jni.InetAddresses.parseNumericAddress(address.api).impl;

  final jni.InetAddresses api;

  InetAddressesImpl.internal(this.api);
}
