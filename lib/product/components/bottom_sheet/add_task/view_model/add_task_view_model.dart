import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:task_management/product/components/bottom_sheet/add_task/view_model/add_task_status.dart';
import 'package:task_management/product/models/task.dart';
import 'package:task_management/product/state/providers/task_provider_items.dart';
import 'package:task_management/product/utility/enums/collection_paths.dart';

part 'add_task_view_model.g.dart';

@riverpod
class AddTaskViewModel extends _$AddTaskViewModel {
  @override
  AddTaskState build() => const AddTaskState();

  Future<void> addTask({
    required Task task,
  }) async {
    state = state.copyWith(status: AddTaskStatus.loading);

    try {
      await ref
          .read(
            TaskProviderItems.firebaseServiceProvider,
          )
          .add(CollectionPaths.tasks, task);
      state = state.copyWith(status: AddTaskStatus.success);
    } catch (e) {
      state = state.copyWith(
        status: AddTaskStatus.error,
        errorMessage: e.toString(),
      );
    }
  }
}
