import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen/gen.dart';
import 'package:task_management/product/components/text/locale_text.dart';
import 'package:task_management/product/init/localization/locale_keys.g.dart';
import 'package:task_management/product/models/task.dart';
import 'package:task_management/product/utility/border_radius/app_border_radius.dart';
import 'package:task_management/product/utility/extensions/context_extensions.dart';
import 'package:task_management/product/utility/extensions/icon_extensions.dart';
import 'package:task_management/product/utility/paddings/app_paddings.dart';
import 'package:widget/widget.dart';

part 'widgets/android_task_status_sheet_item.dart';
part 'widgets/ios_task_status_sheet_item.dart';

final class TaskStatusBottomSheet extends StatelessWidget {
  const TaskStatusBottomSheet({
    required this.task,
    required this.onMarkAsDone,
    required this.onMarkAsProgress,
    required this.onDelete,
    super.key,
  });

  final Task task;
  final ValueSetter<bool> onMarkAsDone;
  final VoidCallback onMarkAsProgress;
  final AsyncValueSetter<String?> onDelete;

  static Future<void> show(
    BuildContext context, {
    required Task task,
    required ValueSetter<bool> onMarkAsDone,
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
    return Platform.isIOS
        ? _IOSTaskStatusSheetItem(
            task: task,
            onMarkAsDone: onMarkAsDone,
            onMarkAsProgress: onMarkAsProgress,
            onDelete: onDelete,
          )
        : _AndroidTaskStatusSheetItem(
            task: task,
            onMarkAsDone: onMarkAsDone,
            onMarkAsProgress: onMarkAsProgress,
            onDelete: onDelete,
          );
  }
}
