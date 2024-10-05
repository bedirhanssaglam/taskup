import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:task_management/product/components/loading/app_loading.dart';

import '../../finder_match_extensions.dart';

void main() {
  testWidgets('AppLoading displays CircularProgressIndicator', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MaterialApp(home: AppLoading()));

    find.byType(CircularProgressIndicator).once();
  });
}
