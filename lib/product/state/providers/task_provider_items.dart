import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_management/product/models/task.dart';
import 'package:task_management/product/service/base/firebase_service.dart';
import 'package:task_management/product/service/task/task_service.dart';

class TaskProviderItems {
  static final firebaseServiceProvider = Provider<FirebaseService>((ref) {
    return FirebaseService();
  });

  static final taskServiceProvider = Provider<TaskService>((ref) {
    final firebaseService = ref.watch(firebaseServiceProvider);
    return TaskService(firestoreService: firebaseService);
  });

  static final tasksProvider = FutureProvider<List<Task>>((ref) async {
    final tasks = await ref.read(taskServiceProvider).getAllTasks();
    return tasks.map((task) {
      return Task(
        title: task.title,
        description: task.description,
        date: task.date,
        category: task.category,
        priority: task.priority,
      );
    }).toList();
  });
}
