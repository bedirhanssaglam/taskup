import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:task_management/feature/auth/login/view/login_view.dart';
import 'package:task_management/product/components/button/app_button.dart';
import 'package:task_management/product/components/text_field/app_text_field.dart';
import 'package:task_management/product/init/localization/locale_keys.g.dart';
import 'package:task_management/product/utility/constants/app_constants.dart';
import 'package:task_management/product/utility/extensions/string_extensions.dart';
import 'package:widget/widget.dart';

void main() {
  group('LoginView Tests', () {
    testWidgets('should display email and password text fields', (
      WidgetTester tester,
    ) async {
      // Arrange
      await tester.pumpWidget(const _LoginTestView());

      // Assert
      expect(find.byType(AppTextField), findsNWidgets(2));
      expect(find.text(AppConstants.emailHint), findsOneWidget);
      expect(find.text(AppConstants.passwordHint), findsOneWidget);
    });

    testWidgets('should display login button', (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(const _LoginTestView());

      // Assert
      expect(find.byType(AppButton), findsOneWidget);
      expect(find.text(LocaleKeys.login_loginText.locale), findsOneWidget);
    });

    testWidgets('should display "No Account" text and register button', (
      WidgetTester tester,
    ) async {
      // Arrange
      await tester.pumpWidget(const _LoginTestView());

      // Assert
      expect(
        find.text(LocaleKeys.login_dontHaveAnAccount.locale),
        findsOneWidget,
      );
      expect(find.text(LocaleKeys.login_registerText.locale), findsOneWidget);
    });
  });
}

final class _LoginTestView extends StatelessWidget {
  const _LoginTestView();

  @override
  Widget build(BuildContext context) {
    return const AppResponsive(
      child: MaterialApp(
        home: LoginView(),
      ),
    );
  }
}
