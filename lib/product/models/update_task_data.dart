import 'package:flutter/foundation.dart' show immutable;

@immutable
final class UpdateTaskData {
  const UpdateTaskData({
    required this.documentId,
    this.isCompleted,
    this.isDoing,
  });

  final String documentId;
  final bool? isCompleted;
  final bool? isDoing;
}
