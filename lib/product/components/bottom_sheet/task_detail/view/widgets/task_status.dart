part of '../task_detail_bottom_sheet.dart';

final class _TaskStatus extends StatelessWidget {
  const _TaskStatus({
    required this.task,
    required this.onUpdateTap,
  });

  final Task task;
  final VoidCallback onUpdateTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            LocaleText(
              LocaleKeys.taskDetail_status,
              style: context.textTheme.bodyLarge,
            ),
            if (task.isTimeout)
              Padding(
                padding: const AppPadding.mediumAll(),
                child: Assets.icons.timeout.colored(
                  context.colorScheme.error,
                  height: 20.h,
                ),
              )
            else
              (task.isDoing ?? false) &&
                      !task.isTimeout &&
                      !(task.isCompleted ?? false)
                  ? Padding(
                      padding: const AppPadding.smallAll(),
                      child: Assets.icons.doing.show(
                        height: 30.h,
                      ),
                    )
                  : Icon(
                      CupertinoIcons.check_mark_circled_solid,
                      color: (task.isCompleted ?? false)
                          ? CupertinoColors.systemGreen
                          : CupertinoColors.lightBackgroundGray,
                    ),
          ],
        ),
        if (!task.isTimeout)
          AppTextButton(
            text: LocaleKeys.taskDetail_update,
            onPressed: onUpdateTap,
          ),
      ],
    );
  }
}
