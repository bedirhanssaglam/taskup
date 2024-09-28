import 'package:equatable/equatable.dart';

enum LoginStatus {
  initial,
  loading,
  success,
  error;

  bool get isLoading => this == loading;
  bool get isError => this == error;
}

final class LoginState extends Equatable {
  const LoginState({
    this.status = LoginStatus.initial,
    this.errorMessage,
  });

  final LoginStatus status;
  final String? errorMessage;

  LoginState copyWith({
    LoginStatus? status,
    String? errorMessage,
  }) {
    return LoginState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, errorMessage];
}
