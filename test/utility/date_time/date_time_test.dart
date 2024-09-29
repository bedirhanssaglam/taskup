import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:task_management/product/utility/date_time/date_time_picker.dart';

void main() {
  test('combineDateAndTime should correctly combine date and time', () {
    final date = DateTime(2026);
    const time = TimeOfDay(hour: 10, minute: 30);

    final result = DateTimePicker.combineDateAndTime(date, time);

    expect(result.year, 2026);
    expect(result.month, 1);
    expect(result.day, 1);
    expect(result.hour, 10);
    expect(result.minute, 30);
  });
}
