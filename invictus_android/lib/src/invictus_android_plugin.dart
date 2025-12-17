import 'package:invictus_android/src/impl.dart';
import 'package:invictus_api/invictus_api.dart';

final class InvictusAndroidPlugin {
  static void registerWith() {
    UsbDeviceChannel.instance = UsbDeviceChannelImpl();
    UsbManagerChannel.instance = UsbManagerChannelImpl();
    EthernetManager$ListenerChannel.instance =
        EthernetManager$ListenerChannelImpl();
    EthernetManagerChannel.instance = EthernetManagerChannelImpl();
    Inet4AddressUtilChannel.instance = Inet4AddressUtilChannelImpl();
    NetworkUtilChannel.instance = NetworkUtilChannelImpl();
    ScanResultChannel.instance = ScanResultChannelImpl();
    SupplicantStateChannel.instance = SupplicantStateChannelImpl();
    WifiConfigurationChannel.instance = WifiConfigurationChannelImpl();
    WifiInfoChannel.instance = WifiInfoChannelImpl();
    WifiManager$WifiStateChangedListenerChannel.instance =
        WifiManager$WifiStateChangedListenerChannelImpl();
    WifiManager$ScanResultsCallbackChannel.instance =
        WifiManager$ScanResultsCallbackChannelImpl();
    WifiManagerChannel.instance = WifiManagerChannelImpl();
    WifiSsidChannel.instance = WifiSsidChannelImpl();
    ConnectivityManager$NetworkCallbackChannel.instance =
        ConnectivityManager$NetworkCallbackChannelImpl();
    ConnectivityManager$OnNetworkActiveListenerChannel.instance =
        ConnectivityManager$OnNetworkActiveListenerChannelImpl();
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
