import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:invictus_example/widgets.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final router = GoRouter.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('invictus SDK'),
        actions: [
          IconButton(
            onPressed: () => showLicensePage(context: context),
            icon: const Icon(Symbols.license),
          ),
        ],
      ),
      body: Center(
        child: GridView.count(
          crossAxisCount: 3,
          mainAxisSpacing: 1.0,
          crossAxisSpacing: 1.0,
          children: [
            NewGridTile(
              onPressed: () => context.go('./build'),
              icon: Icon(Symbols.build),
              label: Text('Build'),
            ),
            NewGridTile(
              onPressed: () => router.go('./locale'),
              icon: Icon(Symbols.language),
              label: Text('Locale'),
            ),
            NewGridTile(
              onPressed: () => context.go('./power'),
              icon: Icon(Symbols.power_settings_new),
              label: Text('Power'),
            ),
            NewGridTile(
              onPressed: () => router.go('./connectivity'),
              icon: Icon(Symbols.communication),
              label: Text('Connectivity'),
            ),
            NewGridTile(
              onPressed: () => router.go('./ethernet'),
              icon: Icon(Symbols.settings_ethernet),
              label: Text('Ethernet'),
            ),
            NewGridTile(
              onPressed: () => router.go('./wifi'),
              icon: Icon(Symbols.wifi),
              label: Text('Wifi'),
            ),
            NewGridTile(
              onPressed: () => router.go('./usb'),
              icon: Icon(Symbols.usb),
              label: Text('Usb'),
            ),
            NewGridTile(
              onPressed: () => router.go('./system-properties'),
              icon: Icon(Symbols.admin_panel_settings),
              label: Text('System Properties'),
            ),
          ],
        ),
      ),
    );
  }
}
