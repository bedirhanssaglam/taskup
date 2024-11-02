import 'package:audio_plus/audio_plus.dart';
import 'package:task_management/product/service/cache/cache_manager.dart';
import 'package:task_management/product/utility/enums/audio_paths.dart';
import 'package:task_management/product/utility/enums/cache_paths.dart';

final class AppAudioPlayer {
  final CacheManager _cacheManager = HiveCacheManager();

  Future<void> playMarkAsDoneEffect() async {
    final soundEffectEnabled =
        await _cacheManager.getData(CachePaths.soundEffect.value) as bool?;

    if (soundEffectEnabled ?? true) {
      await AudioPlus.play(AudioPaths.done.audioPath);
    }
  }

  Future<void> playAddTaskEffect() async {
    final soundEffectEnabled =
        await _cacheManager.getData(CachePaths.soundEffect.value) as bool?;

    if (soundEffectEnabled ?? true) {
      await AudioPlus.play(AudioPaths.addTask.audioPath);
    }
  }
}
