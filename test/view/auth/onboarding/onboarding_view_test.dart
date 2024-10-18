import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:task_management/feature/auth/onboarding/view/onboarding_view.dart';
import 'package:task_management/feature/auth/onboarding/view_model/onboarding_view_model.dart';
import 'package:task_management/product/init/localization/locale_keys.g.dart';
import 'package:task_management/product/state/providers/auth_provider_items.dart';
import 'package:widget/widget.dart';

import '../../../finder_match_extensions.dart';

void main() {
  testWidgets('OnboardingView renders correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          AuthProviderItems.onboardingViewModel.overrideWith(
            (ref) => OnboardingViewModel(3),
          ),
        ],
        child: const AppResponsive(
          child: MaterialApp(
            home: OnboardingView(),
          ),
        ),
      ),
    );

    find.text(LocaleKeys.back).never();
    find.text(LocaleKeys.next).once();

    await tester.tap(find.text(LocaleKeys.next));
    await tester.pumpAndSettle();
    find.text(LocaleKeys.back).once();
    find.text(LocaleKeys.next).once();

    await tester.tap(find.text(LocaleKeys.next));
    await tester.pumpAndSettle();
  });
}
