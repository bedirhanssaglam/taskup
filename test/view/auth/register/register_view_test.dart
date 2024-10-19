import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:task_management/feature/auth/register/view/register_view.dart';
import 'package:task_management/product/components/button/app_button.dart';
import 'package:task_management/product/components/text_field/app_text_field.dart';
import 'package:task_management/product/init/localization/locale_keys.g.dart';
import 'package:task_management/product/utility/extensions/string_extensions.dart';
import 'package:widget/widget.dart';

import '../../../finder_match_extensions.dart';

void main() {
  group('RegisterView Widget Tests', () {
    testWidgets('should render the RegisterView with all components', (
      WidgetTester tester,
    ) async {
      // Arrange
      await tester.pumpWidget(const _RegisterTestView());

      // Assert
      find.byType(AppTextField).times(5);
      find.byType(AppButton).once();
    });

    testWidgets('should contain specific fields with proper hints and titles', (
      WidgetTester tester,
    ) async {
      // Arrange
      await tester.pumpWidget(const _RegisterTestView());

      // Assert
      find
          .widgetWithText(
            AppTextField,
            LocaleKeys.register_enterYourName.locale,
          )
          .once();
      find
          .widgetWithText(
            AppTextField,
            LocaleKeys.register_enterYourSurname.locale,
          )
          .once();
      find
          .widgetWithText(
            AppTextField,
            LocaleKeys.login_email.locale,
          )
          .once();
      find
          .widgetWithText(
            AppTextField,
            LocaleKeys.login_password.locale,
          )
          .once();
    });

    testWidgets('should navigate when "Already Have an Account?" is tapped', (
      WidgetTester tester,
    ) async {
      // Arrange
      await tester.pumpWidget(const _RegisterTestView());

      // Act
      await tester.tap(find.text(LocaleKeys.login_loginText));
      await tester.pumpAndSettle();

      // Assert
      find.text(LocaleKeys.login_loginText.locale).once();
    });

    testWidgets('should show the correct title in _RegisterHeader', (
      WidgetTester tester,
    ) async {
      // Arrange
      await tester.pumpWidget(const _RegisterTestView());

      // Assert
      find.text(LocaleKeys.register_title.locale).once();
    });
  });
}

final class _RegisterTestView extends StatelessWidget {
  const _RegisterTestView();

  @override
  Widget build(BuildContext context) {
    return const ProviderScope(
      child: AppResponsive(
        child: MaterialApp(
          home: RegisterView(),
        ),
      ),
    );
  }
}
