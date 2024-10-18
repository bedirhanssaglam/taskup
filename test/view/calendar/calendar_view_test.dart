import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:task_management/feature/calendar/view/widgets/calendar_task_list.dart';
import 'package:task_management/product/components/text/locale_text.dart';
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
                onMarkAsDone: (value) async {},
                onDelete: (value) async {},
              ),
            ),
          ),
        ),
      ),
    );

    find.byType(LocaleText).times(2);
    find.text(LocaleKeys.calendar_noTaskTitle).once();
    find.text(LocaleKeys.calendar_noTaskSubtitle).once();
  });
}
