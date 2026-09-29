import 'package:clover/clover.dart';
import 'package:flutter/material.dart';
import 'package:invictus_example/view_models.dart';

class EnvironmentView extends StatelessWidget {
  const EnvironmentView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = ViewModel.of<EnvironmentViewModel>(context);

    final isExternalStorageEmulated = viewModel.isExternalStorageEmulated;
    final isExternalStorageManager = viewModel.isExternalStorageManager;
    final isExternalStorageRemovable = viewModel.isExternalStorageRemovable;

    final externalStorageState = viewModel.externalStorageState;

    final rootDirectory = viewModel.rootDirectory;
    final dataDirectory = viewModel.dataDirectory;
    final downloadCacheDirectory = viewModel.downloadCacheDirectory;
    final externalStorageDirectory = viewModel.externalStorageDirectory;
    final alarmsDirectory = viewModel.alarmsDirectory;
    final dcimDirectory = viewModel.dcimDirectory;
    final documentsDirectory = viewModel.documentsDirectory;
    final downloadsDirectory = viewModel.downloadsDirectory;
    final moviesDirectory = viewModel.moviesDirectory;
    final musicDirectory = viewModel.musicDirectory;
    final notificationsDirectory = viewModel.notificationsDirectory;
    final picturesDirectory = viewModel.picturesDirectory;
    final podcastsDirectory = viewModel.podcastsDirectory;
    final ringtonesDirectory = viewModel.ringtonesDirectory;
    final screenshotsDirectory = viewModel.screenshotsDirectory;

    final items = <Widget>[
      Column(
        mainAxisSize: .min,
        children: ListTile.divideTiles(
          context: context,
          tiles: [
            ListTile(
              title: Text('isExternalStorageEmulated'),
              trailing: Text('$isExternalStorageEmulated'),
            ),
            ListTile(
              title: Text('isExternalStorageManager'),
              trailing: Text('$isExternalStorageManager'),
            ),
            ListTile(
              title: Text('isExternalStorageRemovable'),
              trailing: Text('$isExternalStorageRemovable'),
            ),
          ],
        ).toList(),
      ),
      Column(
        mainAxisSize: .min,
        children: ListTile.divideTiles(
          context: context,
          tiles: [
            ListTile(
              title: Text('externalStorageState'),
              trailing: Text(externalStorageState.name),
            ),
          ],
        ).toList(),
      ),
      Column(
        mainAxisSize: .min,
        children: ListTile.divideTiles(
          context: context,
          tiles: [
            ListTile(
              title: Text('rootDirectory'),
              subtitle: Text(rootDirectory),
            ),
            ListTile(
              title: Text('dataDirectory'),
              subtitle: Text(dataDirectory),
            ),
            ListTile(
              title: Text('downloadCacheDirectory'),
              subtitle: Text(downloadCacheDirectory),
            ),
            ListTile(
              title: Text('externalStorageDirectory'),
              subtitle: Text(externalStorageDirectory),
            ),
            ListTile(
              title: Text('alarmsDirectory'),
              subtitle: Text(alarmsDirectory),
            ),
            ListTile(
              title: Text('dcimDirectory'),
              subtitle: Text(dcimDirectory),
            ),
            ListTile(
              title: Text('documentsDirectory'),
              subtitle: Text(documentsDirectory),
            ),
            ListTile(
              title: Text('downloadsDirectory'),
              subtitle: Text(downloadsDirectory),
            ),
            ListTile(
              title: Text('moviesDirectory'),
              subtitle: Text(moviesDirectory),
            ),
            ListTile(
              title: Text('musicDirectory'),
              subtitle: Text(musicDirectory),
            ),
            ListTile(
              title: Text('notificationsDirectory'),
              subtitle: Text(notificationsDirectory),
            ),
            ListTile(
              title: Text('picturesDirectory'),
              subtitle: Text(picturesDirectory),
            ),
            ListTile(
              title: Text('podcastsDirectory'),
              subtitle: Text(podcastsDirectory),
            ),
            ListTile(
              title: Text('ringtonesDirectory'),
              subtitle: Text(ringtonesDirectory),
            ),
            ListTile(
              title: Text('screenshotsDirectory'),
              subtitle: Text(screenshotsDirectory),
            ),
          ],
        ).toList(),
      ),
    ];
    return Scaffold(
      appBar: AppBar(title: Text('Environment')),
      body: ListView.separated(
        itemBuilder: (context, i) => items[i],
        separatorBuilder: (context, i) => SizedBox(height: 16.0),
        itemCount: items.length,
      ),
    );
  }
}
