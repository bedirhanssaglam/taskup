part of '../calendar_view.dart';

class _CalendarTaskList extends StatelessWidget {
  const _CalendarTaskList({required this.tasks});
  final List<Task> tasks;

  @override
  Widget build(BuildContext context) {
    if (tasks.isEmpty) {
      return Center(
        child: LocaleText(LocaleKeys.calendar_thereAreNoTaskForTheSelectedDate),
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
