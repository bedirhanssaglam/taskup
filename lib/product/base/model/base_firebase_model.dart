abstract class BaseFirebaseModel<T> {
  T fromFirestore(Map<String, dynamic> data, String documentId);
}
