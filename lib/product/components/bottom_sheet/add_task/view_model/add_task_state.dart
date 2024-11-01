import 'package:equatable/equatable.dart';

enum AddTaskStatus {
  initial,
  loading,
  success,
  error;

  bool get isLoading => this == loading;
  bool get isError => this == error;
  bool get isSuccess => this == success;
}

final class AddTaskState extends Equatable {
  const AddTaskState({
    this.status = AddTaskStatus.initial,
    this.errorMessage,
  });

  final AddTaskStatus status;
  final String? errorMessage;

  AddTaskState copyWith({
    AddTaskStatus? status,
    String? errorMessage,
  }) {
    return AddTaskState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, errorMessage];
}
