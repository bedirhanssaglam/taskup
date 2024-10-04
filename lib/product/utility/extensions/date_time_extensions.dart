import 'package:easy_localization/easy_localization.dart';

extension DateTimeComparison on DateTime {
  bool isSameDate(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }

  String get formatMonthAndYear => DateFormat('MMMM yyyy').format(this);

  String get formatDayOfWeek => DateFormat('EEE').format(this);

  String get formatDayOfMonth => DateFormat('d').format(this);
}
