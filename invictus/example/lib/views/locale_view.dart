import 'package:clover/clover.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:invictus_example/view_models.dart';

class LocaleView extends StatelessWidget {
  const LocaleView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = ViewModel.of<LocaleViewModel>(context);
    final supportedLocales = viewModel.supportedLocales;
    final locales = viewModel.locales;
    final otherLocals = supportedLocales
        .whereNot((e) => locales.contains(e))
        .toList();
    return Scaffold(
      appBar: AppBar(title: const Text('Locale')),
      body: CustomScrollView(
        slivers: [
          SliverList.separated(
            itemBuilder: (context, i) {
              final locale = locales[i];
              return ListTile(
                onTap: () =>
                    viewModel.locales = [locale, ...locales..remove(locale)],
                title: Text('$locale'),
              );
            },
            separatorBuilder: (context, i) => Divider(),
            itemCount: locales.length,
          ),
          SliverToBoxAdapter(child: SizedBox(height: 40.0)),
          SliverList.separated(
            itemBuilder: (context, i) {
              final locale = otherLocals[i];
              return ListTile(
                onTap: () => viewModel.locales = [...locales, locale],
                title: Text('$locale'),
              );
            },
            separatorBuilder: (context, i) => Divider(),
            itemCount: otherLocals.length,
          ),
        ],
      ),
    );
  }
}
