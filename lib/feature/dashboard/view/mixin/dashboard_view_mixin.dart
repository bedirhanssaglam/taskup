part of '../dashboard_view.dart';

mixin _DashboardViewMixin on ConsumerState<DashboardView> {
  AsyncValue<DashboardState> get dashboardState =>
      ref.watch(dashboardViewModelProvider);

  @override
  void initState() {
    super.initState();
    Future<void>.microtask(_init);
  }

  Future<void> _init() async {
    final dashboardViewModel = ref.read(dashboardViewModelProvider.notifier);
    await dashboardViewModel.fetchTasks();
  }

  int get doingCount => dashboardState.maybeWhen(
        data: (state) => state.tasks?.doingCount ?? 0,
        orElse: () => 0,
      );

  int get completedCount => dashboardState.maybeWhen(
        data: (state) => state.tasks?.completedCount ?? 0,
        orElse: () => 0,
      );

  int get overdueCount => dashboardState.maybeWhen(
        data: (state) => state.tasks?.overdueCount ?? 0,
        orElse: () => 0,
      );

  int get upcomingCount => dashboardState.maybeWhen(
        data: (state) => state.tasks?.upcomingCount ?? 0,
        orElse: () => 0,
      );
}
