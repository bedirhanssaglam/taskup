import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:task_management/feature/dashboard/view_model/dashboard_state.dart';
import 'package:task_management/product/models/task.dart';
import 'package:task_management/product/state/providers/task_provider_items.dart';
import 'package:task_management/product/utility/mixins/async_notifier_mixin.dart';

part 'dashboard_view_model.g.dart';

@riverpod
class DashboardViewModel extends _$DashboardViewModel
    with AsyncNotifierMixin<DashboardState> {
  @override
  AsyncValue<DashboardState> build() => const AsyncValue.data(DashboardState());

  Future<void> fetchTasks() async {
    await loadingAndGuard(() async {
      final tasks =
          await ref.read(TaskProviderItems.taskServiceProvider).getAllTasks();
      return DashboardState(
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
}
