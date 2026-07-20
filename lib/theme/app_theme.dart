import 'package:flutter/material.dart';

/// Unganisha WiFi brand colors and shared theming.
class UnganishaColors {
  static const Color primary = Color(0xFF4F46E5); // Indigo 600
  static const Color primaryDark = Color(0xFF3730A3); // Indigo 800
  static const Color accent = Color(0xFF10B981); // Emerald 500
  static const Color background = Color(0xFFF8FAFC); // Slate 50
  static const Color surface = Colors.white;
  static const Color error = Color(0xFFEF4444); // Red 500
  static const Color textDark = Color(0xFF0F172A); // Slate 900
  static const Color textMuted = Color(0xFF64748B); // Slate 500
}

ThemeData buildUnganishaTheme() {
  final base = ThemeData.light();
  return base.copyWith(
    scaffoldBackgroundColor: UnganishaColors.background,
    colorScheme: base.colorScheme.copyWith(
      primary: UnganishaColors.primary,
      secondary: UnganishaColors.accent,
      error: UnganishaColors.error,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: UnganishaColors.primary,
      foregroundColor: Colors.white,
      elevation: 4,
      shadowColor: Color(0x334F46E5),
      centerTitle: true,
      titleTextStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, letterSpacing: 0.5),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: UnganishaColors.primary,
        foregroundColor: Colors.white,
        minimumSize: const Size.fromHeight(54),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, letterSpacing: 0.5),
        elevation: 4,
        shadowColor: const Color(0x404F46E5),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: UnganishaColors.primary,
        textStyle: const TextStyle(fontWeight: FontWeight.w600, letterSpacing: 0.5),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: UnganishaColors.surface,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: UnganishaColors.primary, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: UnganishaColors.error),
      ),
    ),
    textTheme: base.textTheme.apply(
      bodyColor: UnganishaColors.textDark,
      displayColor: UnganishaColors.textDark,
    ),
    useMaterial3: true,
  );
}
