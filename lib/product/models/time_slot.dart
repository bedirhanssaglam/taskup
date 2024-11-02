import 'package:task_management/product/models/task.dart';

final class TimeSlot {
  TimeSlot({
    required this.time,
    this.task,
  });

  final String time;
  final Task? task;
}
