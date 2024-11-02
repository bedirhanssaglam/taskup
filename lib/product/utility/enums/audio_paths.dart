enum AudioPaths {
  addTask('add_task_effect'),
  done('done_effect');

  const AudioPaths(this.value);
  final String value;

  String get audioPath => 'assets/audio/$value.mp3';
}
