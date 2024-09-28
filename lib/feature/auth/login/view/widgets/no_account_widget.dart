part of '../login_view.dart';

final class _NoAccountWidget extends StatelessWidget {
  const _NoAccountWidget();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        LocaleText(
          LocaleKeys.login_dontHaveAnAccount,
          style: context.textTheme.bodyMedium,
        ),
        AppTextButton(
          text: LocaleKeys.login_registerText,
          onPressed: () {},
        ),
      ],
    );
  }
}
