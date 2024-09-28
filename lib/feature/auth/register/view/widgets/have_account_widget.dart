part of '../register_view.dart';

final class _HaveAccountWidget extends StatelessWidget {
  const _HaveAccountWidget();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        LocaleText(
          LocaleKeys.register_alreadyHaveAnAccount,
          style: context.textTheme.bodyMedium,
        ),
        AppTextButton(
          text: LocaleKeys.login_loginText,
          onPressed: Navigator.of(context).pop,
        ),
      ],
    );
  }
}
