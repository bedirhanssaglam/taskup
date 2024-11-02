import 'package:flutter/material.dart';
import 'package:task_management/product/components/text/locale_text.dart';

final class AppSnackBar extends SnackBar {
  AppSnackBar({required this.text, super.key})
      : super(
          content: LocaleText(text),
          duration: Durations.extralong1,
        );
  final String text;

  static void show(
    BuildContext context, {
    required String text,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(AppSnackBar(text: text));
  }
}
