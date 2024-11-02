part of '../task_status_bottom_sheet.dart';

final class _IOSTaskStatusSheetItem extends StatelessWidget {
  const _IOSTaskStatusSheetItem({
    required this.task,
    required this.onMarkAsDone,
    required this.onMarkAsProgress,
    required this.onDelete,
  });

  final Task task;
  final AsyncValueSetter<bool> onMarkAsDone;
  final VoidCallback onMarkAsProgress;
  final AsyncValueSetter<String?> onDelete;

  @override
  Widget build(BuildContext context) {
    return CupertinoActionSheet(
      title: LocaleText(LocaleKeys.taskDetail_update),
      message: LocaleText(LocaleKeys.task_changeTaskStatus),
      actions: <CupertinoActionSheetAction>[
        if (!(task.isCompleted ?? false))
          CupertinoActionSheetAction(
            isDefaultAction: true,
            onPressed: () async {
              Navigator.pop(context);
              await onMarkAsDone.call(true);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LocaleText(LocaleKeys.task_markAsDone),
                4.horizontalSpace,
                const Icon(
                  CupertinoIcons.check_mark_circled_solid,
                  color: CupertinoColors.systemGreen,
                ),
              ],
            ),
          ),
        if ((task.isCompleted ?? false) || (task.isDoing ?? false))
          CupertinoActionSheetAction(
            onPressed: () {
              Navigator.pop(context);
              onMarkAsDone.call(false);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LocaleText(LocaleKeys.task_markAsToDo),
                4.horizontalSpace,
                const Icon(
                  CupertinoIcons.check_mark_circled_solid,
                  color: CupertinoColors.systemGrey,
                ),
              ],
            ),
          ),
        if (!(task.isDoing ?? false))
          CupertinoActionSheetAction(
            onPressed: () {
              Navigator.pop(context);
              onMarkAsProgress.call();
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LocaleText(LocaleKeys.task_markAsProgress),
                4.horizontalSpace,
                Assets.icons.doing.show(
                  height: 25.h,
                ),
              ],
            ),
          ),
        CupertinoActionSheetAction(
          isDestructiveAction: true,
          onPressed: () {
            Navigator.pop(context);
            onDelete.call(task.id);
          },
          child: LocaleText(LocaleKeys.dialog_deleteTask_title),
        ),
      ],
    );
  }
}
