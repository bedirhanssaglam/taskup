import 'package:equatable/equatable.dart';
import 'package:task_management/product/base/model/note.dart';

final class HomeState extends Equatable {
  const HomeState({
    this.tasks = const [],
  });
  final List<Task>? tasks;

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
