import 'package:equatable/equatable.dart';
import 'package:gen/gen.dart';
import 'package:task_management/product/utility/enums/app_status.dart';

class AppState extends Equatable {
  const AppState._({
    required this.status,
    this.account = Account.empty,
  });

  const AppState.authenticated(Account user) : this._(status: AppStatus.authenticated, account: user);

  const AppState.unauthenticated() : this._(status: AppStatus.unauthenticated);

  final AppStatus status;
  final Account account;

  @override
  List<Object> get props => [status, account];
}
