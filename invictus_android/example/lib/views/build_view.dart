import 'package:clover/clover.dart';
import 'package:flutter/material.dart';
import 'package:invictus_android_example/view_models.dart';

class BuildView extends StatelessWidget {
  const BuildView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = ViewModel.of<BuildViewModel>(context);
    final items = {
      'BOARD': viewModel.board,
      'BOOTLOADER': viewModel.bootloader,
      'BRAND': viewModel.brand,
      'DEVICE': viewModel.device,
      'DISPLAY': viewModel.display,
      'FINGERPRINT': viewModel.fingerprint,
      // 'FINGERPRINTED_PARTITIONS': viewModel.fingerprintedPartitions,
      'HARDWARE': viewModel.hardware,
      'HOST': viewModel.host,
      'ID': viewModel.id,
      'MANUFACTURER': viewModel.manufacturer,
      'MODEL': viewModel.model,
      'ODM_SKU': viewModel.odmSku,
      'PRODUCT': viewModel.product,
      'RADIO': viewModel.radio,
      'SERIAL': viewModel.serial,
      'SKU': viewModel.sku,
      'SOC_MANUFACTURER': viewModel.socManufacturer,
      'SOC_MODEL': viewModel.socModel,
      'SUPPORTED_32BIT_ABIS': viewModel.supported32BitAbis,
      'SUPPORTED_64BIT_ABIS': viewModel.supported64BitAbis,
      'SUPPORTED_ABIS': viewModel.supportedAbis,
      'TAGS': viewModel.tags,
      'TIME': viewModel.time,
      'TYPE': viewModel.type,
      'USER': viewModel.user,
    };
    return Scaffold(
      appBar: AppBar(title: Text('Build')),
      body: ListView.separated(
        itemBuilder: (context, i) {
          final item = items.entries.elementAt(i);
          return ListTile(
            title: Text(item.key),
            subtitle: Text('${item.value}'),
          );
        },
        separatorBuilder: (context, i) => Divider(),
        itemCount: items.length,
      ),
    );
  }
}
