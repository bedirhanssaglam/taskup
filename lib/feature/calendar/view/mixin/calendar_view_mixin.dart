part of '../calendar_view.dart';

mixin _CalendarViewMixin on ConsumerState<CalendarView> {
  DateTime selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    Future<void>.microtask(_init);
  }

  Future<void> _init() async {
    await ref.read(calendarViewModelProvider.notifier).fetchTasks();
  }

  AsyncValue<CalendarState> get calendarState =>
      ref.watch(calendarViewModelProvider);
}
