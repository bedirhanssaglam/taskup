import 'package:cloud_firestore/cloud_firestore.dart';

enum CollectionPaths {
  users,
  tasks;

  CollectionReference<Map<String, dynamic>> get collection {
    return FirebaseFirestore.instance.collection(name);
  }
}
