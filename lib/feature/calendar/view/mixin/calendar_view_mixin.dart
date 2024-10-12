part of '../calendar_view.dart';

mixin _CalendarViewMixin on ConsumerState<CalendarView> {
  final ValueNotifier<DateTime> selectedDate = ValueNotifier<DateTime>(DateTime.now());
  final ValueNotifier<DateTime> displayedMonth = ValueNotifier<DateTime>(DateTime.now());

  DateTime get currentMonth => DateTime.now(); // Cihazın mevcut ayı
  DateTime get nextMonth => DateTime(currentMonth.year, currentMonth.month + 1); // Bir sonraki ay

  bool get isNextMonthAllowed => displayedMonth.value.month == currentMonth.month; // İleri ay geçiş izni
  bool get isPreviousMonthAllowed => displayedMonth.value.month == nextMonth.month; // Geri ay geçiş izni

  @override
  void initState() {
    super.initState();
    Future<void>.microtask(_init);
  }

  Future<void> _init() async {
    await _fetchTasks();
  }

  AsyncValue<CalendarState> get calendarState => ref.watch(calendarViewModelProvider);

  List<Task> _filterTasksByDate(List<Task> tasks, DateTime date) {
    return tasks.where((Task task) => task.date?.toDate().isSameDate(date) ?? false).toList();
  }

  Future<void> _fetchTasks() async {
    await ref.read(calendarViewModelProvider.notifier).fetchTasks();
  }

  Future<void> deleteTask(String? documentId) async {
    if (documentId == null) return;
    final calendarViewModel = ref.read(calendarViewModelProvider.notifier);
    await calendarViewModel.deleteTask(documentId);
    await _fetchTasks();
  }

  Future<void> updateTask({required UpdateTaskData updateTaskData}) async {
    final calendarViewModel = ref.read(calendarViewModelProvider.notifier);
    await calendarViewModel.updateTaskStatus(
      updateTaskData: updateTaskData,
    );
    await _fetchTasks();
  }

  // Tarih aralığını bulunduğumuz günden başlayarak oluşturacağız
  List<DateTime> generateDateRange(DateTime month) {
    final DateTime now = DateTime.now();

    // Eğer kullanıcı bulunduğu aydaysa, o ayın bugünkü gününden başlat
    final DateTime startDay = (month.month == now.month && month.year == now.year)
        ? now // Bugünün tarihi ile başla
        : DateTime(month.year, month.month, 1); // Diğer aylar için ayın başı

    // Bir sonraki ayın ilk günü
    final DateTime firstDayOfNextMonth = DateTime(month.year, month.month + 1, 1);

    // Günlük tarih aralığını oluştur
    return List<DateTime>.generate(
      firstDayOfNextMonth.difference(startDay).inDays,
      (index) => startDay.add(Duration(days: index)),
    );
  }

  // Ay değişimi sırasında sadece mevcut ve bir sonraki ay izinli olacak şekilde sınır koyuyoruz
  void onMonthChanged(DateTime newMonth) {
    if (newMonth.month >= currentMonth.month && newMonth.month <= nextMonth.month) {
      displayedMonth.value = newMonth;
      selectedDate.value = DateTime(newMonth.year, newMonth.month, 1); // Yeni ayın ilk günü seçili olacak
    }
  }

  @override
  void dispose() {
    selectedDate.dispose();
    displayedMonth.dispose();
    super.dispose();
  }
}
