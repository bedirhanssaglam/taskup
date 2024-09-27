import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:task_management/product/base/model/base_firebase_model.dart';
import 'package:task_management/product/service/base/interface_firebase_service.dart';
import 'package:task_management/product/utility/enums/collection_paths.dart';

@immutable
class FirebaseService extends IFirebaseService {
  FirebaseService();

  @override
  Future<List<T>> getList<T extends BaseFirebaseModel<T>>(
    CollectionPaths collectionPath,
    T model,
  ) async {
    final QuerySnapshot snapshot = await collectionPath.collection.get();

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
}
