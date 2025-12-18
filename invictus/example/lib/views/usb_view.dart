import 'package:clover/clover.dart';
import 'package:flutter/material.dart';
import 'package:invictus_example/view_models.dart';

class UsbView extends StatelessWidget {
  const UsbView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = ViewModel.of<UsbViewModel>(context);
    final accessories = viewModel.usbAccessories;
    final devices = viewModel.usbDevices;
    return Scaffold(
      appBar: AppBar(title: const Text('Usb')),
      body: CustomScrollView(
        slivers: [
          SliverList.separated(
            itemBuilder: (context, i) {
              final accessory = accessories[i];
              return ListTile(
                onTap: () => viewModel.requestAccessoryPermission(accessory),
                title: Text('$accessory'),
              );
            },
            separatorBuilder: (context, i) => Divider(),
            itemCount: accessories.length,
          ),
          SliverList.separated(
            itemBuilder: (context, i) {
              final entry = devices.entries.elementAt(i);
              final deviceName = entry.key;
              final device = entry.value;
              return ListTile(
                onTap: () => viewModel.requestDevicePermission(device),
                title: Text(deviceName),
                subtitle: Text('$device'.split(',').join('\n')),
              );
            },
            separatorBuilder: (context, i) => Divider(),
            itemCount: devices.length,
          ),
        ],
      ),
    );
  }
}
