import 'dart:math';

import 'package:flutter/foundation.dart' show AsyncValueSetter;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen/gen.dart';
import 'package:task_management/product/components/task/task_card.dart';
import 'package:task_management/product/components/text/locale_text.dart';
import 'package:task_management/product/init/localization/locale_keys.g.dart';
import 'package:task_management/product/models/task.dart';
import 'package:task_management/product/models/update_task_data.dart';
import 'package:task_management/product/utility/extensions/context_extensions.dart';
import 'package:task_management/product/utility/extensions/lottie_extensions.dart';
import 'package:task_management/product/utility/paddings/app_paddings.dart';
import 'package:task_management/product/utility/size/widget_sizes.dart';

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
      return _buildEmptyState(context);
    }

    // Görevlerin saatine göre sıralama
    tasks.sort((a, b) => a.date!.toDate().compareTo(b.date!.toDate()));

    // Görevlerin tam zamanlarını ve diğer saatleri birleştirip listeye eklemek
    final timeSlotsWithTasks = _generateTimeSlotsWithTasks(tasks);

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
              // Saat göstergesi
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

  Widget _buildEmptyState(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Assets.lottie.emptyCalendar.show(
            height: WidgetSizes.spacingXxlL12.h,
            width: WidgetSizes.spacingXxlL12.w,
          ),
          LocaleText(
            LocaleKeys.calendar_noTaskTitle,
            style: context.textTheme.titleLarge,
          ),
          WidgetSizes.spacingXxs.verticalSpace,
          LocaleText(
            LocaleKeys.calendar_noTaskSubtitle,
            style: context.textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }

  List<TimeSlot> _generateTimeSlotsWithTasks(List<Task> tasks) {
    final timeSlots = <TimeSlot>[];

    for (final task in tasks) {
      final taskTime = task.date!.toDate();
      timeSlots.add(
        TimeSlot(
          time: "${taskTime.hour.toString().padLeft(2, '0')}:${taskTime.minute.toString().padLeft(2, '0')}",
          task: task,
        ),
      );
    }

    final now = DateTime.now();
    final startOfDay = DateTime(now.year, now.month, now.day);

    for (var i = 0; i < 24; i++) {
      final currentHour = startOfDay.add(Duration(hours: i));

      final hasTaskInThisHour = timeSlots.any((slot) {
        return slot.time.split(':')[0] == currentHour.hour.toString().padLeft(2, '0');
      });

      if (!hasTaskInThisHour && Random().nextBool()) {
        timeSlots.add(
          TimeSlot(
            time: "${currentHour.hour.toString().padLeft(2, '0')}:00",
          ),
        );
      }
    }

    // Zamanlarına göre sırala
    timeSlots.sort((a, b) {
      return a.time.compareTo(b.time);
    });

    return timeSlots;
  }
}

class TimeSlot {
  TimeSlot({
    required this.time,
    this.task,
  });

  final String time;
  final Task? task;
}
