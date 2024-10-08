part of '../home_view.dart';

final class _HomeTaskList extends StatelessWidget {
  const _HomeTaskList({
    required this.tasks,
    required this.filterCriteria,
    required this.onDelete,
    required this.onMarkAsDone,
  });

  final List<Task>? tasks;
  final FilterCriteria filterCriteria;
  final AsyncValueSetter<String?> onDelete;
  final AsyncValueSetter<UpdateTaskData> onMarkAsDone;

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
                ),
              ),
          ],
        );
      },
    );
  }
}
