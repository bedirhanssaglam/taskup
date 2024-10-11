import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_management/product/utility/border_radius/app_border_radius.dart';
import 'package:task_management/product/utility/extensions/context_extensions.dart';
import 'package:task_management/product/utility/size/widget_sizes.dart';

final class CalendarIcon extends StatelessWidget {
  const CalendarIcon({required this.date, super.key});

  final DateTime date;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 53.w,
      height: 53.h,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        color: CupertinoColors.systemRed.withOpacity(.6),
        borderRadius: AppBorderRadius.circularSuperSmall(),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            context.monthShortName(date),
            style: context.textTheme.bodySmall?.copyWith(
              color: context.colorScheme.background,
              fontWeight: FontWeight.bold,
            ),
          ),
          WidgetSizes.spacingXSS.verticalSpace,
          Container(
            padding: const EdgeInsets.symmetric(vertical: 4),
            decoration: BoxDecoration(
              color: context.colorScheme.background,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(5),
                bottomRight: Radius.circular(5),
              ),
            ),
            child: Center(
              child: Text(
                '${date.day}',
                style: context.textTheme.bodySmall?.copyWith(
                  color: context.colorScheme.onBackground,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
