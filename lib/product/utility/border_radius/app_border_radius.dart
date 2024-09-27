import 'package:flutter/material.dart';
import 'package:task_management/product/utility/size/widget_sizes.dart';

/// Project general border radius items
final class AppBorderRadius extends BorderRadius {
  AppBorderRadius() : super.circular(WidgetSizes.zero);

  AppBorderRadius.circularSmall() : super.circular(WidgetSizes.spacingXs);

  AppBorderRadius.circularMedium() : super.circular(WidgetSizes.spacingS);

  AppBorderRadius.circularLarge() : super.circular(WidgetSizes.spacingXxl2);
}
