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

    return ListView.builder(
      itemCount: tasks.length,
      padding: const AppPadding.smallAll(),
      itemBuilder: (context, index) {
        return TaskCard(
          task: tasks[index],
          onDelete: onDelete,
          onMarkAsDone: onMarkAsDone,
          onMarkAsProgress: onMarkAsProgress,
        );
      },
    );
  }
}
