import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainViewModel extends StateNotifier<int> {
  MainViewModel() : super(0) {
    pageController = PageController();
  }

  late final PageController pageController;

  void changePage(int index) {
    state = index;
    if (pageController.hasClients) pageController.jumpToPage(index);
  }

  void reset() {
    state = 0;
    if (pageController.hasClients) pageController.jumpToPage(0);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
