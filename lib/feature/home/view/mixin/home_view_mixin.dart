part of '../home_view.dart';

mixin _HomeViewMixin on ConsumerState<HomeView> {
  AsyncValue<HomeState> get homeState => ref.watch(homeViewModelProvider);
  String get userFullName =>
      ref.read(ProductProviderItems.appStateProvider).account.fullName ?? '';

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
