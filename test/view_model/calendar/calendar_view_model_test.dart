import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:task_management/feature/calendar/view_model/calendar_view_model.dart';
import 'package:task_management/product/models/task.dart';
import 'package:task_management/product/service/task/task_service.dart';
import 'package:task_management/product/state/providers/task_provider_items.dart';

final class _MockTaskService extends Mock implements TaskService {
  @override
  Future<List<Task>> getAllTasks() {
    return Future.value([
      Task(
        id: '1',
        title: 'Task 1',
        description: 'Description 1',
        date: Timestamp.now(),
      ),
      Task(
        id: '2',
        title: 'Task 2',
        description: 'Description 2',
        date: Timestamp.now(),
      ),
    ]);
  }
}

void main() {
  group('CalendarViewModel Tests', () {
    late ProviderContainer container;

    setUp(() {
      container = ProviderContainer(
        overrides: [
          TaskProviderItems.taskServiceProvider.overrideWithValue(
            _MockTaskService(),
          ),
        ],
      );
    });

    tearDown(() {
      container.dispose();
    });

    test('fetchTasks retrieves tasks correctly', () async {
      final viewModel = container.read(calendarViewModelProvider.notifier);

      await viewModel.fetchTasks();

      expect(
        viewModel.state.value?.tasks,
        equals([
          Task(
            id: '1',
            title: 'Task 1',
            description: 'Description 1',
            date: Timestamp.now(),
          ),
          Task(
            id: '2',
            title: 'Task 2',
            description: 'Description 2',
            date: Timestamp.now(),
          ),
        ]),
      );
    });
  });
}
