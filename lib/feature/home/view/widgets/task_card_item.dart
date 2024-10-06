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
            child: Card(
              elevation: 0,
              color: context.colorScheme.onPrimary,
              shape: RoundedRectangleBorder(
                borderRadius: AppBorderRadius.circularMedium(),
              ),
              child: IntrinsicWidth(
                stepWidth: 1.sw,
                child: ListTile(
                  onTap: () {
                    /// TODO: Show details
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: AppBorderRadius.circularMedium(),
                  ),
                  title: Text(
                    task.title ?? '',
                    style: context.textTheme.titleLarge,
                  ),
                  subtitle: Text(task.date?.convertDate ?? ''),
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
              ),
            ),
          );
        },
      ),
    );
  }
}
