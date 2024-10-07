part of 'task_card.dart';

final class _TaskCardItem extends StatelessWidget {
  const _TaskCardItem({
    required this.task,
    required this.onDelete,
  });

  final Task task;
  final AsyncValueSetter<String?> onDelete;

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
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CalendarIcon(date: task.date!.toDate()),
                          WidgetSizes.spacingXxl.horizontalSpace,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: .6.sw,
                                child: Text(
                                  task.title ?? '',
                                  style: context.textTheme.titleLarge,
                                ),
                              ),
                              4.verticalSpace,
                              Text(
                                task.date?.convertDate ?? '',
                                style: context.textTheme.bodyMedium,
                              ),
                              WidgetSizes.spacingXxs.verticalSpace,
                              Container(
                                padding: const AppPadding.smallAll(),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: context.colorScheme.primary),
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
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 12.h,
                  right: 12.h,
                  child: const Icon(
                    CupertinoIcons.check_mark_circled_solid,
                    color: CupertinoColors.systemGreen,
                  ),
                ),
                _CategoryCard(task: task),
              ],
            ),
          );
        },
      ),
    );
  }
}

final class _CategoryCard extends StatelessWidget {
  const _CategoryCard({
    required this.task,
  });

  final Task task;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 12.h,
      right: 12.h,
      child: Container(
        padding: const AppPadding.smallAll(),
        decoration: BoxDecoration(
          color: task.category!.color,
          borderRadius: AppBorderRadius.circularSmall(),
        ),
        child: task.category!.icon.show(),
      ),
    );
  }
}
