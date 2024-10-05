import 'package:flutter/material.dart';

enum Locales {
  tr(Locale('tr', 'TR')),
  en(Locale('en', 'US'));

  const Locales(this.locale);

  final Locale locale;
}
