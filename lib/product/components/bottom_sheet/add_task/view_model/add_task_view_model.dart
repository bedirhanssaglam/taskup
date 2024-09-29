import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:task_management/product/base/model/note.dart';
import 'package:task_management/product/components/bottom_sheet/add_task/view_model/add_task_status.dart';
import 'package:task_management/product/state/product_provider_items.dart';

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
            ProductProviderItems.taskServiceProvider,
          )
          .addTask(task);
      state = state.copyWith(status: AddTaskStatus.success);
    } catch (e) {
      state = state.copyWith(
        status: AddTaskStatus.error,
        errorMessage: e.toString(),
      );
    }
  }
}