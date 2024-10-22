import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_management/product/service/cache/cache_manager.dart';
import 'package:task_management/product/utility/enums/cache_paths.dart';

class AppThemeViewModel extends StateNotifier<ThemeMode> {
  AppThemeViewModel() : super(ThemeMode.light) {
    _initialize();
  }

  final CacheManager _cacheManager = HiveCacheManager();

  void toggleTheme() {
    if (state == ThemeMode.light) {
      state = ThemeMode.dark;
      _cacheManager.saveData(CachePaths.themeMode.value, ThemeMode.dark.index);
    } else {
      state = ThemeMode.light;
      _cacheManager.saveData(CachePaths.themeMode.value, ThemeMode.light.index);
    }
  }

  Future<void> clearTheme() async {
    await _cacheManager.clearData(CachePaths.themeMode.value);
  }

  Future<void> _initialize() async {
    final savedTheme = await _cacheManager.getData(CachePaths.themeMode.value);
    state = ThemeMode.values[(savedTheme ?? ThemeMode.light.index) as int];
  }
}
