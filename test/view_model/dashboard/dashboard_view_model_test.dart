import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:task_management/feature/dashboard/view_model/dashboard_view_model.dart';
import 'package:task_management/product/models/task.dart';
import 'package:task_management/product/service/task/task_service.dart';
import 'package:task_management/product/state/product_provider_items.dart';
import 'package:task_management/product/utility/extensions/task_extensions.dart';

class _MockTaskService extends Mock implements TaskService {
  @override
  Future<List<Task>> getAllTasks() {
    return Future.value([
      Task(
        title: 'Task 1',
        isDoing: true,
        isCompleted: false,
        date: Timestamp.fromDate(
          DateTime(2025),
        ),
      ),
      Task(
        title: 'Task 2',
        isDoing: false,
        isCompleted: true,
        date: Timestamp.fromDate(
          DateTime(2025),
        ),
      ),
      Task(
        title: 'Task 3',
        isDoing: false,
        isCompleted: false,
        date: Timestamp.fromDate(
          DateTime(2025),
        ),
      ),
      Task(
        title: 'Task 4',
        isDoing: false,
        isCompleted: false,
        date: Timestamp.fromDate(
          DateTime(2023),
        ),
      ),
    ]);
  }
}

void main() {
  group('DashboardViewModel', () {
    test('fetches tasks', () async {
      final container = ProviderContainer(
        overrides: [
          ProductProviderItems.taskServiceProvider.overrideWithValue(
            _MockTaskService(),
          ),
        ],
      );

      final viewModel = container.read(dashboardViewModelProvider.notifier);

      await viewModel.fetchTasks();
      expect(
        viewModel.state.value?.tasks,
        isNotEmpty,
      );
      expect(
        viewModel.state.value?.tasks?.length,
        equals(4),
      );
    });
  });

  group('DashboardViewModel Task Properties', () {
    late ProviderContainer container;

    setUp(() {
      container = ProviderContainer(
        overrides: [
          ProductProviderItems.taskServiceProvider.overrideWithValue(
            _MockTaskService(),
          ),
        ],
      );
    });

    tearDown(() {
      container.dispose();
    });

    test('calculates doingCount correctly', () async {
      final viewModel = container.read(dashboardViewModelProvider.notifier);
      await viewModel.fetchTasks();

      final doingCount = container.read(dashboardViewModelProvider).maybeWhen(
            data: (state) => state.tasks?.doingCount ?? 0,
            orElse: () => 0,
          );

      expect(doingCount, equals(1));
    });

    test('calculates completedCount correctly', () async {
      final viewModel = container.read(dashboardViewModelProvider.notifier);
      await viewModel.fetchTasks();

      final completedCount =
          container.read(dashboardViewModelProvider).maybeWhen(
                data: (state) => state.tasks?.completedCount ?? 0,
                orElse: () => 0,
              );

      expect(completedCount, equals(1));
    });

    test('calculates overdueCount correctly', () async {
      final viewModel = container.read(dashboardViewModelProvider.notifier);
      await viewModel.fetchTasks();

      final overdueCount = container.read(dashboardViewModelProvider).maybeWhen(
            data: (state) => state.tasks?.overdueCount ?? 0,
            orElse: () => 0,
          );

      expect(overdueCount, equals(1));
    });

    test('calculates upcomingCount correctly', () async {
      final viewModel = container.read(dashboardViewModelProvider.notifier);
      await viewModel.fetchTasks();

      final upcomingCount =
          container.read(dashboardViewModelProvider).maybeWhen(
                data: (state) => state.tasks?.upcomingCount ?? 0,
                orElse: () => 0,
              );

      expect(upcomingCount, equals(1));
    });
  });
}
