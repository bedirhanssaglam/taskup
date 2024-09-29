import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:task_management/product/components/dialog/category_dialog.dart';
import 'package:task_management/product/init/localization/locale_keys.g.dart';
import 'package:widget/widget.dart';

import '../../finder_match_extensions.dart';

void main() {
  testWidgets('should display category dialog title', (
    WidgetTester tester,
  ) async {
    // Arrange
    await tester.pumpWidget(
      AppResponsive(
        child: MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () {
                  BottomSheetBase.show<void>(
                    context: context,
                    builder: (context) => const CategoryDialog(),
                  );
                },
                child: const Text('Open Dialog'),
              ),
            ),
          ),
        ),
      ),
    );

    // Act
    await tester.tap(find.text('Open Dialog'));
    await tester.pumpAndSettle();

    // Assert
    find.text(LocaleKeys.category_title).once();
    expect(find.byType(GridView), findsOneWidget);
  });
}
