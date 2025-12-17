import 'package:clover/clover.dart';
import 'package:flutter/material.dart';
import 'package:invictus_example/view_models.dart';

class UsbView extends StatelessWidget {
  const UsbView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = ViewModel.of<UsbViewModel>(context);
    final usbAccessories = viewModel.usbAccessories;
    final usbDevices = viewModel.usbDevices;
    return Scaffold(
      appBar: AppBar(title: const Text('Usb')),
      body: CustomScrollView(
        slivers: [
          SliverList.separated(
            itemBuilder: (context, i) {
              final usbAccessory = usbAccessories[i];
              return ListTile(title: Text('$usbAccessory'));
            },
            separatorBuilder: (context, i) => Divider(),
            itemCount: usbAccessories.length,
          ),
          SliverList.separated(
            itemBuilder: (context, i) {
              final entry = usbDevices.entries.elementAt(i);
              final usbDeviceName = entry.key;
              final usbDevice = entry.value;
              return ListTile(
                title: Text(usbDeviceName),
                subtitle: Text('$usbDevice'.split(',').join('\n')),
              );
            },
            separatorBuilder: (context, i) => Divider(),
            itemCount: usbDevices.length,
          ),
        ],
      ),
    );
  }
}
