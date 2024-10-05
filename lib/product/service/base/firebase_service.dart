import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:task_management/product/models/base_firebase_model.dart';
import 'package:task_management/product/service/base/interface_firebase_service.dart';
import 'package:task_management/product/service/exceptions/firebase_exceptions.dart';
import 'package:task_management/product/utility/enums/collection_paths.dart';
import 'package:task_management/product/utility/enums/request_keys.dart';

@immutable
class FirebaseService extends IFirebaseService {
  FirebaseService();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Future<List<T>> getList<T extends BaseFirebaseModel<T>>(
    CollectionPaths collectionPath,
    T model,
  ) async {
    final currentUserId = _auth.currentUser?.uid;
    if (currentUserId == null) throw const NoUserFailure();

    final QuerySnapshot snapshot = await collectionPath.collection
        .where(
          RequestKeys.uid.reference,
          isEqualTo: currentUserId,
        )
        .get();

    return snapshot.docs
        .map((doc) {
          return model.fromFirestore(
            doc.data()! as Map<String, dynamic>,
            doc.id,
          );
        })
        .cast<T>()
        .toList();
  }

  Future<void> add<T extends BaseFirebaseModel<T>>(
    CollectionPaths collectionPath,
    T model,
  ) async {
    final currentUserId = _auth.currentUser?.uid;
    if (currentUserId == null) throw const NoUserFailure();

    await collectionPath.collection.add({
      ...model.toFirestore(),
      RequestKeys.uid.reference: currentUserId,
    });
  }
}
