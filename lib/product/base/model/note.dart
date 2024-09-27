import 'package:flutter/foundation.dart' show immutable;
import 'package:task_management/product/base/model/base_firebase_model.dart';

@immutable
final class Task extends BaseFirebaseModel<Task> {
  Task({this.id, this.title});

  final String? id;
  final String? title;

  @override
  Task fromFirestore(Map<String, dynamic> data, String documentId) {
    return Task(
      id: documentId,
      title: data['title'] as String?,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Task && other.title == title;
  }

  @override
  int get hashCode => title.hashCode;

  @override
  String toString() => 'Task(title: $title)';
}
