import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_management/product/utility/border_radius/app_border_radius.dart';
import 'package:task_management/product/utility/size/widget_sizes.dart';

final class DraggableLine extends StatelessWidget {
  const DraggableLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: WidgetSizes.spacingXxl4.w,
        height: WidgetSizes.spacingXxs.h,
        margin: EdgeInsets.only(bottom: 12.h),
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: AppBorderRadius.circularSmall(),
        ),
      ),
    );
  }
}
