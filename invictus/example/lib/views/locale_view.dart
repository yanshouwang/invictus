import 'package:clover/clover.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:invictus_example/view_models.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

class LocaleView extends StatelessWidget {
  const LocaleView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = ViewModel.of<LocaleViewModel>(context);
    final locales = viewModel.locales;
    return Scaffold(
      appBar: AppBar(title: const Text('Locale')),
      body: ReorderableListView.builder(
        itemBuilder: (context, index) {
          final locale = locales[index];
          final displayName = locale.getDisplayName(locale);
          return ListTile(key: ValueKey(locale), title: Text(displayName));
        },
        itemCount: locales.length,
        onReorder: (oldIndex, newIndex) {
          debugPrint('oldIndex: $oldIndex, newIndex: $newIndex');
          if (oldIndex < newIndex) {
            newIndex -= 1;
          }
          locales.swap(oldIndex, newIndex);
          viewModel.locales = locales;
        },
        footer: ListTile(
          leading: Icon(Symbols.add),
          title: Text('Add Language'),
          onTap: () {
            // TODO: Implement add language
          },
        ),
      ),
    );
  }
}
