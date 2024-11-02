import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen/gen.dart';
import 'package:task_management/product/components/text/locale_text.dart';
import 'package:task_management/product/init/localization/locale_keys.g.dart';
import 'package:task_management/product/utility/extensions/context_extensions.dart';
import 'package:task_management/product/utility/extensions/lottie_extensions.dart';
import 'package:task_management/product/utility/size/widget_sizes.dart';

final class EmptyCalendarWidget extends StatelessWidget {
  const EmptyCalendarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Assets.lottie.emptyCalendar.show(
            height: WidgetSizes.spacingXxlL12.h,
            width: WidgetSizes.spacingXxlL12.w,
          ),
          LocaleText(
            LocaleKeys.calendar_noTaskTitle,
            style: context.textTheme.titleLarge,
          ),
          WidgetSizes.spacingXxs.verticalSpace,
          LocaleText(
            LocaleKeys.calendar_noTaskSubtitle,
            style: context.textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
