import 'package:invictus_android/src/api.dart';
import 'package:invictus_android/src/impl.dart';

abstract interface class InetAddresses {
  static bool isNumericAddress(String address) =>
      InetAddressesImpl.isNumericAddress(address);

  static InetAddress parseNumericAddress(String address) =>
      InetAddressesImpl.parseNumericAddress(address);
}
