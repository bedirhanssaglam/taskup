import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_management/feature/home/view/home_view.dart';
import 'package:task_management/feature/home/view_model/home_view_model.dart';

mixin HomeViewMixin on ConsumerState<HomeView> {
  @override
  void initState() {
    super.initState();
    Future<void>.microtask(_init);
  }

  Future<void> _init() async {
    await ref.read(homeViewModelProvider.notifier).fetchTasks();
  }

  AsyncValue<HomeState> get homeState => ref.watch(homeViewModelProvider);
}
