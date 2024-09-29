import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:task_management/product/base/model/note.dart';
import 'package:task_management/product/components/bottom_sheet/add_task/view_model/add_task_view_model.dart';
import 'package:task_management/product/service/task/task_service.dart';
import 'package:task_management/product/state/product_provider_items.dart';

final class _MockTaskService extends Mock implements TaskService {
  @override
  Future<void> addTask(Task task) {
    return Future<void>.value();
  }
}

void main() {
  test('TaskViewModel add a new task', () async {
    final container = ProviderContainer(
      overrides: [
        ProductProviderItems.taskServiceProvider.overrideWithValue(
          _MockTaskService(),
        ),
      ],
    );

    final viewModel = container.read(addTaskViewModelProvider.notifier);

    final mockTask = Task(
      title: 'title',
      description: 'description',
      createdAt: Timestamp.now(),
      date: Timestamp.now(),
      priority: '1',
    );

    await viewModel.addTask(task: mockTask);
    expect(
      viewModel.state.status.isSuccess,
      true,
    );
  });
}
