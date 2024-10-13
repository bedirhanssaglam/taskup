import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_management/product/components/text/locale_text.dart';
import 'package:task_management/product/utility/extensions/context_extensions.dart';
import 'package:task_management/product/utility/size/widget_sizes.dart';

final class Indicator extends StatelessWidget {
  const Indicator({
    required this.color,
    required this.text,
    super.key,
  });

  final Color color;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: WidgetSizes.spacingL.w,
          height: WidgetSizes.spacingL.h,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        WidgetSizes.spacingXxs.horizontalSpace,
        LocaleText(
          text,
          style: context.textTheme.bodyLarge,
        ),
      ],
    );
  }
}
