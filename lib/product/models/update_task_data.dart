import 'package:flutter/foundation.dart' show immutable;

@immutable
final class UpdateTaskData {
  const UpdateTaskData({required this.documentId, required this.isCompleted});

  final String documentId;
  final bool isCompleted;
}
