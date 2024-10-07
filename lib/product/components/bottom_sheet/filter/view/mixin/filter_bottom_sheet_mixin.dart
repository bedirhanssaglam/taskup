part of '../filter_bottom_sheet.dart';

mixin _FilterBottomSheetMixin on ConsumerState<FilterBottomSheet> {
  late ValueNotifier<FilterCriteria> filterCriteriaNotifier;

  @override
  void initState() {
    super.initState();
    filterCriteriaNotifier = ValueNotifier(widget.initialCriteria);
  }

  void changeFilter(FilterCriteria? newValue) {
    if (newValue != null) {
      ref
          .read(
            ProductProviderItems.filterCriteriaProvider.notifier,
          )
          .updateFilterCriteria(newValue);
      Navigator.pop(context, newValue);
    }
  }
}
