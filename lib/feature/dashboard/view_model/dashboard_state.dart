import 'package:equatable/equatable.dart';
import 'package:task_management/product/models/task.dart';

final class DashboardState extends Equatable {
  const DashboardState({
    this.tasks,
  });
  final List<Task>? tasks;

  DashboardState copyWith({
    List<Task>? tasks,
  }) {
    return DashboardState(
      tasks: tasks ?? this.tasks,
    );
  }

  @override
  List<Object?> get props => [tasks];
}
