import 'package:flutter/material.dart';
import 'package:task_management/product/utility/size/widget_sizes.dart';

/// Project general padding items
final class AppPadding extends EdgeInsets {
  const AppPadding() : super.all(WidgetSizes.zero);

  const AppPadding.smallAll() : super.all(WidgetSizes.spacingXxs);

  const AppPadding.mediumAll() : super.all(WidgetSizes.spacingS);

  const AppPadding.largeAll() : super.all(WidgetSizes.spacingXl);

  const AppPadding.smallHorizontal()
      : super.symmetric(
          horizontal: WidgetSizes.spacingXs,
        );

  const AppPadding.normalHorizontal()
      : super.symmetric(
          horizontal: WidgetSizes.spacingXl,
        );

  const AppPadding.smallVertical()
      : super.symmetric(
          vertical: WidgetSizes.spacingXxs,
        );

  const AppPadding.mediumVertical()
      : super.symmetric(
          vertical: WidgetSizes.spacingS,
        );

  const AppPadding.smallVerticalAndHorizontal()
      : super.symmetric(
          vertical: WidgetSizes.spacingXxs,
          horizontal: WidgetSizes.spacingXs,
        );

  const AppPadding.mediumBottom() : super.only(bottom: WidgetSizes.spacingL);
}
