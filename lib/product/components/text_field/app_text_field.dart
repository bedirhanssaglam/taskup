import 'package:flutter/material.dart';
import 'package:task_management/product/components/text/locale_text.dart';
import 'package:task_management/product/utility/extensions/context_extensions.dart';
import 'package:task_management/product/utility/paddings/app_paddings.dart';

final class AppTextField extends StatelessWidget {
  const AppTextField({
    this.controller,
    this.hintText,
    super.key,
    this.obscureText = false,
    this.suffixIcon,
    this.textInputAction = TextInputAction.next,
    this.keyboardType,
    this.validator,
    this.prefixIcon,
    this.title,
    this.borderRadius = const BorderRadius.all(Radius.circular(8)),
    this.maxLines = 1,
    this.autofocus = false,
  });

  final String? hintText;
  final bool obscureText;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final BorderRadius borderRadius;
  final Widget? prefixIcon;
  final String? title;
  final int maxLines;
  final bool autofocus;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null)
          Padding(
            padding: const AppPadding.smallBottom(),
            child: LocaleText(
              title!,
              style: context.textTheme.bodyLarge,
            ),
          ),
        TextFormField(
          controller: controller,
          autofocus: autofocus,
          obscureText: obscureText,
          textInputAction: textInputAction,
          keyboardType: keyboardType,
          style: context.textTheme.bodyMedium,
          maxLines: maxLines,
          cursorColor: context.colorScheme.primary,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: borderRadius,
              borderSide: BorderSide(
                color: context.colorScheme.onSurfaceVariant,
                width: .2,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: borderRadius,
              borderSide: BorderSide(color: context.colorScheme.primary),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: borderRadius,
              borderSide: BorderSide(color: context.colorScheme.error),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: borderRadius,
              borderSide: BorderSide(color: context.colorScheme.error),
            ),
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
            hintText: hintText,
            hintStyle: context.textTheme.bodyMedium?.copyWith(
              color: context.colorScheme.outline,
            ),
          ),
          validator: validator,
        ),
      ],
    );
  }
}
