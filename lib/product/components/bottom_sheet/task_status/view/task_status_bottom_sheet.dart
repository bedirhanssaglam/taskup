import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen/gen.dart';
import 'package:task_management/product/models/task.dart';
import 'package:task_management/product/utility/extensions/icon_extensions.dart';
import 'package:widget/widget.dart';

final class TaskStatusBottomSheet extends StatelessWidget {
  const TaskStatusBottomSheet({
    required this.task,
    required this.onMarkAsDone,
    required this.onMarkAsProgress,
    required this.onDelete,
    super.key,
  });

  final Task task;
  final VoidCallback onMarkAsDone;
  final VoidCallback onMarkAsProgress;
  final AsyncValueSetter<String?> onDelete;

  static Future<void> show(
    BuildContext context, {
    required Task task,
    required VoidCallback onMarkAsDone,
    required VoidCallback onMarkAsProgress,
    required AsyncValueSetter<String?> onDelete,
  }) async {
    return BottomSheetBase.show<void>(
      context: context,
      builder: (context) => TaskStatusBottomSheet(
        task: task,
        onMarkAsDone: onMarkAsDone,
        onDelete: onDelete,
        onMarkAsProgress: onMarkAsProgress,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoActionSheet(
      title: const Text('Güncelle'),
      message: const Text('Görev durumunu değiştir'),
      actions: <CupertinoActionSheetAction>[
        if (!(task.isCompleted ?? false))
          CupertinoActionSheetAction(
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Yapıldı olarak işaretle'),
                4.horizontalSpace,
                const Icon(
                  CupertinoIcons.check_mark_circled_solid,
                  color: CupertinoColors.systemGreen,
                ),
              ],
            ),
          ),
        if (task.isCompleted ?? false)
          CupertinoActionSheetAction(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Yapılacak olarak işaretle'),
                4.horizontalSpace,
                const Icon(
                  CupertinoIcons.check_mark_circled_solid,
                  color: CupertinoColors.systemGrey,
                ),
              ],
            ),
          ),
        CupertinoActionSheetAction(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Yapılıyor olarak işaretle'),
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
          },
          child: const Text('Görevi Sil'),
        ),
      ],
    );
  }
}
