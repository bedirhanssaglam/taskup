import 'package:flutter/material.dart' show Color;
import 'package:gen/gen.dart';

final class Category {
  const Category({required this.name, required this.color, required this.icon});

  final String name;
  final Color color;
  final SvgGenImage icon;

  static final List<Category> categories = [
    Category(
      name: 'Grocery',
      color: const Color(0xFFCCFF80),
      icon: Assets.icons.grocery,
    ),
    Category(
      name: 'Work',
      color: const Color(0xFFFF9680),
      icon: Assets.icons.work,
    ),
    Category(
      name: 'Sport',
      color: const Color(0xFF80FFFF),
      icon: Assets.icons.sport,
    ),
    Category(
      name: 'Design',
      color: const Color(0xFF80FFD9),
      icon: Assets.icons.design,
    ),
    Category(
      name: 'University',
      color: const Color(0xFF809CFF),
      icon: Assets.icons.university,
    ),
    Category(
      name: 'Social',
      color: const Color(0xFFFF80EB),
      icon: Assets.icons.social,
    ),
    Category(
      name: 'Music',
      color: const Color(0xFFFC80FF),
      icon: Assets.icons.music,
    ),
    Category(
      name: 'Health',
      color: const Color(0xFF80FFA3),
      icon: Assets.icons.health,
    ),
    Category(
      name: 'Movie',
      color: const Color(0xFF80D1FF),
      icon: Assets.icons.movie,
    ),
    Category(
      name: 'House',
      color: const Color(0xFFFFCC80),
      icon: Assets.icons.house,
    ),
  ];
}
