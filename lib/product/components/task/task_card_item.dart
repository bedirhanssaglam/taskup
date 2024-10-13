part of 'task_card.dart';

final class _TaskCardItem extends StatelessWidget {
  const _TaskCardItem({
    required this.task,
    required this.onDelete,
    required this.onMarkAsDone,
  });

  final Task task;
  final AsyncValueSetter<String?> onDelete;
  final VoidCallback onMarkAsDone;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(task.id),
      direction: DismissDirection.endToStart,
      background: Container(
        alignment: Alignment.centerRight,
        margin: const AppPadding.smallVertical(),
        padding: const AppPadding.mediumAll(),
        decoration: BoxDecoration(
          color: context.colorScheme.error,
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(12),
            bottomRight: Radius.circular(12),
          ),
        ),
        child: Assets.icons.trash.colored(context.colorScheme.background),
      ),
      confirmDismiss: (direction) async => DeleteTaskDialog.show(context),
      onDismissed: (_) => onDelete(task.id),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return ConstrainedBox(
            constraints: BoxConstraints(maxWidth: constraints.maxWidth),
            child: Stack(
              children: [
                Card(
                  elevation: 0,
                  color: context.colorScheme.onPrimary,
                  shape: RoundedRectangleBorder(
                    borderRadius: AppBorderRadius.circularMedium(),
                  ),
                  child: IntrinsicWidth(
                    stepWidth: 1.sw,
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: TaskInfoRow(task: task),
                    ),
                  ),
                ),
                Positioned(
                  top: 3.h,
                  right: 3.w,
                  child: !task.isTimeout && (task.isDoing ?? false)
                      ? Padding(
                          padding: const AppPadding.smallAll(),
                          child: Assets.icons.progress.colored(
                            const Color(0xFF6C63FF),
                            height: 35.h,
                          ),
                        )
                      : task.isTimeout
                          ? Padding(
                              padding: const AppPadding.mediumAll(),
                              child: Assets.icons.timeout.colored(
                                context.colorScheme.errorContainer,
                                height: 20.h,
                              ),
                            )
                          : IconButton(
                              onPressed: onMarkAsDone,
                              icon: Icon(
                                CupertinoIcons.check_mark_circled_solid,
                                color: (task.isCompleted ?? false)
                                    ? CupertinoColors.systemGreen
                                    : CupertinoColors.lightBackgroundGray,
                              ),
                            ),
                ),
                CategoryCard(task: task),
              ],
            ),
          );
        },
      ),
    );
  }
}
