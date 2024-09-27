import 'package:task_management/product/base/model/note.dart';
import 'package:task_management/product/service/base/firebase_service.dart';
import 'package:task_management/product/utility/enums/collection_paths.dart';

class TaskService {
  const TaskService({required this.firestoreService});

  final FirebaseService firestoreService;

  Future<List<Task>> getAllTasks() {
    return firestoreService.getList(CollectionPaths.tasks, Task());
  }
}
