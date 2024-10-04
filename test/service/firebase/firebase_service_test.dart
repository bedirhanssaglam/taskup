import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:task_management/product/models/task.dart';
import 'package:task_management/product/service/base/firebase_service.dart';
import 'package:task_management/product/service/task/task_service.dart';
import 'package:task_management/product/utility/enums/collection_paths.dart';

import 'firebase_service_test.mocks.dart';

@GenerateMocks([FirebaseService])
void main() {
  group('TaskService Tests', () {
    late TaskService taskService;
    late MockFirebaseService mockFirebaseService;

    setUp(() {
      mockFirebaseService = MockFirebaseService();
      taskService = TaskService(firestoreService: mockFirebaseService);
    });

    test('getAllTasks returns list of tasks', () async {
      // Arrange
      final mockTasks = <Task>[];
      when(
        mockFirebaseService.getList<Task>(
          CollectionPaths.tasks,
          any,
        ),
      ).thenAnswer((_) async => mockTasks);

      // Act
      final result = await taskService.getAllTasks();

      // Assert
      expect(result, mockTasks);
    });
  });
}
