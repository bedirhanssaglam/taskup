import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_management/product/service/cache/cache_manager.dart';

class AppThemeViewModel extends StateNotifier<ThemeMode> {
  AppThemeViewModel() : super(ThemeMode.light) {
    _initialize();
  }
  static const String _themeKey = 'theme_mode';
  final CacheManager _cacheManager = HiveCacheManager();

  void toggleTheme() {
    if (state == ThemeMode.light) {
      state = ThemeMode.dark;
      _cacheManager.saveData(_themeKey, ThemeMode.dark.index);
    } else {
      state = ThemeMode.light;
      _cacheManager.saveData(_themeKey, ThemeMode.light.index);
    }
  }

  Future<void> clearTheme() async {
    await _cacheManager.clearData(_themeKey);
  }

  Future<void> _initialize() async {
    final savedTheme = await _cacheManager.getData(_themeKey);
    state = ThemeMode.values[(savedTheme ?? ThemeMode.system.index) as int];
  }
}
