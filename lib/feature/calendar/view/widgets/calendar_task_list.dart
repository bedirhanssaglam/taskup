part of '../calendar_view.dart';

class _CalendarTaskList extends StatelessWidget {
  const _CalendarTaskList({required this.tasks});
  final List<Task> tasks;

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
        return TaskCard(task: tasks[index]);
      },
    );
  }
}
