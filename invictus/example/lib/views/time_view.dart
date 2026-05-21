import 'package:clover/clover.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:invictus_example/view_models.dart';

class TimeView extends StatelessWidget {
  const TimeView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = ViewModel.of<TimeViewModel>(context);
    final locale = Localizations.localeOf(context).toLanguageTag();
    final dateFmt = DateFormat.yMd(locale);
    final timeFmt = DateFormat.Hms(locale);
    final now = viewModel.now;
    final autoTime = viewModel.autoTime;
    return Scaffold(
      appBar: AppBar(title: const Text('Date & Time')),
      body: ListView(
        children: [
          SwitchListTile(
            title: Text('Auto Time'),
            value: autoTime,
            onChanged: (value) => viewModel.autoTime = value,
          ),
          ListTile(
            title: Text('Date'),
            subtitle: Text(dateFmt.format(now)),
            onTap: () async {
              final date = await showDatePicker(
                context: context,
                firstDate: DateTime.utc(1970, 1, 1),
                lastDate: DateTime.utc(2099, 12, 31),
                initialDate: now,
                currentDate: now,
              );
              if (date == null) return;
              final res = viewModel.setSystemDate(
                date.year,
                date.month,
                date.day,
              );
              debugPrint('setSystemDate: $res');
            },
          ),
          ListTile(
            title: Text('Time'),
            subtitle: Text(timeFmt.format(now)),
            onTap: () async {
              final time = await showTimePicker(
                context: context,
                initialTime: TimeOfDay.fromDateTime(now),
              );
              if (time == null) return;
              final res = viewModel.setSystemTime(time.hour, time.minute, 0);
              debugPrint('setSystemTime: $res');
            },
          ),
        ],
      ),
    );
  }
}
