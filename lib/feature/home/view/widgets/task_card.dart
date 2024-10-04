import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen/gen.dart';
import 'package:task_management/product/base/model/note.dart';
import 'package:task_management/product/utility/border_radius/app_border_radius.dart';
import 'package:task_management/product/utility/extensions/context_extensions.dart';
import 'package:task_management/product/utility/extensions/icon_extensions.dart';
import 'package:task_management/product/utility/extensions/timestamp_extensions.dart';
import 'package:task_management/product/utility/paddings/app_paddings.dart';
import 'package:task_management/product/utility/size/widget_sizes.dart';

final class TaskCard extends StatelessWidget {
  const TaskCard({
    required this.task,
    super.key,
  });

  final Task task;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: context.colorScheme.onPrimary,
      shape: RoundedRectangleBorder(
        borderRadius: AppBorderRadius.circularMedium(),
      ),
      child: ListTile(
        onTap: () {},
        shape: RoundedRectangleBorder(
          borderRadius: AppBorderRadius.circularMedium(),
        ),
        title: Text(
          task.title ?? '',
          style: context.textTheme.titleLarge,
        ),
        subtitle: Text(task.date!.convertDate),
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
    );
  }
}
