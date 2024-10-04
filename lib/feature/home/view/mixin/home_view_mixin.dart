part of '../home_view.dart';

mixin _HomeViewMixin on ConsumerState<HomeView> {
  AsyncValue<List<Task>> get tasksAsyncValue =>
      ref.watch(ProductProviderItems.tasksProvider);

  @override
  void initState() {
    super.initState();
    Future<void>.microtask(_init);
  }

  Future<void> _init() async {
    await ref.read(homeViewModelProvider.notifier).fetchTasks();
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
}
