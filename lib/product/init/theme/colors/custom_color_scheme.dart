import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Project custom colors
final class CustomColorScheme {
  const CustomColorScheme._();

  /// Light color scheme set for a travel app
  static const ColorScheme lightColorScheme = ColorScheme.light(
    primary: Color(0xFF0077B6), // Turkuaz Mavi (Deniz ve Gökyüzü)
    primaryContainer: Color(0xFF00B4D8), // Açık Turkuaz
    secondary: Color(0xFFFFC300), // Canlı Sarı (Güneşli Tonlar)
    secondaryContainer: Color(0xFFFFE699), // Hafif Sarı
    tertiary: Color(0xFF90BE6D), // Doğal Yeşil (Doğa ve Bitki Tonları)
    tertiaryContainer: Color(0xFFC2E59C), // Açık Yeşil
    errorContainer: Color(0xFFFF595E), // Hata Rengi: Kırmızı
    outline: Color(0xFF2D3142), // Kontur Rengi: Koyu Gri
    background: CupertinoColors.systemGroupedBackground, // Nötr Arka Plan
    onBackground: Color(0xFF1C1B1F), // Koyu Yazı Rengi
    surface: Color(0xFFFFFFFF), // Beyaz Yüzey Rengi
    onSurface: Color(0xFF1C1B1F), // Koyu Yazı Rengi
    surfaceVariant: Color(0xFFF0F3F4), // Hafif Gri Yüzey
    onSurfaceVariant: Color(0xFF5D737E), // Orta Gri Yazı
    inverseSurface: Color(0xFF373E4E), // Ters Yüzey: Koyu
    onInverseSurface: Color(0xFFFFFFFF), // Ters Yüzeyde Beyaz Yazı
    inversePrimary: Color(0xFF0096C7), // Ters Ana Renk: Orta Mavi
    shadow: Color(0xFF273036), // Gölge: Koyu Ton
    surfaceTint: Color(0xFF0077B6), // Yüzey Vurgusu: Ana Renk
    outlineVariant: Color(0xFFB0C1D1), // Kontur Rengi: Açık Gri-Mavi
    scrim: Color(0xFF000000), // Karartma Rengi
  );

  /// Dark color scheme set for a travel app
  static const ColorScheme darkColorScheme = ColorScheme.dark(
    primary: Color(0xFF00B4D8), // Canlı Turkuaz
    primaryContainer: Color(0xFF0077B6), // Koyu Turkuaz
    secondary: Color(0xFFFFC300), // Canlı Sarı
    secondaryContainer: Color(0xFFB58B00), // Koyu Altın Sarı
    tertiary: Color(0xFF90BE6D), // Canlı Yeşil
    tertiaryContainer: Color(0xFF4B6B2F), // Koyu Yeşil
    errorContainer: Color(0xFFBA1B1B), // Koyu Kırmızı
    outline: Color(0xFF8A8D91), // Açık Gri Ton
    background: CupertinoColors.darkBackgroundGray, // Koyu Arka Plan
    onBackground: Color(0xFFE6E1E5), // Beyaz Yazı
    surface: Color(0xFF1C1B1F), // Koyu Yüzey
    onSurface: Color(0xFFE6E1E5), // Beyaz Yazı
    surfaceVariant: Color(0xFF495057), // Koyu Gri Yüzey
    onSurfaceVariant: Color(0xFFC1C7C9), // Açık Gri Yazı
    inverseSurface: Color(0xFF373E4E), // Ters Yüzey: Koyu
    onInverseSurface: Color(0xFFFFFFFF), // Beyaz Yazı
    inversePrimary: Color(0xFF0096C7), // Ters Ana Renk
    shadow: Color(0xFF000000), // Gölge
    surfaceTint: Color(0xFF00B4D8), // Vurgu Rengi: Turkuaz
    outlineVariant: Color(0xFF494F59), // Kontur Rengi
    scrim: Color(0xFF000000), // Karartma
  );
}
