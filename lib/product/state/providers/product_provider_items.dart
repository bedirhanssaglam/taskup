import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_management/feature/main/view_model/main_view_model.dart';
import 'package:task_management/product/components/bottom_sheet/filter/view_model/filter_view_model.dart';
import 'package:task_management/product/init/navigation/navigation_service.dart';
import 'package:task_management/product/state/theme/app_theme_view_model.dart';
import 'package:task_management/product/utility/task_filter_helper.dart';

class ProductProviderItems {
  static final navigationService = Provider<NavigationService>((ref) {
    return NavigationService();
  });

  static final mainViewModel = StateNotifierProvider<MainViewModel, int>((ref) {
    return MainViewModel();
  });

  static final filterCriteriaProvider =
      StateNotifierProvider<FilterViewModel, FilterCriteria>(
    (ref) => FilterViewModel(),
  );

  static final appThemeViewModel =
      StateNotifierProvider<AppThemeViewModel, ThemeMode>((ref) {
    return AppThemeViewModel();
  });
}
