import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:task_management/feature/auth/starting/view/starting_view.dart';
import 'package:task_management/product/components/button/app_button.dart';
import 'package:task_management/product/components/text/locale_text.dart';
import 'package:widget/widget.dart';

import '../../../finder_match_extensions.dart';

void main() {
  testWidgets('StartingView renders correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      const AppResponsive(
        child: MaterialApp(
          home: StartingView(),
        ),
      ),
    );

    find.byType(LocaleText).times(2);
    find.byType(Image).once();
    find.byType(AppButton).once();
  });
}
