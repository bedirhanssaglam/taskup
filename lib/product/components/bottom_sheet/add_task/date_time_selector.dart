// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:gen/gen.dart';
import 'package:task_management/product/utility/date_time/date_time_picker.dart';
import 'package:task_management/product/utility/extensions/context_extensions.dart';
import 'package:task_management/product/utility/extensions/icon_extensions.dart';

class DateTimeSelector extends StatelessWidget {
  const DateTimeSelector({required this.onDateTimeSelected, super.key});
  final void Function(DateTime) onDateTimeSelected;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => _changeSelectedDate(context),
      icon: Assets.icons.timer.colored(context.colorScheme.onBackground),
    );
  }

  Future<void> _changeSelectedDate(BuildContext context) async {
    final selectedDate = await DateTimePicker.pickDate(context);
    if (selectedDate != null) {
      final selectedTime = await DateTimePicker.pickTime(context);
      if (selectedTime != null) {
        final finalDateTime = DateTimePicker.combineDateAndTime(
          selectedDate,
          selectedTime,
        );
        onDateTimeSelected(finalDateTime);
      }
    }
  }
}
