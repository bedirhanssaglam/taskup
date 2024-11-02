import 'package:hive/hive.dart';

abstract class CacheManager {
  Future<void> saveData(String key, Object value);
  Future<Object?> getData(String key);
  Future<void> clearData(String key);
  Future<void> clearAll();
}

class HiveCacheManager implements CacheManager {
  HiveCacheManager();

  static const String _dbName = 'taskup';

  Future<LazyBox<Object>> _getLazyBox() async {
    return Hive.isBoxOpen(_dbName)
        ? Hive.lazyBox<Object>(_dbName)
        : await Hive.openLazyBox<Object>(_dbName);
  }

  @override
  Future<void> saveData(String key, Object value) async {
    final box = await _getLazyBox();
    await box.put(key, value);
  }

  @override
  Future<Object?> getData(String key) async {
    final box = await _getLazyBox();
    return box.get(key);
  }

  @override
  Future<void> clearData(String key) async {
    final box = await _getLazyBox();
    await box.delete(key);
  }

  @override
  Future<void> clearAll() async {
    final box = await _getLazyBox();
    await box.clear();
  }
}
