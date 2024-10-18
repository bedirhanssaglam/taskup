import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:task_management/feature/tasks/view_model/task_view_model.dart';
import 'package:task_management/product/models/task.dart';
import 'package:task_management/product/service/task/task_service.dart';
import 'package:task_management/product/state/providers/task_provider_items.dart';

final class _MockTaskService extends Mock implements TaskService {
  @override
  Future<List<Task>> getAllTasks() {
    return Future.value([
      Task(title: '2'),
      Task(title: '3'),
    ]);
  }
}

void main() {
  test('TaskViewModel fetches tasks', () async {
    final container = ProviderContainer(
      overrides: [
        TaskProviderItems.taskServiceProvider.overrideWithValue(
          _MockTaskService(),
        ),
      ],
    );

    final viewModel = container.read(taskViewModelProvider.notifier);

    await viewModel.fetchTasks();
    expect(
      viewModel.state.value?.tasks,
      equals([
        Task(title: '2'),
        Task(title: '3'),
      ]),
    );
  });
}
