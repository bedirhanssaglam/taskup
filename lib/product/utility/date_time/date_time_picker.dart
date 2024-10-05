import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_management/product/components/text/locale_text.dart';
import 'package:task_management/product/init/localization/locale_keys.g.dart';
import 'package:task_management/product/utility/extensions/context_extensions.dart';
import 'package:task_management/product/utility/extensions/string_extensions.dart';
import 'package:widget/widget.dart';

part 'cupertino_date_time_picker.dart';
part 'cupertino_time_picker.dart';

final class DateTimePicker {
  static Future<DateTime?> pickDate(BuildContext context) async {
    DateTime? selectedDate;

    if (Platform.isIOS) {
      selectedDate = await _pickDateCupertino(context);
    } else {
      selectedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2101),
      );
    }

    return selectedDate;
  }

  static Future<TimeOfDay?> pickTime(BuildContext context) async {
    TimeOfDay? selectedTime = TimeOfDay.now();

    if (Platform.isIOS) {
      selectedTime = await _pickTimeCupertino(context);
    } else {
      selectedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );
    }

    return selectedTime ?? TimeOfDay.now();
  }

  static Future<DateTime?> _pickDateCupertino(BuildContext context) async {
    var selectedDate = DateTime.now();

    await BottomSheetBase.show<void>(
      context: context,
      builder: (context) => _CupertinoDatePickerWidget(
        onDateTimeChanged: (DateTime dateTime) {
          selectedDate = dateTime;
        },
      ),
    );

    return selectedDate;
  }

  static Future<TimeOfDay?> _pickTimeCupertino(BuildContext context) async {
    var selectedDateTime = DateTime.now();

    await BottomSheetBase.show<void>(
      context: context,
      builder: (context) => _CupertinoTimePickerWidget(
        onDateTimeChanged: (DateTime dateTime) {
          selectedDateTime = dateTime;
        },
      ),
    );

    return TimeOfDay.fromDateTime(selectedDateTime);
  }

  static DateTime combineDateAndTime(DateTime date, TimeOfDay time) {
    return DateTime(
      date.year,
      date.month,
      date.day,
      time.hour,
      time.minute,
    );
  }
}
