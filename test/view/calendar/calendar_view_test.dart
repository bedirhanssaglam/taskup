import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:task_management/feature/calendar/view/widgets/calendar_task_list.dart';
import 'package:task_management/product/components/button/app_text_button.dart';
import 'package:task_management/product/init/localization/locale_keys.g.dart';
import 'package:widget/widget.dart';

import '../../finder_match_extensions.dart';

void main() {
  testWidgets('should show "no tasks" message when there are no tasks', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      ProviderScope(
        child: AppResponsive(
          child: MaterialApp(
            home: Scaffold(
              body: CalendarTaskList(
                tasks: const [],
                onDelete: (value) async {},
              ),
            ),
          ),
        ),
      ),
    );

    find.text(LocaleKeys.calendar_thereAreNoTaskForTheSelectedDate).once();
    find.byType(AppTextButton).once();
  });
}
