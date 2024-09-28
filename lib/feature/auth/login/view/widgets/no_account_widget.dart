part of '../login_view.dart';

final class _NoAccountWidget extends StatelessWidget {
  const _NoAccountWidget();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't have an account?",
          style: context.textTheme.bodyMedium,
        ),
        AppTextButton(
          text: 'Register',
          onPressed: () {},
        ),
      ],
    );
  }
}
