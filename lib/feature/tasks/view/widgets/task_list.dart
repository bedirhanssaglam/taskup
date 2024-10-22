part of '../tasks_view.dart';

final class _TaskList extends StatelessWidget {
  const _TaskList({
    required this.tasks,
    required this.filterCriteria,
    required this.onDelete,
    required this.onMarkAsDone,
    required this.onMarkAsProgress,
  });

  final List<Task>? tasks;
  final FilterCriteria filterCriteria;
  final AsyncValueSetter<String?> onDelete;
  final AsyncValueSetter<UpdateTaskData> onMarkAsDone;
  final AsyncValueSetter<UpdateTaskData> onMarkAsProgress;

  @override
  Widget build(BuildContext context) {
    final sortedTasks = TaskFilterHelper.sortTasks(tasks, filterCriteria);
    final groupedTasks =
        TaskFilterHelper.groupTasks(sortedTasks, filterCriteria);

    return ListView.builder(
      itemCount: groupedTasks.length,
      padding: const AppPadding.smallHorizontal(),
      itemBuilder: (context, index) {
        final group = groupedTasks.keys.elementAt(index);
        final tasksInGroup = groupedTasks[group];

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const AppPadding.mediumAll(),
              child: Text(
                group,
                style: context.textTheme.titleMedium?.copyWith(
                  color: context.colorScheme.primary,
                ),
              ),
            ),
            if (tasksInGroup != null)
              ...tasksInGroup.map(
                (Task task) => TaskCard(
                  task: task,
                  onDelete: onDelete,
                  onMarkAsDone: onMarkAsDone,
                  onMarkAsProgress: onMarkAsProgress,
                ),
              ),
          ],
        );
      },
    );
  }
}
