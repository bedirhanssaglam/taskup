import 'package:easy_localization/easy_localization.dart';

extension type Date._(DateTime dateTime) {
  Date(DateTime dateTime)
      : this._(
          DateTime(dateTime.year, dateTime.month, dateTime.day),
        );

  Date.today() : this(DateTime.now());

  bool operator >(Date other) => dateTime.isAfter(other.dateTime);

  bool operator <(Date other) => dateTime.isBefore(other.dateTime);
}

extension DateTimeComparison on DateTime {
  bool isSameDate(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }

  String get formatMonthAndYear => DateFormat('MMMM yyyy').format(this);

  String get formatDayOfWeek => DateFormat('EEE').format(this);

  String get formatDayOfMonth => DateFormat('d').format(this);

  List<DateTime> get generateMonthDates {
    final start = DateTime(year, month);
    final daysInMonth = DateTime(year, month + 1, 0).day;
    return List.generate(
      daysInMonth,
      (index) => start.add(Duration(days: index)),
    );
  }
}
