import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_management/product/utility/border_radius/app_border_radius.dart';
import 'package:task_management/product/utility/extensions/context_extensions.dart';
import 'package:task_management/product/utility/extensions/date_time_extensions.dart';
import 'package:task_management/product/utility/paddings/app_paddings.dart';
import 'package:task_management/product/utility/size/widget_sizes.dart';

final class DateTile extends StatelessWidget {
  const DateTile({
    required this.date,
    required this.isSelected,
    super.key,
  });

  final DateTime date;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60.w,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        borderRadius: AppBorderRadius.circularMedium(),
        color: isSelected
            ? context.colorScheme.primary
            : context.colorScheme.outlineVariant,
      ),
      padding: const AppPadding.mediumAll(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            date.formatDayOfWeek,
            style: context.textTheme.bodyMedium?.copyWith(
              color: isSelected
                  ? context.colorScheme.background
                  : context.colorScheme.onBackground,
            ),
          ),
          WidgetSizes.spacingXSs.verticalSpace,
          Text(
            date.formatDayOfMonth,
            style: context.textTheme.bodyLarge?.copyWith(
              color: isSelected
                  ? context.colorScheme.background
                  : context.colorScheme.onBackground,
            ),
          ),
        ],
      ),
    );
  }
}
