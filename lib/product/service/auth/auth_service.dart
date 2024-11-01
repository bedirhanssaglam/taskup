import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:gen/gen.dart';
import 'package:task_management/product/service/cache/cache_manager.dart';
import 'package:task_management/product/service/exceptions/firebase_exceptions.dart';
import 'package:task_management/product/utility/enums/cache_paths.dart';
import 'package:task_management/product/utility/enums/collection_paths.dart';

class AuthService {
  AuthService({
    HiveCacheManager? cache,
    FirebaseAuth? firebaseAuth,
  })  : _cache = cache ?? HiveCacheManager(),
        _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  final HiveCacheManager _cache;
  final FirebaseAuth _firebaseAuth;

  Stream<Account> get account {
    return _firebaseAuth.authStateChanges().map((User? firebaseUser) {
      final user =
          firebaseUser == null ? Account.empty : firebaseUser.toAccount;
      _cache.saveData(CachePaths.user.value, user.hashCode);
      return user;
    });
  }

  Account get currentUser => _firebaseAuth.currentUser!.toAccount;

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
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (userCredential.user != null) {
        await _cache.saveData(
          CachePaths.user.value,
          userCredential.user!.toAccount.hashCode,
        );
      }
    } on FirebaseAuthException catch (e) {
      throw LogInWithEmailAndPasswordFailure.fromCode(e.code);
    } catch (_) {
      throw const LogInWithEmailAndPasswordFailure();
    }
  }

  Future<void> logOut() async {
    try {
      await _firebaseAuth.signOut();
      await _cache.clearAll();
    } catch (_) {
      throw LogOutFailure();
    }
  }

  Future<void> deleteUser() async {
    final user = _firebaseAuth.currentUser;

    if (user != null) {
      try {
        await user.delete();

        await _firebaseAuth.signOut();
      } catch (_) {
        throw DeleteUserFailure();
      }
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
