import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:task_management/feature/auth/login/view/login_view.dart';
import 'package:task_management/product/components/button/app_button.dart';
import 'package:task_management/product/components/text_field/app_text_field.dart';
import 'package:task_management/product/constants/app_constants.dart';
import 'package:task_management/product/init/localization/locale_keys.g.dart';
import 'package:task_management/product/utility/extensions/string_extensions.dart';
import 'package:widget/widget.dart';

import '../../../finder_match_extensions.dart';

void main() {
  group('LoginView Tests', () {
    testWidgets('should display email and password text fields', (
      WidgetTester tester,
    ) async {
      // Arrange
      await tester.pumpWidget(const _LoginTestView());

      // Assert
      find.byType(AppTextField).times(2);
      find.text(AppConstants.emailHint).once();
      find.text(AppConstants.passwordHint).once();
    });

    testWidgets('should display login button', (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(const _LoginTestView());

      // Assert
      find.byType(AppButton).once();
      find.text(LocaleKeys.login_loginText.locale).once();
    });

    testWidgets('should display "No Account" text and register button', (
      WidgetTester tester,
    ) async {
      // Arrange
      await tester.pumpWidget(const _LoginTestView());

      // Assert
      find.text(LocaleKeys.login_dontHaveAnAccount.locale).once();
      find.text(LocaleKeys.login_registerText.locale).once();
    });
  });
}

final class _LoginTestView extends StatelessWidget {
  const _LoginTestView();

  @override
  Widget build(BuildContext context) {
    return const ProviderScope(
      child: AppResponsive(
        child: MaterialApp(
          home: LoginView(),
        ),
      ),
    );
  }
}
