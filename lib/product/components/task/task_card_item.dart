part of 'task_card.dart';

final class _TaskCardItem extends StatelessWidget {
  const _TaskCardItem({
    required this.task,
    required this.onDelete,
    required this.onMarkAsDone,
    required this.onMarkAsProgress,
    this.showCalendar = true,
  });

  final Task task;
  final AsyncValueSetter<String?> onDelete;
  final ValueSetter<bool> onMarkAsDone;
  final VoidCallback onMarkAsProgress;
  final bool showCalendar;

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
                TapArea(
                  onTap: () {
                    TaskDetailBottomSheet.show(
                      context,
                      task: task,
                      onUpdateTap: () {
                        Navigator.pop(context);
                        TaskStatusBottomSheet.show(
                          context,
                          task: task,
                          onMarkAsDone: onMarkAsDone,
                          onMarkAsProgress: onMarkAsProgress,
                          onDelete: onDelete,
                        );
                      },
                    );
                  },
                  child: Card(
                    elevation: 0,
                    color: context.colorScheme.onPrimary,
                    shape: RoundedRectangleBorder(
                      borderRadius: AppBorderRadius.circularMedium(),
                    ),
                    child: IntrinsicWidth(
                      stepWidth: 1.sw,
                      child: Padding(
                        padding: EdgeInsets.all(20.h),
                        child: TaskInfoRow(
                          task: task,
                          showCalendar: showCalendar,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 3.h,
                  right: 3.w,
                  child: task.isTimeout
                      ? Padding(
                          padding: const AppPadding.mediumAll(),
                          child: Assets.icons.timeout.colored(
                            context.colorScheme.error,
                            height: 20.h,
                          ),
                        )
                      : (task.isDoing ?? false) && !task.isTimeout && !(task.isCompleted ?? false)
                          ? Padding(
                              padding: const AppPadding.smallAll(),
                              child: Assets.icons.doing.show(
                                height: 30.h,
                              ),
                            )
                          : IconButton(
                              onPressed: () {
                                onMarkAsDone.call(!(task.isCompleted ?? false));
                              },
                              icon: Icon(
                                CupertinoIcons.check_mark_circled_solid,
                                color: (task.isCompleted ?? false) ? CupertinoColors.systemGreen : CupertinoColors.lightBackgroundGray,
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
