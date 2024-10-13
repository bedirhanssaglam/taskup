import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:task_management/feature/tasks/view_model/task_state.dart';
import 'package:task_management/product/models/task.dart';
import 'package:task_management/product/models/update_task_data.dart';
import 'package:task_management/product/state/product_provider_items.dart';

part 'task_view_model.g.dart';

@riverpod
class TaskViewModel extends _$TaskViewModel {
  @override
  AsyncValue<TaskState> build() => const AsyncValue.data(TaskState());

  Future<void> fetchTasks() async {
    state = const AsyncValue.loading();

    state = await AsyncValue.guard(() async {
      final tasks = await ref
          .read(ProductProviderItems.taskServiceProvider)
          .getAllTasks();
      return TaskState(
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
        .read(ProductProviderItems.taskServiceProvider)
        .deleteTask(documentId);
  }

  Future<void> updateTaskStatus({
    required UpdateTaskData updateTaskData,
  }) async {
    await ref.read(ProductProviderItems.taskServiceProvider).updateTaskStatus(
          updateTaskData: updateTaskData,
        );
  }
}
