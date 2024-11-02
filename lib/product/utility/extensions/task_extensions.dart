import 'dart:math' show Random;

import 'package:easy_localization/easy_localization.dart';
import 'package:task_management/product/models/task.dart';
import 'package:task_management/product/models/time_slot.dart';
import 'package:task_management/product/utility/extensions/date_time_extensions.dart';

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
    final today = Date.today();
    return where(
      (task) =>
          (task?.isDoing ?? false) && (Date(task!.date!.toDate()) > today),
    ).length;
  }

  int get completedCount {
    return where((Task? task) => task?.isCompleted ?? false).length;
  }

  int get overdueCount {
    final today = Date.today();
    return where(
      (task) =>
          task?.date != null &&
          (Date(task!.date!.toDate()) < today) &&
          !(task.isCompleted ?? false),
    ).length;
  }

  int get upcomingCount {
    final today = Date.today();
    return where(
      (task) =>
          task?.date != null &&
          Date(task!.date!.toDate()) > today &&
          !(task.isCompleted ?? false) &&
          !(task.isDoing ?? false),
    ).length;
  }
}

extension TimeSlotExtension on List<Task> {
  List<TimeSlot> get generateTimeSlotsWithTasks {
    final timeSlots = <TimeSlot>[];

    for (final task in this) {
      final taskTime = task.date!.toDate();
      timeSlots.add(
        TimeSlot(
          time:
              "${taskTime.hour.toString().padLeft(2, '0')}:${taskTime.minute.toString().padLeft(2, '0')}",
          task: task,
        ),
      );
    }

    final now = DateTime.now();
    final startOfDay = DateTime(now.year, now.month, now.day);

    for (var i = 0; i < 24; i++) {
      final currentHour = startOfDay.add(Duration(hours: i));

      final hasTaskInThisHour = timeSlots.any((slot) {
        return slot.time.split(':')[0] ==
            currentHour.hour.toString().padLeft(2, '0');
      });

      if (!hasTaskInThisHour && Random().nextBool()) {
        timeSlots.add(
          TimeSlot(
            time: "${currentHour.hour.toString().padLeft(2, '0')}:00",
          ),
        );
      }
    }

    timeSlots.sort((a, b) {
      return a.time.compareTo(b.time);
    });

    return timeSlots;
  }
}
