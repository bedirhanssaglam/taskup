import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_management/product/service/cache/cache_manager.dart';
import 'package:task_management/product/utility/enums/cache_paths.dart';

class OnboardingViewModel extends StateNotifier<int> {
  OnboardingViewModel(this.totalPages) : super(0);

  final int totalPages;

  void nextPage() {
    if (state < totalPages - 1) state++;
  }

  void previousPage() {
    if (state > 0) state--;
  }

  void setPage(int index) {
    if (index >= 0 && index < totalPages) {
      state = index;
    }
  }

  Future<void> setPassStartingView() async {
    final hiveCacheManager = HiveCacheManager();
    await hiveCacheManager.saveData(CachePaths.passStarting.value, true);
  }
}
