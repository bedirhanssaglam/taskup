import 'dart:io' show Platform;

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen/gen.dart';
import 'package:task_management/feature/home/view/widgets/calendar_icon.dart';
import 'package:task_management/product/components/dialog/delete_task_dialog.dart';
import 'package:task_management/product/components/text/locale_text.dart';
import 'package:task_management/product/init/localization/locale_keys.g.dart';
import 'package:task_management/product/models/task.dart';
import 'package:task_management/product/utility/border_radius/app_border_radius.dart';
import 'package:task_management/product/utility/extensions/context_extensions.dart';
import 'package:task_management/product/utility/extensions/icon_extensions.dart';
import 'package:task_management/product/utility/extensions/timestamp_extensions.dart';
import 'package:task_management/product/utility/paddings/app_paddings.dart';
import 'package:task_management/product/utility/size/widget_sizes.dart';

part 'task_card_item.dart';

final class TaskCard extends StatelessWidget {
  const TaskCard({
    required this.task,
    required this.onDelete,
    super.key,
  });

  final Task task;
  final AsyncValueSetter<String?> onDelete;

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoContextMenu(
            enableHapticFeedback: true,
            actions: [
              CupertinoContextMenuAction(
                onPressed: () {
                  Navigator.pop(context);
                },
                trailingIcon: Icons.edit,
                child: LocaleText(LocaleKeys.task_edit),
              ),
              CupertinoContextMenuAction(
                onPressed: () {
                  Navigator.pop(context);
                },
                trailingIcon: CupertinoIcons.share,
                child: LocaleText(LocaleKeys.task_share),
              ),
              CupertinoContextMenuAction(
                onPressed: () {
                  Navigator.pop(context);
                  // _markTaskAsComplete();
                },
                trailingIcon: Icons.assignment_turned_in,
                child: LocaleText(LocaleKeys.task_markAsDone),
              ),
              CupertinoContextMenuAction(
                onPressed: () {
                  Navigator.pop(context);
                  onDelete.call(task.id);
                },
                isDestructiveAction: true,
                trailingIcon: CupertinoIcons.delete,
                child: LocaleText(LocaleKeys.dialog_deleteTask_delete),
              ),
            ],
            child: _TaskCardItem(task: task, onDelete: onDelete),
          )
        : _TaskCardItem(task: task, onDelete: onDelete);
  }
}
