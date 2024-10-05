import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:task_management/feature/home/view_model/home_state.dart';
import 'package:task_management/product/models/task.dart';
import 'package:task_management/product/state/product_provider_items.dart';

part 'home_view_model.g.dart';

@riverpod
class HomeViewModel extends _$HomeViewModel {
  @override
  AsyncValue<HomeState> build() => const AsyncValue.data(HomeState());

  Future<void> fetchTasks() async {
    state = const AsyncValue.loading();

    state = await AsyncValue.guard(() async {
      final tasks = await ref
          .read(ProductProviderItems.taskServiceProvider)
          .getAllTasks();
      return HomeState(
        tasks: tasks.map((task) {
          return Task(
            id: task.id,
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

  Future<void> deleteTask(String documentId) async {
    await ref
        .read(ProductProviderItems.taskServiceProvider)
        .deleteTask(documentId);
  }
}
