import 'dart:ui';

import 'package:task_management/product/init/localization/locale_keys.g.dart';

enum TaskStatistics {
  inProgress(LocaleKeys.dashboard_inProgress, Color(0xFF6C63FF)),
  toDo(LocaleKeys.dashboard_thingsToDo, Color(0xFFEA7C30)),
  pastDate(LocaleKeys.dashboard_pastDates, Color(0xFFEB5757)),
  completed(LocaleKeys.dashboard_completed, Color(0xFF27AE60));

  const TaskStatistics(this.text, this.color);

  final String text;
  final Color color;
}
