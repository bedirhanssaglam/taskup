import 'package:task_management/product/models/base_firebase_model.dart';
import 'package:task_management/product/models/update_task_data.dart';
import 'package:task_management/product/utility/enums/collection_paths.dart';

abstract class IFirebaseService {
  Future<List<T>> getList<T extends BaseFirebaseModel<T>>(
    CollectionPaths collectionPath,
    T model,
  );

  Future<void> add<T extends BaseFirebaseModel<T>>(
    CollectionPaths collectionPath,
    T model,
  );

  Future<void> delete(
    CollectionPaths collectionPath,
    String documentId,
  );

  Future<void> updateTaskStatus(
    CollectionPaths collectionPath, {
    required UpdateTaskData updateTaskData,
  });
}
