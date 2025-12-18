import 'package:clover/clover.dart';
import 'package:flutter/material.dart';
import 'package:invictus/invictus.dart';
import 'package:invictus_example/view_models.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

class WifiView extends StatelessWidget {
  const WifiView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final viewModel = ViewModel.of<WifiViewModel>(context);
    final wifiState = viewModel.wifiState;
    final connectionInfo = viewModel.connectionInfo;
    final dhcpInfo = viewModel.dhcpInfo;
    final scanResults = viewModel.scanResults;
    const r1 = 16.0;
    const r2 = 0.0;
    final items = <Widget>[
      ListTile(
        tileColor: theme.colorScheme.surfaceContainer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(r1),
            bottom: Radius.circular(r2),
          ),
        ),
        title: Text('SSID'),
        trailing: Text(connectionInfo.ssid.withoutQuotes),
      ),
      ListTile(
        tileColor: theme.colorScheme.surfaceContainer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(r2)),
        ),
        title: Text('IPv4'),
        trailing: Text(
          '${NetworkUtil.intToInetAddress(connectionInfo.ipAddress).hostAddress}',
        ),
      ),
      ListTile(
        tileColor: theme.colorScheme.surfaceContainer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(r2)),
        ),
        title: Text('Netmask'),
        trailing: Text('${dhcpInfo.netmask}'),
      ),
      ListTile(
        tileColor: theme.colorScheme.surfaceContainer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(r2)),
        ),
        title: Text('DNS 1'),
        trailing: Text(
          '${NetworkUtil.intToInetAddress(dhcpInfo.dns1).hostAddress}',
        ),
      ),
      ListTile(
        tileColor: theme.colorScheme.surfaceContainer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(r2),
            bottom: Radius.circular(r1),
          ),
        ),
        title: Text('DNS 2'),
        trailing: Text(
          '${NetworkUtil.intToInetAddress(dhcpInfo.dns2).hostAddress}',
        ),
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text('Wifi'),
        actions: [IconButton(onPressed: () {}, icon: Icon(Symbols.more_vert))],
      ),
      body: Container(
        margin: const EdgeInsets.all(16.0),
        child: CustomScrollView(
          slivers: [
            SliverList.list(
              children: [
                SwitchListTile(
                  tileColor: theme.colorScheme.surfaceContainer,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(r1)),
                  ),
                  title: Text('Wifi'),
                  value: wifiState == WifiManager$WifiState.enabled,
                  onChanged: (enabled) => viewModel.setWifiEnabled(enabled),
                ),
              ],
            ),
            SliverToBoxAdapter(
              child: _buildTitleView(context, title: Text('Connection Info')),
            ),
            SliverList.separated(
              itemBuilder: (context, i) => items[i],
              separatorBuilder: (context, i) =>
                  Divider(color: theme.colorScheme.surface),
              itemCount: items.length,
            ),
            SliverToBoxAdapter(
              child: _buildTitleView(
                context,
                title: Text('Scan Results'),
                trailing: IconButton(
                  style: IconButton.styleFrom(
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  onPressed: () => viewModel.startScan(),
                  icon: Icon(Symbols.refresh),
                ),
              ),
            ),
            SliverList.separated(
              itemBuilder: (context, i) {
                final scanResult = scanResults[i];
                return ListTile(
                  tileColor: theme.colorScheme.surfaceContainer,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(i == 0 ? r1 : r2),
                      bottom: Radius.circular(
                        i == scanResults.length - 1 ? r1 : r2,
                      ),
                    ),
                  ),
                  onTap: () {},
                  title: Text('${scanResult.wifiSsid}'.withoutQuotes),
                );
              },
              separatorBuilder: (context, i) =>
                  Divider(color: theme.colorScheme.surface),
              itemCount: scanResults.length,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTitleView(
    BuildContext context, {
    required Widget title,
    Widget? trailing,
  }) {
    return Container(
      constraints: BoxConstraints(minHeight: 40.0),
      margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [title, if (trailing != null) trailing],
      ),
    );
  }
}

extension on String {
  String get withoutQuotes => replaceAll('"', '');
}
