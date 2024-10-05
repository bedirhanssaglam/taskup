import 'package:equatable/equatable.dart';

final class Account extends Equatable {
  const Account({
    required this.uid,
    this.email,
    this.fullName,
  });

  final String? email;
  final String uid;
  final String? fullName;

  static const empty = Account(uid: '');

  bool get isEmpty => this == Account.empty;

  bool get isNotEmpty => this != Account.empty;

  @override
  List<Object?> get props => [email, uid, fullName];

  Map<String, String> toFirestore() {
    return {
      'uid': uid,
      'email': email!,
      'fullName': fullName!,
    };
  }
}
