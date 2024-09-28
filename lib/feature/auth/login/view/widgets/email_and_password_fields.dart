part of '../login_view.dart';

final class _EmailAndPasswordFields extends StatelessWidget {
  const _EmailAndPasswordFields();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const AppTextField(
          hintText: AppConstants.emailHint,
          title: LocaleKeys.login_email,
          keyboardType: TextInputType.emailAddress,
        ),
        WidgetSizes.spacingM.verticalSpace,
        const AppTextField(
          hintText: AppConstants.passwordHint,
          title: LocaleKeys.login_password,
          obscureText: true,
          textInputAction: TextInputAction.done,
        ),
      ],
    );
  }
}
