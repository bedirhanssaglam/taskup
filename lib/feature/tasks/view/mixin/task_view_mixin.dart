part of '../tasks_view.dart';

mixin _TaskViewMixin on ConsumerState<TaskView> {
  AsyncValue<TaskState> get taskState => ref.watch(taskViewModelProvider);

  @override
  void initState() {
    super.initState();
    Future<void>.microtask(_init);
  }

  Future<void> _init() async {
    await ref.taskViewModel.fetchTasks();
  }

  Future<void> showFilterBottomSheet() async {
    final newCriteria = await FilterBottomSheet.show(
      context,
      ref.read(ProductProviderItems.filterCriteriaProvider),
    );
    if (newCriteria != null) {
      ref
          .read(ProductProviderItems.filterCriteriaProvider.notifier)
          .updateFilterCriteria(newCriteria);
    }
  }

  Future<void> deleteTask(String? documentId) async {
    if (documentId == null) return;
    await ref.taskViewModel.deleteTask(documentId);
    await ref.taskViewModel.fetchTasks();
  }

  Future<void> updateTask({required UpdateTaskData updateTaskData}) async {
    await ref.taskViewModel.updateTaskStatus(
      updateTaskData: updateTaskData,
    );
    await ref.taskViewModel.fetchTasks();
  }
}
