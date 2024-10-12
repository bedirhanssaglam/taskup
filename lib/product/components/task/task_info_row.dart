import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen/gen.dart';
import 'package:task_management/product/components/task/calendar_icon.dart';
import 'package:task_management/product/models/task.dart';
import 'package:task_management/product/utility/border_radius/app_border_radius.dart';
import 'package:task_management/product/utility/extensions/context_extensions.dart';
import 'package:task_management/product/utility/extensions/icon_extensions.dart';
import 'package:task_management/product/utility/extensions/timestamp_extensions.dart';
import 'package:task_management/product/utility/paddings/app_paddings.dart';
import 'package:task_management/product/utility/size/widget_sizes.dart';

final class TaskInfoRow extends StatelessWidget {
  const TaskInfoRow({
    required this.task,
    super.key,
  });

  final Task task;

  @override
  Widget build(BuildContext context) {
    return Row(
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
            WidgetSizes.spacingXxs.verticalSpace,
            Text(
              task.date?.convertDate ?? '',
              style: context.textTheme.bodyMedium,
            ),
            WidgetSizes.spacingXxs.verticalSpace,
            Container(
              padding: const AppPadding.smallAll(),
              decoration: BoxDecoration(
                border: Border.all(
                  color: context.colorScheme.primary,
                ),
                borderRadius: AppBorderRadius.circularSmall(),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Assets.icons.flag.colored(
                    context.colorScheme.primary,
                    height: WidgetSizes.spacingL.h,
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
    );
  }
}
