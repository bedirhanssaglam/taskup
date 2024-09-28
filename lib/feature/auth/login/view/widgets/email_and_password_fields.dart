part of '../login_view.dart';

final class _EmailAndPasswordFields extends StatelessWidget {
  const _EmailAndPasswordFields();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppTextField(
          hintText: 'enter your email',
          title: 'Email',
          controller: TextEditingController(),
        ),
        WidgetSizes.spacingM.verticalSpace,
        AppTextField(
          hintText: '************',
          title: 'Password',
          controller: TextEditingController(),
        ),
      ],
    );
  }
}
