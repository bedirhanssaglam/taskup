import 'package:equatable/equatable.dart';
import 'package:task_management/product/models/task.dart';

final class CalendarState extends Equatable {
  const CalendarState({
    this.tasks = const [],
  });
  final List<Task>? tasks;

  CalendarState copyWith({
    List<Task>? tasks,
  }) {
    return CalendarState(
      tasks: tasks ?? this.tasks,
    );
  }

  @override
  List<Object?> get props => [tasks];
}
