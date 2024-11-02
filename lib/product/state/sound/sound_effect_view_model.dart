import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_management/product/service/cache/cache_manager.dart';
import 'package:task_management/product/utility/enums/cache_paths.dart';

class SoundEffectViewModel extends StateNotifier<bool> {
  SoundEffectViewModel() : super(true) {
    _initialize();
  }

  final CacheManager _cacheManager = HiveCacheManager();

  Future<void> toggleSoundEffect() async {
    state = !state;
    await _cacheManager.saveData(CachePaths.soundEffect.value, state);
  }

  Future<void> clearSoundEffect() async {
    await _cacheManager.clearData(CachePaths.soundEffect.value);
  }

  Future<void> _initialize() async {
    final soundEffect =
        await _cacheManager.getData(CachePaths.soundEffect.value) as bool?;
    state = soundEffect ?? true;
  }
}
