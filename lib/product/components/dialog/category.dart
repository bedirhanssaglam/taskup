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

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'color': _getColorString(color),
      'icon': icon.path,
    };
  }

  static Category fromFirestore(Map<String, dynamic> data) {
    return Category(
      name: data['name'] as String,
      color: _getColorFromString(data['color'] as String),
      icon: SvgGenImage(data['icon'] as String),
    );
  }

  String _getColorString(Color color) {
    return '#${color.value.toRadixString(16).substring(2, 8).toUpperCase()}';
  }

  static Color _getColorFromString(String colorString) {
    // Öncelikle '#' karakterini kontrol edin ve kaldırın
    if (colorString.startsWith('#')) {
      colorString = colorString.substring(1);
    }

    // Eğer colorString 6 karakterden fazla değilse, hatayı ele alabilirsiniz.
    if (colorString.length != 6) {
      throw const FormatException('Color string must be in #RRGGBB format');
    }

    // Renk bileşenlerini al
    final r = int.parse(colorString.substring(0, 2), radix: 16);
    final g = int.parse(colorString.substring(2, 4), radix: 16);
    final b = int.parse(colorString.substring(4, 6), radix: 16);

    // Renk nesnesini oluştur
    return Color.fromARGB(255, r, g, b); // A'yı 255 (tam görünür) yapıyoruz
  }
}
