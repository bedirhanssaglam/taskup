import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainViewModel extends StateNotifier<int> {
  MainViewModel() : super(0);

  final PageController pageController = PageController();

  void changePage(int index) {
    state = index;
    pageController.jumpToPage(index);
  }

  void reset() {
    state = 0;
  }
}
