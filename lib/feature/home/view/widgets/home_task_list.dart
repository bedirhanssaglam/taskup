part of '../home_view.dart';

final class _HomeTaskList extends StatelessWidget {
  const _HomeTaskList({required this.tasks});

  final List<Task>? tasks;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _groupTasksByDate.length,
      padding: const AppPadding.smallHorizontal(),
      itemBuilder: (context, index) {
        final group = _groupTasksByDate.keys.elementAt(index);
        final tasksInGroup = _groupTasksByDate[group]!;

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
            ...tasksInGroup.map((Task task) {
              return TaskCard(task: task);
            }),
          ],
        );
      },
    );
  }

  Map<String, List<Task>> get _groupTasksByDate {
    final grouped = <String, List<Task>>{};

    for (final task in tasks!) {
      final key = task.getTaskGroupKey;
      if (grouped.containsKey(key)) {
        grouped[key]!.add(task);
      } else {
        grouped[key] = [task];
      }
    }

    return grouped;
  }
}
