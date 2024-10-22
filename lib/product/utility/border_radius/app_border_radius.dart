import 'package:flutter/material.dart';
import 'package:task_management/product/utility/size/widget_sizes.dart';

final class AppBorderRadius extends BorderRadius {
  AppBorderRadius() : super.circular(WidgetSizes.zero);

  AppBorderRadius.circularSuperSmall() : super.circular(WidgetSizes.spacingXSs);

  AppBorderRadius.circularSmall() : super.circular(WidgetSizes.spacingXs);

  AppBorderRadius.circularMedium() : super.circular(WidgetSizes.spacingS);

  AppBorderRadius.circularBig() : super.circular(WidgetSizes.spacingM);

  AppBorderRadius.circularLarge() : super.circular(WidgetSizes.spacingXxl2);

  const AppBorderRadius.onlyTop()
      : super.only(
          topRight: const Radius.circular(WidgetSizes.spacingXxl2),
          topLeft: const Radius.circular(WidgetSizes.spacingXxl2),
        );
}
