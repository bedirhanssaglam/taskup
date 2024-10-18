import 'package:flutter_riverpod/flutter_riverpod.dart';

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
}
