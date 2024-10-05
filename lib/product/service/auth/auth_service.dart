import 'dart:async';

import 'package:core/core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gen/gen.dart';
import 'package:task_management/product/service/exceptions/firebase_exceptions.dart';
import 'package:task_management/product/utility/enums/collection_paths.dart';

class AuthService {
  AuthService({
    CacheClient? cache,
    FirebaseAuth? firebaseAuth,
  })  : _cache = cache ?? CacheClient(),
        _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  final CacheClient _cache;
  final FirebaseAuth _firebaseAuth;

  static const String userCacheKey = '__user_cache_key__';

  Stream<Account> get account {
    return _firebaseAuth.authStateChanges().map((User? firebaseUser) {
      final user =
          firebaseUser == null ? Account.empty : firebaseUser.toAccount;
      _cache.write(key: userCacheKey, value: user);
      return user;
    });
  }

  Account get currentUser {
    return _cache.read<Account>(key: userCacheKey) ?? Account.empty;
  }

  Future<void> signUp({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  }) async {
    try {
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await userCredential.user!
          .updateProfile(displayName: '$firstName $lastName');

      final account = Account(
        uid: userCredential.user!.uid,
        email: email,
        fullName: '$firstName $lastName',
      );

      await CollectionPaths.users.collection.doc(userCredential.user!.uid).set(
            account.toFirestore(),
          );
    } on FirebaseAuthException catch (e) {
      throw SignUpWithEmailAndPasswordFailure.fromCode(e.code);
    } catch (_) {
      throw const SignUpWithEmailAndPasswordFailure();
    }
  }

  Future<void> logInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      throw LogInWithEmailAndPasswordFailure.fromCode(e.code);
    } catch (_) {
      throw const LogInWithEmailAndPasswordFailure();
    }
  }

  Future<void> logOut() async {
    try {
      await _firebaseAuth.signOut();
    } catch (_) {
      throw LogOutFailure();
    }
  }
}

extension on User {
  Account get toAccount => Account(
        uid: uid,
        email: email,
        fullName: displayName,
      );
}
