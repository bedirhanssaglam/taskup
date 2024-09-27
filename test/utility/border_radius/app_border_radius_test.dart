import 'package:flutter_test/flutter_test.dart';
import 'package:task_management/product/utility/border_radius/app_border_radius.dart';
import 'package:task_management/product/utility/size/widget_sizes.dart';

void main() {
  group('AppBorderRadius Tests', () {
    test('AppBorderRadius.zero should have zero radius', () {
      final borderRadius = AppBorderRadius();
      expect(borderRadius.topLeft.x, equals(WidgetSizes.zero));
    });

    test('AppBorderRadius.circularSmall should have correct radius', () {
      final borderRadius = AppBorderRadius.circularSmall();
      expect(borderRadius.topLeft.x, equals(WidgetSizes.spacingXs));
    });

    test('AppBorderRadius.circularMedium should have correct radius', () {
      final borderRadius = AppBorderRadius.circularMedium();
      expect(borderRadius.topLeft.x, equals(WidgetSizes.spacingS));
    });

    test('AppBorderRadius.circularLarge should have correct radius', () {
      final borderRadius = AppBorderRadius.circularLarge();
      expect(borderRadius.topLeft.x, equals(WidgetSizes.spacingXxl2));
    });
  });

  group('WidgetSizes Tests', () {
    test('WidgetSizes.zero should be 0.0', () {
      expect(WidgetSizes.zero, equals(0.0));
    });

    test('WidgetSizes.spacingXs should be 8.0', () {
      expect(WidgetSizes.spacingXs, equals(8.0));
    });

    test('WidgetSizes.spacingXxl2 should be 32.0', () {
      expect(WidgetSizes.spacingXxl2, equals(32.0));
    });

    test('WidgetSizes.spacingXxl12 should be 100.0', () {
      expect(WidgetSizes.spacingXxl12, equals(100.0));
    });

    test('WidgetSizes.spacingXxlL14 should be 300.0', () {
      expect(WidgetSizes.spacingXxlL14, equals(300.0));
    });
  });
}
