import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_management/product/utility/task_filter_helper.dart';

class FilterViewModel extends StateNotifier<FilterCriteria> {
  FilterViewModel() : super(FilterCriteria.dateDesc);

  // ignore: use_setters_to_change_properties
  void updateFilterCriteria(FilterCriteria newCriteria) {
    state = newCriteria;
  }
}
