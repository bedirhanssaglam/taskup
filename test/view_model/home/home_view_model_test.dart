import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:task_management/feature/home/view_model/home_view_model.dart';
import 'package:task_management/product/base/model/note.dart';
import 'package:task_management/product/service/task/task_service.dart';
import 'package:task_management/product/state/product_provider_items.dart';

final class _MocTaskService extends Mock implements TaskService {
  @override
  Future<List<Task>> getAllTasks() {
    return Future.value([
      Task(title: '2'),
      Task(title: '3'),
    ]);
  }
}

void main() {
  test('HomeViewModel fetches tasks', () async {
    final container = ProviderContainer(
      overrides: [
        ProductProviderItems.taskServiceProvider.overrideWithValue(
          _MocTaskService(),
        ),
      ],
    );

    final viewModel = container.read(homeViewModelProvider.notifier);

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
