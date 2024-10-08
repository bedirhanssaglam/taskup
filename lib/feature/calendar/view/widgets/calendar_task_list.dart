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

final class CalendarTaskList extends StatelessWidget {
  const CalendarTaskList({
    required this.tasks,
    required this.onDelete,
    required this.onMarkAsDone,
    super.key,
  });

  final List<Task> tasks;
  final AsyncValueSetter<String?> onDelete;
  final AsyncValueSetter<UpdateTaskData> onMarkAsDone;

  @override
  Widget build(BuildContext context) {
    if (tasks.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Assets.lottie.emptyCalendar.show(
              height: 120.h,
              width: 120.w,
            ),
            LocaleText(
              LocaleKeys.calendar_thereAreNoTaskForTheSelectedDate,
              style: context.textTheme.bodyLarge,
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      itemCount: tasks.length,
      padding: const AppPadding.mediumAll(),
      itemBuilder: (context, index) {
        return TaskCard(
          task: tasks[index],
          onDelete: onDelete,
          onMarkAsDone: onMarkAsDone,
        );
      },
    );
  }
}
