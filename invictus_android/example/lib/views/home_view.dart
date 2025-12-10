import 'package:clover/clover.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:invictus_android_example/view_models.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final router = GoRouter.of(context);
    final viewModel = ViewModel.of<HomeViewModel>(context);
    return Scaffold(
      appBar: AppBar(title: const Text('invictus SDK')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 16.0,
          children: [
            TextButton(
              onPressed: () => context.go('./build'),
              child: Text('Build'),
            ),
            TextButton(
              onPressed: () => viewModel.reboot(),
              child: Text('Reboot'),
            ),
            TextButton(
              onPressed: () => viewModel.shutdown(),
              child: Text('Shutdown'),
            ),
            TextButton(
              onPressed: () => router.go('./connectivity'),
              child: Text('Connectivity'),
            ),
            TextButton(
              onPressed: () => router.go('./ethernet'),
              child: Text('Ethernet'),
            ),
          ],
        ),
      ),
    );
  }
}
