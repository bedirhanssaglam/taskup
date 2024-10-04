part of '../filter_bottom_sheet.dart';

mixin _FilterBottomSheetMixin on State<FilterBottomSheet> {
  late ValueNotifier<FilterCriteria> filterCriteriaNotifier;

  @override
  void initState() {
    super.initState();
    filterCriteriaNotifier = ValueNotifier(widget.initialCriteria);
  }
}
