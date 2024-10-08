import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_management/feature/calendar/view/widgets/calendar_task_list.dart';
import 'package:task_management/feature/calendar/view/widgets/date_selector.dart';
import 'package:task_management/feature/calendar/view_model/calendar_state.dart';
import 'package:task_management/feature/calendar/view_model/calendar_view_model.dart';
import 'package:task_management/product/components/loading/app_loading.dart';
import 'package:task_management/product/components/text/locale_text.dart';
import 'package:task_management/product/init/localization/locale_keys.g.dart';
import 'package:task_management/product/models/task.dart';
import 'package:task_management/product/models/update_task_data.dart';
import 'package:task_management/product/utility/extensions/date_time_extensions.dart';

part './mixin/calendar_view_mixin.dart';

class CalendarView extends ConsumerStatefulWidget {
  const CalendarView({super.key});

  @override
  ConsumerState<CalendarView> createState() => _CalendarViewState();
}

class _CalendarViewState extends ConsumerState<CalendarView>
    with _CalendarViewMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: LocaleText(LocaleKeys.bottomNavBar_calendar),
        automaticallyImplyLeading: false,
      ),
      body: calendarState.when(
        data: (CalendarState state) => Column(
          children: [
            ValueListenableBuilder<DateTime>(
              valueListenable: selectedDate,
              builder: (context, value, _) {
                return DateSelector(
                  currentDate: value,
                  onDateSelected: (date) => selectedDate.value = date,
                );
              },
            ),
            Expanded(
              child: ValueListenableBuilder<DateTime>(
                valueListenable: selectedDate,
                builder: (context, value, _) {
                  return CalendarTaskList(
                    tasks: _filterTasksByDate(state.tasks!, value),
                    onDelete: deleteTask,
                    onMarkAsDone: (task) => updateTask(updateTaskData: task),
                  );
                },
              ),
            ),
          ],
        ),
        loading: AppLoading.new,
        error: (error, _) => Center(child: Text(error.toString())),
      ),
    );
  }
}
