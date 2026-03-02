import 'package:clover/clover.dart';
import 'package:flutter/material.dart';
import 'package:invictus/invictus.dart';
import 'package:invictus_example/models.dart';
import 'package:invictus_example/view_models.dart';

class ConnectivityView extends StatelessWidget {
  const ConnectivityView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = ViewModel.of<ConnectivityViewModel>(context);
    final statuses = viewModel.statuses;
    return Scaffold(
      appBar: AppBar(title: Text('Connectivity')),
      body: CustomScrollView(
        slivers: [
          SliverList.separated(
            itemBuilder: (context, i) {
              final status = statuses.values.elementAt(i);
              return _buildNetworkStatus(context, status);
            },
            separatorBuilder: (context, i) => Divider(),
            itemCount: statuses.length,
          ),
        ],
      ),
    );
  }

  Widget _buildNetworkStatus(BuildContext context, NetworkStatus status) {
    final iface = status.iface;
    final linkAddress = status.linkAddress;
    final ipAddress = linkAddress?.address.hostAddress;
    final netmask = linkAddress == null
        ? null
        : Inet4AddressUtil.getPrefixMaskAsInet4Address(
            linkAddress.prefixLength,
          ).hostAddress;
    final gateway = status.gateway?.hostAddress;
    final dnsServers = status.dnsServers.map((e) => e.hostAddress).join(', ');
    final domains = status.domains;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('iface: $iface'),
          if (status is WifiStatus) Text('SSID: ${status.ssid}'),
          Text('ipAddress: $ipAddress'),
          Text('netmask: $netmask'),
          Text('gateway: $gateway'),
          Text('dnsServers: $dnsServers'),
          Text('domains: $domains'),
        ],
      ),
    );
  }
}
