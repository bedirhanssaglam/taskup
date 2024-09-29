part of 'add_task_sheet.dart';

mixin _AddTaskMixin on State<AddTaskBottomSheet> {
  final ValueNotifier<String> descriptionNotifier = ValueNotifier<String>('');
  final ValueNotifier<int?> priorityNotifier = ValueNotifier<int?>(null);
  final SpeechRecognitionService speechService = SpeechRecognitionService();
  final TextEditingController descriptionController = TextEditingController();

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
