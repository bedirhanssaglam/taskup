import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:task_management/feature/calendar/view_model/calendar_state.dart';
import 'package:task_management/product/base/model/note.dart';
import 'package:task_management/product/state/product_provider_items.dart';

part 'calendar_view_model.g.dart';

@riverpod
class CalendarViewModel extends _$CalendarViewModel {
  @override
  AsyncValue<CalendarState> build() => const AsyncValue.data(CalendarState());

  Future<void> fetchTasks() async {
    state = const AsyncValue.loading();

    state = await AsyncValue.guard(() async {
      final tasks = await ref
          .read(ProductProviderItems.taskServiceProvider)
          .getAllTasks();
      return CalendarState(
        tasks: tasks.map((task) {
          return Task(
            title: task.title,
            description: task.description,
            date: task.date,
            category: task.category,
            priority: task.priority,
          );
        }).toList(),
      );
    });
  }
}
