import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_management/feature/calendar/view/calendar_view.dart';
import 'package:task_management/feature/home/view/home_view.dart';
import 'package:task_management/feature/profile/view/profile_view.dart';
import 'package:task_management/product/components/bottom_nav_bar/app_bottom_nav_bar.dart';
import 'package:task_management/product/state/product_provider_items.dart';

final class MainView extends ConsumerWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageIndex = ref.watch(ProductProviderItems.mainViewModel);
    final pageController =
        ref.read(ProductProviderItems.mainViewModel.notifier).pageController;
    return Scaffold(
      body: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          HomeView(),
          CalendarView(),
          ProfileView(),
        ],
      ),
      bottomNavigationBar: AppBottomNavBar(
        onItemTapped:
            ref.read(ProductProviderItems.mainViewModel.notifier).changePage,
        pageIndex: pageIndex,
      ),
    );
  }
}
