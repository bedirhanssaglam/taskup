import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:task_management/feature/calendar/view_model/calendar_state.dart';
import 'package:task_management/product/models/task.dart';
import 'package:task_management/product/models/update_task_data.dart';
import 'package:task_management/product/state/providers/task_provider_items.dart';
import 'package:task_management/product/utility/mixins/async_notifier_mixin.dart';

part 'calendar_view_model.g.dart';

@riverpod
class CalendarViewModel extends _$CalendarViewModel
    with AsyncNotifierMixin<CalendarState> {
  @override
  AsyncValue<CalendarState> build() => const AsyncValue.data(CalendarState());

  Future<void> fetchTasks() async {
    await loadingAndGuard(() async {
      final tasks =
          await ref.read(TaskProviderItems.taskServiceProvider).getAllTasks();
      return CalendarState(
        tasks: tasks.map((task) {
          return Task(
            id: task.id,
            title: task.title,
            description: task.description,
            date: task.date,
            category: task.category,
            priority: task.priority,
            isCompleted: task.isCompleted,
            isDoing: task.isDoing,
          );
        }).toList(),
      );
    });
  }

  Future<void> deleteTask(String documentId) async {
    await ref
        .read(TaskProviderItems.taskServiceProvider)
        .deleteTask(documentId);
  }

  Future<void> updateTaskStatus({
    required UpdateTaskData updateTaskData,
  }) async {
    await ref.read(TaskProviderItems.taskServiceProvider).updateTaskStatus(
          updateTaskData: updateTaskData,
        );
  }
}
