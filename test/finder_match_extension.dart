import 'package:flutter_test/flutter_test.dart';

extension FinderMatchExtension on Finder {
  void never() => expect(this, findsNothing);
  void once() => expect(this, findsOneWidget);
  void times(int number) => expect(this, findsNWidgets(number));
  void some() => expect(this, findsWidgets);
}
