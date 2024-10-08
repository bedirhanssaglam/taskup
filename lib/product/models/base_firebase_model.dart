// ignore: one_member_abstracts
abstract class BaseFirebaseModel<T> {
  T fromFirestore(Map<String, dynamic> data, String documentId);
  Map<String, dynamic> toFirestore();
  String? get documentId;
}
