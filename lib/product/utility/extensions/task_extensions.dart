import 'package:easy_localization/easy_localization.dart';
import 'package:task_management/product/models/task.dart';

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

  bool get isTimeout {
    return (date?.toDate().isBefore(DateTime.now()) ?? false) &&
        !(isCompleted ?? false);
  }
}

extension TaskListExtensions on List<Task?> {
  int get doingCount {
    final today = DateTime.now();
    return where(
      (task) =>
          (task?.isDoing ?? false) &&
          (task?.date?.toDate().isAfter(today) ?? false),
    ).length;
  }

  int get completedCount {
    return where((task) => task?.isCompleted ?? false).length;
  }

  int get overdueCount {
    final today = DateTime.now();
    return where(
      (task) =>
          task?.date != null &&
          task!.date!.toDate().isBefore(today) &&
          !(task.isCompleted ?? false) &&
          !(task.isDoing ?? false),
    ).length;
  }

  int get upcomingCount {
    final today = DateTime.now();
    return where(
      (task) =>
          task?.date != null &&
          task!.date!.toDate().isAfter(today) &&
          !(task.isCompleted ?? false) &&
          !(task.isDoing ?? false),
    ).length;
  }
}
