import 'package:easy_localization/easy_localization.dart';
import 'package:task_management/product/base/model/note.dart';

extension TaskExtensions on Task {
  String get getTaskGroupKey {
    if (date != null) {
      final convertedTaskDate = date!.toDate();
      final now = DateTime.now();
      final taskDate = DateTime(
        convertedTaskDate.year,
        convertedTaskDate.month,
        convertedTaskDate.day,
      );

      if (taskDate.isAtSameMomentAs(now)) return 'Today';
      if (taskDate.isAtSameMomentAs(
        now.add(const Duration(days: 1)),
      )) return 'Tomorrow';
      return DateFormat('dd.MM.yyyy').format(taskDate);
    }
    return 'No Date';
  }
}
