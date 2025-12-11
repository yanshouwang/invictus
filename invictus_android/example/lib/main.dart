import 'dart:async';
import 'dart:developer';

import 'package:clover/clover.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:invictus_android_example/view_models.dart';
import 'package:invictus_android_example/views.dart';
import 'package:logging/logging.dart';

void main() {
  Logger.root.level = Level.INFO;
  Logger.root.onRecord.listen((event) {
    log(
      event.message,
      time: event.time,
      sequenceNumber: event.sequenceNumber,
      level: event.level.value,
      name: event.loggerName,
      zone: event.zone,
      error: event.error,
      stackTrace: event.stackTrace,
    );
  });
  runZonedGuarded(
    () => runApp(const MyApp()),
    (error, stackTrace) => Logger.root.shout(error, stackTrace),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final GoRouter _routerConfig;

  @override
  void initState() {
    super.initState();
    _routerConfig = GoRouter(
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => ViewModelBinding(
            viewBuilder: () => HomeView(),
            viewModelBuilder: () => HomeViewModel(),
          ),
          routes: [
            GoRoute(
              path: 'build',
              builder: (context, state) => ViewModelBinding(
                viewBuilder: () => BuildView(),
                viewModelBuilder: () => BuildViewModel(),
              ),
            ),
            GoRoute(
              path: 'connectivity',
              builder: (context, state) => ViewModelBinding(
                viewBuilder: () => ConnectivityView(),
                viewModelBuilder: () => ConnectivityViewModel(),
              ),
            ),
            GoRoute(
              path: 'ethernet',
              builder: (context, state) => ViewModelBinding(
                viewBuilder: () => EthernetView(),
                viewModelBuilder: () => EthernetViewModel(),
              ),
            ),
            GoRoute(
              path: 'wifi',
              builder: (context, state) => ViewModelBinding(
                viewBuilder: () => WifiView(),
                viewModelBuilder: () => WifiViewModel(),
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _routerConfig,
      theme: ThemeData.light().copyWith(
        inputDecorationTheme: InputDecorationThemeData(
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _routerConfig.dispose();
    super.dispose();
  }
}
