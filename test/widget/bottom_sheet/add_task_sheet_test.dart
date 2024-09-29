import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:task_management/product/components/bottom_sheet/add_task/add_task_sheet.dart';
import 'package:widget/widget.dart';

import '../../finder_match_extensions.dart';

void main() {
  testWidgets('Should display AddTaskBottomSheet UI elements', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      AppResponsive(
        child: MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) {
                return ElevatedButton(
                  onPressed: () {
                    AddTaskBottomSheet.show(context);
                  },
                  child: const Text('Open Bottom Sheet'),
                );
              },
            ),
          ),
        ),
      ),
    );
    await tester.tap(find.text('Open Bottom Sheet'));
    await tester.pumpAndSettle();

    find.byType(TextField).times(2);
  });
}
