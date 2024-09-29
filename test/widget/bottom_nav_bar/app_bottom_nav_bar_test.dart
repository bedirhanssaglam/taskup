import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:task_management/product/components/bottom_nav_bar/app_bottom_nav_bar.dart';
import 'package:task_management/product/init/localization/locale_keys.g.dart';
import 'package:widget/widget.dart';

import '../../finder_match_extensions.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

void main() {
  testWidgets('AppBottomNavBar displays correct items and responds to taps', (
    WidgetTester tester,
  ) async {
    final mockObserver = MockNavigatorObserver();

    await tester.pumpWidget(
      AppResponsive(
        child: MaterialApp(
          home: Scaffold(
            bottomNavigationBar: AppBottomNavBar(
              pageIndex: 0,
              onItemTapped: (index) {},
            ),
          ),
          navigatorObservers: [mockObserver],
        ),
      ),
    );

    find.text(LocaleKeys.bottomNavBar_home).once();
    find.text(LocaleKeys.bottomNavBar_calendar).once();
    find.text(LocaleKeys.bottomNavBar_profile).once();
  });
}
