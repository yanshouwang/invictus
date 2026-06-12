import 'package:clover/clover.dart';
import 'package:flutter/material.dart';
import 'package:invictus_example/view_models.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

class StorageView extends StatelessWidget {
  const StorageView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = ViewModel.of<StorageViewModel>(context);
    final volumes = viewModel.volumes;
    return Scaffold(
      appBar: AppBar(title: Text('Storage')),
      body: ListView.separated(
        itemBuilder: (context, i) {
          final volume = volumes[i];
          final type = viewModel.getVolumeType(volume.id);
          return ListTile(
            title: Text(volume.userLabel),
            subtitle: Text('[$type, ${volume.state.name}] ${volume.path}'),
            trailing: volume.isRemovable
                ? IconButton(
                    onPressed: () => viewModel.unmount(volume.id),
                    icon: Icon(Symbols.eject),
                  )
                : null,
          );
        },
        separatorBuilder: (context, i) => Divider(),
        itemCount: volumes.length,
      ),
    );
  }
}
