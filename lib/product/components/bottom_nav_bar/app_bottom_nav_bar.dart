import 'dart:io'; // Import for Platform

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen/gen.dart';
import 'package:task_management/product/utility/extensions/context_extensions.dart';
import 'package:task_management/product/utility/extensions/icon_extensions.dart';

class AppBottomNavBar extends StatelessWidget {
  const AppBottomNavBar({
    required this.pageIndex,
    super.key,
    this.onItemTapped,
  });

  final void Function(int)? onItemTapped;
  final int pageIndex;

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return CupertinoTabBar(
        currentIndex: pageIndex,
        onTap: onItemTapped,
        backgroundColor: context.colorScheme.surface,
        items: _bottomNavBarItems(context),
      );
    } else {
      return NavigationBar(
        selectedIndex: pageIndex,
        onDestinationSelected: onItemTapped,
        indicatorColor: context.colorScheme.outlineVariant,
        destinations: <Widget>[
          NavigationDestination(
            icon: Assets.icons.homeView.colored(
              pageIndex == 0
                  ? context.colorScheme.primary
                  : context.colorScheme.onSurfaceVariant,
              height: 28.h,
            ),
            label: 'Ana sayfa',
          ),
          NavigationDestination(
            icon: Assets.icons.calendar.colored(
              pageIndex == 1
                  ? context.colorScheme.primary
                  : context.colorScheme.onSurfaceVariant,
              height: 28.h,
            ),
            label: 'Calendar',
          ),
          NavigationDestination(
            icon: Assets.icons.user.colored(
              pageIndex == 2
                  ? context.colorScheme.primary
                  : context.colorScheme.onSurfaceVariant,
              height: 28.h,
            ),
            label: 'Profile',
          ),
        ],
      );
    }
  }

  List<BottomNavigationBarItem> _bottomNavBarItems(BuildContext context) => [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            size: 28.h,
            color: pageIndex == 0
                ? context.colorScheme.primary
                : context.colorScheme.onSurfaceVariant,
          ),
          label: 'Ana sayfa',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.calendar_month,
            size: 28.h,
            color: pageIndex == 1
                ? context.colorScheme.primary
                : context.colorScheme.onSurfaceVariant,
          ),
          label: 'Calendar',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.person,
            size: 28.h,
            color: pageIndex == 2
                ? context.colorScheme.primary
                : context.colorScheme.onSurfaceVariant,
          ),
          label: 'Profile',
        ),
      ];
}
