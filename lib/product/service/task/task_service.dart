import 'package:task_management/product/models/task.dart';
import 'package:task_management/product/models/update_task_data.dart';
import 'package:task_management/product/service/base/firebase_service.dart';
import 'package:task_management/product/utility/enums/collection_paths.dart';

class TaskService {
  const TaskService({required this.firestoreService});

  final FirebaseService firestoreService;

  Future<List<Task>> getAllTasks() {
    return firestoreService.getList<Task>(CollectionPaths.tasks, Task());
  }

  Future<void> addTask(Task task) {
    return firestoreService.add<Task>(CollectionPaths.tasks, Task());
  }

  Future<void> deleteTask(String documentId) {
    return firestoreService.delete(CollectionPaths.tasks, documentId);
  }

  Future<void> updateTaskStatus({
    required UpdateTaskData updateTaskData,
  }) {
    return firestoreService.updateTaskStatus(
      CollectionPaths.tasks,
      updateTaskData: updateTaskData,
    );
  }
}
