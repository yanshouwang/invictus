import 'package:clover/clover.dart';
import 'package:flutter/material.dart';
import 'package:invictus_android_example/models.dart';
import 'package:invictus_android_example/view_models.dart';

class ConnectivityView extends StatelessWidget {
  const ConnectivityView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = ViewModel.of<ConnectivityViewModel>(context);
    final wifiModels = viewModel.wifiModels;
    final ethernetModels = viewModel.ethernetModels;
    return Scaffold(
      appBar: AppBar(title: Text('Connectivity')),
      body: CustomScrollView(
        slivers: [
          SliverList.separated(
            itemCount: wifiModels.length,
            itemBuilder: (context, i) {
              final model = wifiModels.values.elementAt(i);
              return _buildNetworkModel(context, model);
            },
            separatorBuilder: (context, i) {
              return Divider();
            },
          ),
          SliverToBoxAdapter(child: Divider()),
          SliverList.separated(
            itemCount: ethernetModels.length,
            itemBuilder: (context, i) {
              final model = ethernetModels.values.elementAt(i);
              return _buildNetworkModel(context, model);
            },
            separatorBuilder: (context, i) {
              return Divider();
            },
          ),
        ],
      ),
    );
  }

  Widget _buildNetworkModel(BuildContext context, NetworkModel model) {
    final theme = Theme.of(context);
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(model.iface, style: theme.textTheme.titleMedium),
          if (model is WifiModel) Text('SSID: ${model.ssid}'),
          Text('ipAddress: ${model.ipAddress}'),
          Text('netmask: ${model.netmask}'),
          Text('gateway: ${model.gateway}'),
          Text('dnsServers: ${model.dnsServers.join(', ')}'),
        ],
      ),
    );
  }
}
