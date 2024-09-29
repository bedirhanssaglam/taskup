import 'package:flutter/material.dart' show Color;
import 'package:gen/gen.dart';
import 'package:task_management/product/init/localization/locale_keys.g.dart';

final class Category {
  const Category({required this.name, required this.color, required this.icon});

  final String name;
  final Color color;
  final SvgGenImage icon;

  static final List<Category> categories = [
    Category(
      name: LocaleKeys.category_grocery,
      color: const Color(0xFFCCFF80),
      icon: Assets.icons.grocery,
    ),
    Category(
      name: LocaleKeys.category_work,
      color: const Color(0xFFFF9680),
      icon: Assets.icons.work,
    ),
    Category(
      name: LocaleKeys.category_sport,
      color: const Color(0xFF80FFFF),
      icon: Assets.icons.sport,
    ),
    Category(
      name: LocaleKeys.category_design,
      color: const Color(0xFF80FFD9),
      icon: Assets.icons.design,
    ),
    Category(
      name: LocaleKeys.category_university,
      color: const Color(0xFF809CFF),
      icon: Assets.icons.university,
    ),
    Category(
      name: LocaleKeys.category_social,
      color: const Color(0xFFFF80EB),
      icon: Assets.icons.social,
    ),
    Category(
      name: LocaleKeys.category_music,
      color: const Color(0xFFFC80FF),
      icon: Assets.icons.music,
    ),
    Category(
      name: LocaleKeys.category_health,
      color: const Color(0xFF80FFA3),
      icon: Assets.icons.health,
    ),
    Category(
      name: LocaleKeys.category_movie,
      color: const Color(0xFF80D1FF),
      icon: Assets.icons.movie,
    ),
    Category(
      name: LocaleKeys.category_house,
      color: const Color(0xFFFFCC80),
      icon: Assets.icons.house,
    ),
  ];
}
