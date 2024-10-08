part of '../calendar_view.dart';

mixin _CalendarViewMixin on ConsumerState<CalendarView> {
  final ValueNotifier<DateTime> selectedDate =
      ValueNotifier<DateTime>(DateTime.now());

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

  List<Task> _filterTasksByDate(List<Task> tasks, DateTime date) {
    return tasks
        .where((Task task) => task.date?.toDate().isSameDate(date) ?? false)
        .toList();
  }

  Future<void> deleteTask(String? documentId) async {
    if (documentId == null) return;
    final calendarViewModel = ref.read(calendarViewModelProvider.notifier);
    await calendarViewModel.deleteTask(documentId);
  }

  Future<void> updateTask({required UpdateTaskData updateTaskData}) async {
    final calendarViewModel = ref.read(calendarViewModelProvider.notifier);
    await calendarViewModel.updateTaskStatus(
      updateTaskData: updateTaskData,
    );
    await calendarViewModel.fetchTasks();
  }

  @override
  void dispose() {
    selectedDate.dispose();
    super.dispose();
  }
}
