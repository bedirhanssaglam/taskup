import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen/gen.dart';
import 'package:task_management/product/components/button/app_text_button.dart';
import 'package:task_management/product/components/draggable_line/draggable_line.dart';
import 'package:task_management/product/components/text/locale_text.dart';
import 'package:task_management/product/init/localization/locale_keys.g.dart';
import 'package:task_management/product/models/category.dart';
import 'package:task_management/product/models/task.dart';
import 'package:task_management/product/utility/border_radius/app_border_radius.dart';
import 'package:task_management/product/utility/extensions/context_extensions.dart';
import 'package:task_management/product/utility/extensions/icon_extensions.dart';
import 'package:task_management/product/utility/extensions/task_extensions.dart';
import 'package:task_management/product/utility/extensions/timestamp_extensions.dart';
import 'package:task_management/product/utility/paddings/app_paddings.dart';
import 'package:task_management/product/utility/size/widget_sizes.dart';
import 'package:task_management/product/utility/task_filter_helper.dart';
import 'package:widget/widget.dart';

part 'widgets/task_category.dart';
part 'widgets/task_date.dart';
part 'widgets/task_divider.dart';
part 'widgets/task_status.dart';
part 'widgets/task_title_and_description.dart';

final class TaskDetailBottomSheet extends ConsumerStatefulWidget {
  const TaskDetailBottomSheet({
    required this.task,
    required this.onUpdateTap,
    super.key,
  });

  final Task task;
  final VoidCallback onUpdateTap;

  static Future<FilterCriteria?> show(
    BuildContext context, {
    required Task task,
    required VoidCallback onUpdateTap,
  }) async {
    return BottomSheetBase.show<FilterCriteria>(
      context: context,
      builder: (context) => TaskDetailBottomSheet(
        task: task,
        onUpdateTap: onUpdateTap,
      ),
    );
  }

  @override
  ConsumerState<TaskDetailBottomSheet> createState() =>
      _TaskDetailBottomSheetState();
}

class _TaskDetailBottomSheetState extends ConsumerState<TaskDetailBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450.w,
      width: 1.sw,
      padding: const AppPadding.largeAll(),
      decoration: BoxDecoration(
        color: context.colorScheme.background,
        borderRadius: const AppBorderRadius.onlyTop(),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const DraggableLine(),
          _TaskTitleAndDescription(task: widget.task),
          const Spacer(),
          const Divider(),
          WidgetSizes.spacingXSs.verticalSpace,
          _TaskDate(date: widget.task.date),
          const _TaskDivider(),
          _TaskCategory(category: widget.task.category),
          const _TaskDivider(),
          _TaskStatus(
            task: widget.task,
            onUpdateTap: widget.onUpdateTap,
          ),
        ],
      ),
    );
  }
}
