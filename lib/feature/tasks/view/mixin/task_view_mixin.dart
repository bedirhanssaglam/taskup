part of '../tasks_view.dart';

mixin _TaskViewMixin on ConsumerState<TaskView> {
  AsyncValue<TaskState> get taskState => ref.watch(taskViewModelProvider);

  @override
  void initState() {
    super.initState();
    Future<void>.microtask(_init);
  }

  TaskViewModel get _taskViewModel => ref.read(taskViewModelProvider.notifier);

  Future<void> _init() async {
    await _taskViewModel.fetchTasks();
  }

  Future<void> showFilterBottomSheet() async {
    final newCriteria = await FilterBottomSheet.show(
      context,
      ref.read(ProductProviderItems.filterCriteriaProvider),
    );
    if (newCriteria != null) {
      ref.read(ProductProviderItems.filterCriteriaProvider.notifier).updateFilterCriteria(newCriteria);
    }
  }

  Future<void> deleteTask(String? documentId) async {
    if (documentId == null) return;
    await _taskViewModel.deleteTask(documentId);
    await _taskViewModel.fetchTasks();
  }

  Future<void> updateTask({required UpdateTaskData updateTaskData}) async {
    await _taskViewModel.updateTaskStatus(
      updateTaskData: updateTaskData,
    );
    await _taskViewModel.fetchTasks();
  }

  Future<void> logOut() async {
    await ref.read(AuthProviderItems.authServiceProvider).logOut();
  }
}
