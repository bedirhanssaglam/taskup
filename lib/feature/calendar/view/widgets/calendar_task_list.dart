import 'package:flutter/foundation.dart' show AsyncValueSetter;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_management/feature/calendar/view/widgets/empty_calendar_widget.dart';
import 'package:task_management/product/components/task/task_card.dart';
import 'package:task_management/product/models/task.dart';
import 'package:task_management/product/models/update_task_data.dart';
import 'package:task_management/product/utility/extensions/context_extensions.dart';
import 'package:task_management/product/utility/extensions/task_extensions.dart';
import 'package:task_management/product/utility/paddings/app_paddings.dart';

final class CalendarTaskList extends StatelessWidget {
  const CalendarTaskList({
    required this.tasks,
    required this.onDelete,
    required this.onMarkAsDone,
    required this.onMarkAsProgress,
    super.key,
  });

  final List<Task> tasks;
  final AsyncValueSetter<String?> onDelete;
  final AsyncValueSetter<UpdateTaskData> onMarkAsDone;
  final AsyncValueSetter<UpdateTaskData> onMarkAsProgress;

  @override
  Widget build(BuildContext context) {
    if (tasks.isEmpty) {
      return const EmptyCalendarWidget();
    }

    tasks.sort((a, b) => a.date!.toDate().compareTo(b.date!.toDate()));

    final timeSlotsWithTasks = tasks.generateTimeSlotsWithTasks;

    return ListView.builder(
      itemCount: timeSlotsWithTasks.length,
      padding: const AppPadding.smallAll(),
      itemBuilder: (context, index) {
        final timeSlot = timeSlotsWithTasks[index];
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 8.h),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 60.w,
                child: Text(
                  timeSlot.time,
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: context.colorScheme.onBackground.withOpacity(0.7),
                  ),
                  textAlign: TextAlign.right,
                ),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: timeSlot.task != null
                    ? TaskCard(
                        task: timeSlot.task!,
                        onDelete: onDelete,
                        onMarkAsDone: onMarkAsDone,
                        onMarkAsProgress: onMarkAsProgress,
                        showCalendar: false,
                      )
                    : Divider(
                        thickness: 1,
                        color: Colors.grey[300],
                      ),
              ),
            ],
          ),
        );
      },
    );
  }
}
