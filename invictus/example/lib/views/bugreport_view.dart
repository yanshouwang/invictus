import 'package:clover/clover.dart';
import 'package:flutter/material.dart';
import 'package:invictus_example/view_models.dart';

class BugreportView extends StatelessWidget {
  const BugreportView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = ViewModel.of<BugreportViewModel>(context);
    final progress = viewModel.progress;
    return Scaffold(
      appBar: AppBar(title: Text('Bugreport')),
      body: Center(
        child: Column(
          mainAxisSize: .min,
          crossAxisAlignment: .center,
          spacing: 16.0,
          children: [
            Text('Progress: $progress%'),
            TextButton(
              onPressed: () => viewModel.startBugreprot(),
              child: Text('Start'),
            ),
            TextButton(
              onPressed: () => viewModel.cancelBugreport(),
              child: Text('Cancel'),
            ),
          ],
        ),
      ),
    );
  }
}
