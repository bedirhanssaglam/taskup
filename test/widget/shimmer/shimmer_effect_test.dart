import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shimmer/shimmer.dart';
import 'package:task_management/product/components/shimmer/shimmer_effect.dart';
import 'package:widget/widget.dart';

import '../../finder_match_extensions.dart';

void main() {
  group('ShimmerEffect widget tests', () {
    testWidgets('should display a shimmer effect with default values', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const AppResponsive(
          child: MaterialApp(
            home: Scaffold(
              body: ShimmerEffect(),
            ),
          ),
        ),
      );

      find.byType(Shimmer).once();

      find.byType(SizedBox).once();
      final shimmerBox = tester.widget<SizedBox>(find.byType(SizedBox));
      expect(shimmerBox.height, 0.07.sh);
      expect(shimmerBox.width, 1.sw);
    });

    testWidgets('should display a shimmer effect with a custom child', (
      WidgetTester tester,
    ) async {
      final customChild = Container(color: Colors.red, height: 50, width: 50);

      await tester.pumpWidget(
        AppResponsive(
          child: MaterialApp(
            home: Scaffold(
              body: ShimmerEffect(child: customChild),
            ),
          ),
        ),
      );

      find.byType(Shimmer).once();
      find.byWidget(customChild).once();
    });
  });
}
