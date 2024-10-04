import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_management/feature/calendar/view_model/calendar_state.dart';
import 'package:task_management/feature/calendar/view_model/calendar_view_model.dart';
import 'package:task_management/feature/home/view/widgets/task_card.dart';
import 'package:task_management/product/base/model/note.dart';
import 'package:task_management/product/components/tap_area/tap_area.dart';
import 'package:task_management/product/components/text/locale_text.dart';
import 'package:task_management/product/init/localization/locale_keys.g.dart';
import 'package:task_management/product/utility/border_radius/app_border_radius.dart';
import 'package:task_management/product/utility/extensions/context_extensions.dart';
import 'package:task_management/product/utility/extensions/date_time_extensions.dart';
import 'package:task_management/product/utility/paddings/app_paddings.dart';
import 'package:task_management/product/utility/size/widget_sizes.dart';

part './mixin/calendar_view_mixin.dart';
part './widgets/date_selector.dart';
part 'widgets/calendar_task_list.dart';

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
            DateSelector(
              currentDate: selectedDate,
              onDateSelected: (date) => setState(() => selectedDate = date),
            ),
            Expanded(
              child: _CalendarTaskList(
                tasks: _filterTasksByDate(state.tasks!, selectedDate),
              ),
            ),
          ],
        ),
        loading: () => const Center(
          child: CircularProgressIndicator.adaptive(),
        ),
        error: (error, _) => Center(child: Text(error.toString())),
      ),
    );
  }

  List<Task> _filterTasksByDate(List<Task> tasks, DateTime date) {
    return tasks
        .where((task) => task.date?.toDate().isSameDate(date) ?? false)
        .toList();
  }
}
