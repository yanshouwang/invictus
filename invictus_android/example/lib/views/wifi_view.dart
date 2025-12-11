import 'package:clover/clover.dart';
import 'package:flutter/material.dart';
import 'package:invictus_android/invictus_android.dart';
import 'package:invictus_android_example/view_models.dart';
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
    final ssid = connectionInfo?.ssid;
    final ipAddress = connectionInfo == null
        ? null
        : NetworkUtil.intToInetAddress(connectionInfo.ipAddress).hostAddress;
    final netMask = dhcpInfo?.netmask;
    const r1 = 16.0;
    const r2 = 0.0;
    final items = <Widget>[
      SwitchListTile(
        tileColor: theme.colorScheme.surfaceContainer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(r1),
            bottom: Radius.circular(r2),
          ),
        ),
        title: Text('Wifi'),
        value: wifiState == WifiManager$WifiState.enabled,
        onChanged: (enabled) => viewModel.setWifiEnabled(enabled),
      ),
      ListTile(
        tileColor: theme.colorScheme.surfaceContainer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(r2)),
        ),
        title: Text('SSID'),
        trailing: ssid == null ? null : Text(ssid),
      ),
      ListTile(
        tileColor: theme.colorScheme.surfaceContainer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(r2)),
        ),
        title: Text('IP Address'),
        trailing: ipAddress == null ? null : Text(ipAddress),
      ),
      ListTile(
        tileColor: theme.colorScheme.surfaceContainer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(r2),
            bottom: Radius.circular(r1),
          ),
        ),
        title: Text('Net Mask'),
        trailing: netMask == null ? null : Text('$netMask'),
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text('Wifi'),
        actions: [IconButton(onPressed: () {}, icon: Icon(Symbols.more_vert))],
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16.0),
        child: CustomScrollView(
          slivers: [
            SliverList.separated(
              itemBuilder: (context, i) => items[i],
              separatorBuilder: (context, i) => Divider(
                color: theme.colorScheme.surface,
                height: 1.0,
                thickness: 1.0,
              ),
              itemCount: items.length,
            ),
          ],
        ),
      ),
    );
  }
}
