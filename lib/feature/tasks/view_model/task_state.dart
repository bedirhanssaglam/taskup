import 'package:equatable/equatable.dart';
import 'package:task_management/product/models/task.dart';

final class TaskState extends Equatable {
  const TaskState({
    this.tasks,
  });
  final List<Task>? tasks;

  TaskState copyWith({
    List<Task>? tasks,
  }) {
    return TaskState(
      tasks: tasks ?? this.tasks,
    );
  }

  @override
  List<Object?> get props => [tasks];
}
