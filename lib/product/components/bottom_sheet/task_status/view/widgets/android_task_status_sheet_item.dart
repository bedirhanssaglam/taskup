part of '../task_status_bottom_sheet.dart';

final class _AndroidTaskStatusSheetItem extends StatelessWidget {
  const _AndroidTaskStatusSheetItem({
    required this.task,
    required this.onMarkAsDone,
    required this.onMarkAsProgress,
    required this.onDelete,
  });

  final Task task;
  final ValueSetter<bool> onMarkAsDone;
  final VoidCallback onMarkAsProgress;
  final AsyncValueSetter<String?> onDelete;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250.h,
      padding: const AppPadding.bigAll(),
      decoration: const BoxDecoration(
        borderRadius: AppBorderRadius.onlyTop(),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LocaleText(
            LocaleKeys.taskDetail_update,
            style: context.textTheme.titleLarge
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          if (!(task.isCompleted ?? false))
            ListTile(
              onTap: () {
                Navigator.pop(context);
                onMarkAsDone.call(true);
              },
              contentPadding: EdgeInsets.zero,
              title: LocaleText(LocaleKeys.task_markAsDone),
              trailing: const Icon(
                CupertinoIcons.check_mark_circled_solid,
                color: CupertinoColors.systemGreen,
              ),
            ),
          ListTile(
            onTap: () {
              Navigator.pop(context);
              onMarkAsDone.call(false);
            },
            contentPadding: EdgeInsets.zero,
            title: LocaleText(LocaleKeys.task_markAsToDo),
            trailing: const Icon(
              CupertinoIcons.check_mark_circled_solid,
              color: CupertinoColors.systemGrey,
            ),
          ),
          if (!(task.isDoing ?? false))
            ListTile(
              onTap: () {
                Navigator.pop(context);
                onMarkAsProgress.call();
              },
              contentPadding: EdgeInsets.zero,
              title: LocaleText(LocaleKeys.task_markAsProgress),
              trailing: Assets.icons.doing.show(
                height: 27.h,
              ),
            ),
          ListTile(
            onTap: () {
              Navigator.pop(context);
              onDelete.call(task.id);
            },
            contentPadding: EdgeInsets.zero,
            title: LocaleText(
              LocaleKeys.dialog_deleteTask_title,
              style: context.textTheme.bodyLarge?.copyWith(
                color: context.colorScheme.error,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
