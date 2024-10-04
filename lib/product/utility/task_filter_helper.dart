import 'package:task_management/product/init/localization/locale_keys.g.dart';
import 'package:task_management/product/models/task.dart';
import 'package:task_management/product/utility/extensions/task_extensions.dart';

enum FilterCriteria {
  dateAsc(LocaleKeys.filter_dateAsc),
  dateDesc(LocaleKeys.filter_dateDesc),
  priorityAsc(LocaleKeys.filter_priorityAsc),
  priorityDesc(LocaleKeys.filter_priorityDesc);

  const FilterCriteria(this.reference);
  final String reference;

  int Function(Task a, Task b) get comparator {
    switch (this) {
      case FilterCriteria.dateAsc:
        return (a, b) => a.date!.compareTo(b.date!);
      case FilterCriteria.dateDesc:
        return (a, b) => b.date!.compareTo(a.date!);
      case FilterCriteria.priorityAsc:
        return (a, b) => a.priority!.compareTo(b.priority!);
      case FilterCriteria.priorityDesc:
        return (a, b) => b.priority!.compareTo(a.priority!);
    }
  }
}

final class TaskFilterHelper {
  static List<Task> sortTasks(List<Task>? tasks, FilterCriteria criteria) {
    if (tasks == null) return [];

    return List<Task>.from(tasks)..sort(criteria.comparator);
  }

  static Map<String, List<Task>> groupTasks(
    List<Task> tasks,
    FilterCriteria criteria,
  ) {
    final grouped = <String, List<Task>>{};

    String getKey(Task task) {
      if (criteria.toString().startsWith('FilterCriteria.priority')) {
        return task.priority.toString();
      }
      return task.getTaskGroupKey;
    }

    for (final task in tasks) {
      final key = getKey(task);
      grouped.putIfAbsent(key, () => []).add(task);
    }

    return grouped;
  }
}
