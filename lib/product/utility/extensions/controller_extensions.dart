import 'package:flutter/material.dart' show TextEditingController;

extension ControllerExtensions on TextEditingController {
  String get trimmedText => text.trim();
}
