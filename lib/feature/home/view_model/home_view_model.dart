import 'package:equatable/equatable.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:task_management/product/base/model/note.dart';
import 'package:task_management/product/state/product_provider_items.dart';

part 'home_view_model.g.dart';

@riverpod
class HomeViewModel extends _$HomeViewModel {
  @override
  AsyncValue<HomeState> build() => const AsyncValue.data(HomeState());

  Future<void> fetchTasks() async {
    state = const AsyncValue.loading();

    state = await AsyncValue.guard(() async {
      final List<Task> tasks = await ref.read(ProductProviderItems.taskServiceProvider).getAllTasks();
      return HomeState(tasks: tasks);
    });
  }
}

final class HomeState extends Equatable {
  final List<Task>? tasks;

  const HomeState({
    this.tasks = const [],
  });

  HomeState copyWith({
    List<Task>? tasks,
  }) {
    return HomeState(
      tasks: tasks ?? this.tasks,
    );
  }

  @override
  List<Object?> get props => [tasks];
}
