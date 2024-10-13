part of '../tasks_view.dart';

mixin _TaskViewMixin on ConsumerState<TaskView> {
  AsyncValue<TaskState> get taskState => ref.watch(taskViewModelProvider);

  @override
  void initState() {
    super.initState();
    Future<void>.microtask(_init);
  }

  Future<void> _init() async {
    final homeViewModel = ref.read(taskViewModelProvider.notifier);
    await homeViewModel.fetchTasks();
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
    final homeViewModel = ref.read(taskViewModelProvider.notifier);
    await homeViewModel.deleteTask(documentId);
    await homeViewModel.fetchTasks();
  }

  Future<void> updateTask({required UpdateTaskData updateTaskData}) async {
    final homeViewModel = ref.read(taskViewModelProvider.notifier);
    await homeViewModel.updateTaskStatus(
      updateTaskData: updateTaskData,
    );
    await homeViewModel.fetchTasks();
  }
}
