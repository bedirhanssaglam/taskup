import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:task_management/product/models/base_firebase_model.dart';
import 'package:task_management/product/models/category.dart';

@immutable
final class Task extends BaseFirebaseModel<Task> {
  Task({
    this.id,
    this.title,
    this.description,
    this.date,
    this.category,
    this.priority,
    this.createdAt,
    this.uid,
  });

  final String? id;
  final String? title;
  final String? description;
  final Timestamp? date;
  final Timestamp? createdAt;
  final Category? category;
  final String? priority;
  final String? uid;

  @override
  Task fromFirestore(Map<String, dynamic> data, String documentId) {
    return Task(
      id: documentId,
      title: data['title'] as String?,
      description: data['description'] as String?,
      date: data['date'] as Timestamp?,
      createdAt: data['createdAt'] as Timestamp?,
      category: Category.fromFirestore(
        data['category'] as Map<String, dynamic>,
      ),
      priority: data['priority'] as String?,
      uid: data['uid'] as String?,
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

  @override
  Map<String, dynamic> toFirestore() {
    return {
      'title': title,
      'description': description,
      'date': date,
      'createdAt': createdAt,
      'category': category?.toJson(),
      'priority': priority,
      'uid': uid,
    };
  }
}
