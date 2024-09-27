import 'package:equatable/equatable.dart';

/// Account model
///
/// [Account.empty] represents an unauthenticated user.
final class Account extends Equatable {
  const Account({
    required this.uid,
    this.email,
    this.fullName,
  });

  /// The current user's email address.
  final String? email;

  /// The current user's id.
  final String uid;

  /// The current user's name (display name).
  final String? fullName;

  /// Empty user which represents an unauthenticated user.
  static const empty = Account(uid: '');

  /// Convenience getter to determine whether the current user is empty.
  bool get isEmpty => this == Account.empty;

  /// Convenience getter to determine whether the current user is not empty.
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
