part of '../add_task_sheet.dart';

mixin _AddTaskMixin on ConsumerState<AddTaskBottomSheet> {
  final TextEditingController titleController = TextEditingController();

  final ValueNotifier<String> descriptionNotifier = ValueNotifier<String>('');
  final ValueNotifier<int?> priorityNotifier = ValueNotifier<int?>(null);
  final TextEditingController descriptionController = TextEditingController();
  Category? selectedCategory;
  DateTime? selectedDateTime;

  AddTaskState get addTaskState => ref.watch(addTaskViewModelProvider);

// TaskState'i AsyncValue olarak izleyin
  AsyncValue<TaskState> get taskState => ref.watch(taskViewModelProvider);

  Future<void> addTask(Task task) async {
    await ref.read(addTaskViewModelProvider.notifier).addTask(
          task: task,
        );
    if (!mounted) return;

    await ref.taskViewModel.fetchTasks();
    final appAudioPlayer = AppAudioPlayer();
    await appAudioPlayer.playAddTaskEffect();
  }

  @override
  void initState() {
    super.initState();
    descriptionController.text = descriptionNotifier.value;
    descriptionNotifier.addListener(() {
      descriptionController.text = descriptionNotifier.value;
    });
  }

  @override
  void dispose() {
    descriptionController.dispose();
    descriptionNotifier.dispose();
    priorityNotifier.dispose();
    super.dispose();
  }
}
