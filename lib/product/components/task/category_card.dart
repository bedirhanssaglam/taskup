import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_management/product/models/task.dart';
import 'package:task_management/product/utility/border_radius/app_border_radius.dart';
import 'package:task_management/product/utility/extensions/icon_extensions.dart';
import 'package:task_management/product/utility/paddings/app_paddings.dart';

final class CategoryCard extends StatelessWidget {
  const CategoryCard({
    required this.task,
    super.key,
  });

  final Task task;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 12.h,
      right: 12.h,
      child: Container(
        padding: const AppPadding.smallAll(),
        decoration: BoxDecoration(
          color: task.category!.color,
          borderRadius: AppBorderRadius.circularSmall(),
        ),
        child: task.category!.icon.show(),
      ),
    );
  }
}