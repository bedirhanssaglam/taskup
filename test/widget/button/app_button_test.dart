import 'package:flutter/foundation.dart' show TargetPlatform, debugDefaultTargetPlatformOverride;
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:task_management/product/components/button/app_button.dart';
import 'package:widget/widget.dart';

void main() {
  testWidgets('AppButton renders correctly for Android', (WidgetTester tester) async {
    // Arrange
    const String buttonText = 'Press Me';
    bool wasPressed = false;

    await tester.pumpWidget(
      AppResponsive(
        child: MaterialApp(
          theme: ThemeData(
            colorScheme: ColorScheme.fromSwatch().copyWith(primary: Colors.blue, background: Colors.white),
          ),
          home: Scaffold(
            body: AppButton(
              text: buttonText,
              onPressed: () {
                wasPressed = true;
              },
            ),
          ),
        ),
      ),
    );

    // Act
    expect(find.byType(AppButton), findsOneWidget);
    expect(find.text(buttonText), findsOneWidget);

    await tester.tap(find.byType(AppButton));
    await tester.pumpAndSettle();

    // Assert
    expect(wasPressed, isTrue);
  });

  testWidgets('AppButton renders correctly for iOS', (WidgetTester tester) async {
    // Arrange
    const String buttonText = 'Press Me';
    bool wasPressed = false;

    TestWidgetsFlutterBinding.ensureInitialized();
    debugDefaultTargetPlatformOverride = TargetPlatform.iOS;

    await tester.pumpWidget(
      AppResponsive(
        child: MaterialApp(
          theme: ThemeData(
            colorScheme: ColorScheme.fromSwatch().copyWith(primary: Colors.blue, background: Colors.white),
          ),
          home: Scaffold(
            body: AppButton(
              text: buttonText,
              onPressed: () {
                wasPressed = true;
              },
            ),
          ),
        ),
      ),
    );

    // Act
    expect(find.byType(AppButton), findsOneWidget);
    expect(find.text(buttonText), findsOneWidget);

    await tester.tap(find.byType(AppButton));
    await tester.pumpAndSettle();

    // Assert
    expect(wasPressed, isTrue);

    // Reset the platform for other tests
    debugDefaultTargetPlatformOverride = null;
  });
}
