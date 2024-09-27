import 'package:flutter_test/flutter_test.dart';
import 'package:task_management/product/utility/paddings/app_paddings.dart';
import 'package:task_management/product/utility/size/widget_sizes.dart';

void main() {
  group('AppPadding - All Padding Values', () {
    test('should have zero padding for default constructor', () {
      const padding = AppPadding();
      expect(padding.left, equals(WidgetSizes.zero));
      expect(padding.top, equals(WidgetSizes.zero));
      expect(padding.right, equals(WidgetSizes.zero));
      expect(padding.bottom, equals(WidgetSizes.zero));
    });

    test('should apply small padding to all sides', () {
      const padding = AppPadding.smallAll();
      expect(padding.left, equals(WidgetSizes.spacingXxs));
      expect(padding.top, equals(WidgetSizes.spacingXxs));
      expect(padding.right, equals(WidgetSizes.spacingXxs));
      expect(padding.bottom, equals(WidgetSizes.spacingXxs));
    });

    test('should apply medium padding to all sides', () {
      const padding = AppPadding.mediumAll();
      expect(padding.left, equals(WidgetSizes.spacingS));
      expect(padding.top, equals(WidgetSizes.spacingS));
      expect(padding.right, equals(WidgetSizes.spacingS));
      expect(padding.bottom, equals(WidgetSizes.spacingS));
    });

    test('should apply large padding to all sides', () {
      const padding = AppPadding.largeAll();
      expect(padding.left, equals(WidgetSizes.spacingXl));
      expect(padding.top, equals(WidgetSizes.spacingXl));
      expect(padding.right, equals(WidgetSizes.spacingXl));
      expect(padding.bottom, equals(WidgetSizes.spacingXl));
    });
  });

  group('AppPadding - Symmetric Padding Values', () {
    test('should apply small horizontal padding', () {
      const padding = AppPadding.smallHorizontal();
      expect(padding.left, equals(WidgetSizes.spacingXs));
      expect(padding.right, equals(WidgetSizes.spacingXs));
      expect(padding.top, equals(WidgetSizes.zero));
      expect(padding.bottom, equals(WidgetSizes.zero));
    });

    test('should apply normal horizontal padding', () {
      const padding = AppPadding.normalHorizontal();
      expect(padding.left, equals(WidgetSizes.spacingXl));
      expect(padding.right, equals(WidgetSizes.spacingXl));
      expect(padding.top, equals(WidgetSizes.zero));
      expect(padding.bottom, equals(WidgetSizes.zero));
    });

    test('should apply small vertical padding', () {
      const padding = AppPadding.smallVertical();
      expect(padding.top, equals(WidgetSizes.spacingXxs));
      expect(padding.bottom, equals(WidgetSizes.spacingXxs));
      expect(padding.left, equals(WidgetSizes.zero));
      expect(padding.right, equals(WidgetSizes.zero));
    });

    test('should apply medium vertical padding', () {
      const padding = AppPadding.mediumVertical();
      expect(padding.top, equals(WidgetSizes.spacingS));
      expect(padding.bottom, equals(WidgetSizes.spacingS));
      expect(padding.left, equals(WidgetSizes.zero));
      expect(padding.right, equals(WidgetSizes.zero));
    });
  });

  group('AppPadding - Specific Direction Padding', () {
    test('should apply medium padding only to the bottom', () {
      const padding = AppPadding.mediumBottom();
      expect(padding.bottom, equals(WidgetSizes.spacingL));
      expect(padding.left, equals(WidgetSizes.zero));
      expect(padding.right, equals(WidgetSizes.zero));
      expect(padding.top, equals(WidgetSizes.zero));
    });
  });
}
