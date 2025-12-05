import 'package:flutter/material.dart';

import 'package:invictus_android/invictus_android.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final PowerManager _powerManager;

  MyApp({super.key}) : _powerManager = PowerManager();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('invictus SDK')),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            spacing: 16.0,
            children: [
              TextButton(
                onPressed: () => _powerManager.reboot(
                  reason: PowerManagerReboot.requestedByDeviceOwner,
                ),
                child: Text('REBOOT'),
              ),
              TextButton(
                onPressed: () => _powerManager.shutdown(
                  confirm: false,
                  reason: PowerManagerShutdown.userRequested,
                  wait: false,
                ),
                child: Text('SHUTDOWN'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
