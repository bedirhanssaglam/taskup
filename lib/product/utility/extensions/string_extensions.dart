import 'package:easy_localization/easy_localization.dart';

extension LocalizationExtensions on String {
  String get locale => this.tr();
  String localeArgs(List<String> args) => this.tr(args: args);
}
