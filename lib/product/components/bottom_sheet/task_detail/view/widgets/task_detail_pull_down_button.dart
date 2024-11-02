part of '../task_detail_bottom_sheet.dart';

final class _TaskDetailPullDownButton extends StatelessWidget {
  const _TaskDetailPullDownButton({
    required this.onShareTap,
    required this.onDeleteTap,
  });

  final VoidCallback onShareTap;
  final VoidCallback onDeleteTap;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      right: 0,
      child: Platform.isIOS
          ? PullDownButton(
              itemBuilder: (context) => [
                PullDownMenuItem(
                  title: LocaleKeys.task_share.locale,
                  onTap: () {
                    Navigator.pop(context);
                    onShareTap.call();
                  },
                  icon: CupertinoIcons.share,
                ),
                PullDownMenuItem(
                  title: LocaleKeys.dialog_deleteTask_delete.locale,
                  isDestructive: true,
                  onTap: () {
                    Navigator.pop(context);
                    onDeleteTap.call();
                  },
                  icon: CupertinoIcons.delete,
                ),
              ],
              buttonBuilder: (context, showMenu) => CupertinoButton(
                onPressed: showMenu,
                padding: EdgeInsets.zero,
                child: const Icon(CupertinoIcons.ellipsis_circle),
              ),
            )
          : MenuAnchor(
              style: MenuStyle(
                backgroundColor: MaterialStatePropertyAll(
                  context.colorScheme.background,
                ),
                elevation: const MaterialStatePropertyAll(1),
                shadowColor: MaterialStatePropertyAll(
                  context.colorScheme.primary.withOpacity(.3),
                ),
                shape: MaterialStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: AppBorderRadius.circularMedium(),
                  ),
                ),
                padding: const MaterialStatePropertyAll(AppPadding.smallAll()),
              ),
              builder: (
                BuildContext context,
                MenuController controller,
                Widget? child,
              ) {
                return IconButton(
                  onPressed: () {
                    controller.isOpen ? controller.close() : controller.open();
                  },
                  icon: const Icon(Icons.more_horiz_outlined),
                );
              },
              menuChildren: [
                MenuItemButton(
                  onPressed: () {
                    Navigator.pop(context);
                    onShareTap.call();
                  },
                  leadingIcon: Icon(Icons.share, size: 16.h),
                  child: LocaleText(LocaleKeys.task_share),
                ),
                MenuItemButton(
                  onPressed: () {
                    Navigator.pop(context);
                    onDeleteTap.call();
                  },
                  leadingIcon: Icon(Icons.delete, size: 16.h),
                  child: LocaleText(LocaleKeys.dialog_deleteTask_delete),
                ),
              ],
            ),
    );
  }
}
