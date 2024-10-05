import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gen/gen.dart';
import 'package:task_management/feature/calendar/view/widgets/calendar_task_list.dart';
import 'package:task_management/product/components/button/app_text_button.dart';
import 'package:task_management/product/components/dialog/category.dart';
import 'package:task_management/product/init/localization/locale_keys.g.dart';
import 'package:task_management/product/models/task.dart';
import 'package:widget/widget.dart';

import '../../finder_match_extensions.dart';

void main() {
  group('CalendarTaskList widget tests', () {
    testWidgets('should show Card widget when there is a task', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        ProviderScope(
          child: AppResponsive(
            child: MaterialApp(
              home: Scaffold(
                body: CalendarTaskList(
                  tasks: [
                    Task(
                      id: '1',
                      category: Category(
                        name: 'name',
                        color: Colors.red,
                        icon: Assets.icons.health,
                      ),
                      createdAt: Timestamp(1, 1),
                      date: Timestamp(1, 1),
                      description: 'description',
                      priority: '1',
                      title: 'title',
                    ),
                  ],
                  onDelete: (value) async {},
                ),
              ),
            ),
          ),
        ),
      );

      find.byType(Card).once();
    });

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
  });
}
