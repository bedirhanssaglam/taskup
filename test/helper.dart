import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

extension FinderMatchExtension on Finder {
  void never() => expect(this, findsNothing);
  void once() => expect(this, findsOneWidget);
  void times(int number) => expect(this, findsNWidgets(number));
  void some() => expect(this, findsWidgets);
}

extension VerificationCalledExtension on VerificationResult {
  void never() => called(0);
  void once() => called(1);
  void twice() => called(2);
  void threeTimes() => called(3);
  void times(int number) => called(number);
}
