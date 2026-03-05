import 'package:clover/clover.dart';
import 'package:flutter/material.dart';
import 'package:invictus_example/view_models.dart';

class PowerView extends StatelessWidget {
  const PowerView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = ViewModel.of<PowerViewModel>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Power')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () => viewModel.shutdown(),
              child: Text('Shutdown'),
            ),
            TextButton(
              onPressed: () => viewModel.reboot(),
              child: Text('Reboot'),
            ),
          ],
        ),
      ),
    );
  }
}
