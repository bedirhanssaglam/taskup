part of '../home_view.dart';

final class TaskList extends StatelessWidget {
  const TaskList({required this.tasks, super.key});

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
              return _TaskCard(task: task);
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

final class _TaskCard extends StatelessWidget {
  const _TaskCard({
    required this.task,
  });

  final Task task;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: context.colorScheme.onPrimary,
      shape: RoundedRectangleBorder(
        borderRadius: AppBorderRadius.circularMedium(),
      ),
      child: ListTile(
        onTap: () {},
        shape: RoundedRectangleBorder(
          borderRadius: AppBorderRadius.circularMedium(),
        ),
        title: Text(
          task.title ?? '',
          style: context.textTheme.titleLarge,
        ),
        subtitle: Text(task.date!.convertDate),
        leading: Container(
          padding: const AppPadding.smallAll(),
          decoration: BoxDecoration(
            color: task.category!.color,
            borderRadius: AppBorderRadius.circularSmall(),
          ),
          child: task.category!.icon.show(),
        ),
        trailing: Container(
          padding: const AppPadding.smallAll(),
          decoration: BoxDecoration(
            border: Border.all(color: context.colorScheme.primary),
            borderRadius: AppBorderRadius.circularSmall(),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Assets.icons.flag.colored(
                context.colorScheme.primary,
                height: 20.h,
              ),
              WidgetSizes.spacingXxs.horizontalSpace,
              Text(
                task.priority ?? '',
                style: context.textTheme.bodyLarge,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
