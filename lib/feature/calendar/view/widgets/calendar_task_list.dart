import 'package:flutter/foundation.dart' show AsyncValueSetter;
import 'package:flutter/material.dart';
import 'package:task_management/feature/home/view/widgets/task_card.dart';
import 'package:task_management/product/components/bottom_sheet/add_task/view/add_task_sheet.dart';
import 'package:task_management/product/components/button/app_text_button.dart';
import 'package:task_management/product/components/text/locale_text.dart';
import 'package:task_management/product/init/localization/locale_keys.g.dart';
import 'package:task_management/product/models/task.dart';
import 'package:task_management/product/utility/extensions/context_extensions.dart';
import 'package:task_management/product/utility/paddings/app_paddings.dart';

final class CalendarTaskList extends StatelessWidget {
  const CalendarTaskList({
    required this.tasks,
    required this.onDelete,
    super.key,
  });

  final List<Task> tasks;
  final AsyncValueSetter<String?> onDelete;

  @override
  Widget build(BuildContext context) {
    if (tasks.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LocaleText(
              LocaleKeys.calendar_thereAreNoTaskForTheSelectedDate,
              style: context.textTheme.bodyLarge,
            ),
            AppTextButton(
              text: LocaleKeys.addTask_addTaskText,
              onPressed: () => AddTaskBottomSheet.show(context),
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
        );
      },
    );
  }
}
