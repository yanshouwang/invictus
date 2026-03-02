import 'package:clover/clover.dart';
import 'package:flutter/material.dart';
import 'package:invictus_example/view_models.dart';

class SystemPropertiesView extends StatelessWidget {
  const SystemPropertiesView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = ViewModel.of<SystemPropertiesViewModel>(context);
    final boot = viewModel.boot;
    return Scaffold(
      appBar: AppBar(title: const Text('SystemProperties')),
      body: Center(
        child: DropdownMenu(
          label: Text('Boot'),
          dropdownMenuEntries: PersistSysCustomanimBoot.values
              .map((e) => DropdownMenuEntry(value: e, label: e.name))
              .toList(),
          initialSelection: boot,
          onSelected: viewModel.setPersistSysCustomanimBoot,
        ),
      ),
    );
  }
}
