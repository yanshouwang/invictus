import 'package:invictus_android/src/impl.dart';
import 'package:invictus_api/invictus_api.dart';

final class InvictusAndroidPlugin {
  static void registerWith() {
    UsbConstantsChannel.instance = UsbConstantsChannelImpl();
    UsbDeviceChannel.instance = UsbDeviceChannelImpl();
    UsbManagerChannel.instance = UsbManagerChannelImpl();
    UsbRequestChannel.instance = UsbRequestChannelImpl();
    EthernetManagerChannel.instance = EthernetManagerChannelImpl();
    Inet4AddressUtilChannel.instance = Inet4AddressUtilChannelImpl();
    NetworkUtilChannel.instance = NetworkUtilChannelImpl();
    ScanResultChannel.instance = ScanResultChannelImpl();
    SupplicantStateChannel.instance = SupplicantStateChannelImpl();
    WifiConfigurationChannel.instance = WifiConfigurationChannelImpl();
    WifiInfoChannel.instance = WifiInfoChannelImpl();
    WifiManagerChannel.instance = WifiManagerChannelImpl();
    WifiSsidChannel.instance = WifiSsidChannelImpl();
    ConnectivityManagerChannel.instance = ConnectivityManagerChannelImpl();
    DhcpInfoChannel.instance = DhcpInfoChannelImpl();
    InetAddressChannel.instance = InetAddressChannelImpl();
    InetAddressesChannel.instance = InetAddressesChannelImpl();
    Inet4AddressChannel.instance = Inet4AddressChannelImpl();
    Inet6AddressChannel.instance = Inet6AddressChannelImpl();
    IpConfigurationChannel.instance = IpConfigurationChannelImpl();
    LinkAddressChannel.instance = LinkAddressChannelImpl();
    NetworkRequestChannel.instance = NetworkRequestChannelImpl();
    NetworkChannel.instance = NetworkChannelImpl();
    StaticIpConfigurationChannel.instance = StaticIpConfigurationChannelImpl();
    Build$PartitionChannel.instance = Build$PartitionChannelImpl();
    Build$VersionChannel.instance = Build$VersionChannelImpl();
    Build$VersionCodesChannel.instance = Build$VersionCodesChannelImpl();
    Build$VersionCodesFullChannel.instance =
        Build$VersionCodesFullChannelImpl();
    BuildChannel.instance = BuildChannelImpl();
    PowerManagerChannel.instance = PowerManagerChannelImpl();
  }
}
