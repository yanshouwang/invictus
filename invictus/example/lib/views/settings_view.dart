import 'package:clover/clover.dart';
import 'package:flutter/material.dart';
import 'package:invictus_example/view_models.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = ViewModel.of<SettingsViewModel>(context);
    final items = [
      SwitchListTile(
        title: Text('AUTO_TIME'),
        value: viewModel.autoTime,
        onChanged: (value) => viewModel.autoTime = value,
      ),
      SwitchListTile(
        title: Text('AUTO_TIME_ZONE'),
        value: viewModel.autoTimeZone,
        onChanged: (value) => viewModel.autoTimeZone = value,
      ),
      ListTile(
        title: Text('TIME_12_24'),
        trailing: Text('${viewModel.time12_24}'),
      ),
    ];
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView.separated(
        itemBuilder: (context, i) => items[i],
        separatorBuilder: (context, i) => Divider(),
        itemCount: items.length,
      ),
    );
  }
}
