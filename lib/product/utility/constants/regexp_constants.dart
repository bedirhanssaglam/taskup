import 'package:flutter/foundation.dart' show immutable;

@immutable
abstract final class RegexpConstants {
  const RegexpConstants._();

  static final RegExp emailRegexp = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
}
