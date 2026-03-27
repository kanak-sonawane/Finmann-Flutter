import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const bg900 = Color(0xFF060B08);
  static const bg800 = Color(0xFF0A1210);
  static const bg700 = Color(0xFF0F1A13);
  static const bg600 = Color(0xFF141F18);
  static const surface = Color(0xFF172219);
  static const surfaceElevated = Color(0xFF1D2C20);
  static const surfaceHover = Color(0xFF223227);
  static const border = Color(0xFF1E3324);
  static const borderBright = Color(0xFF2A4A32);

  static const primary = Color(0xFF00E676);
  static const primaryLight = Color(0xFF69F0AE);
  static const primaryDark = Color(0xFF00B35A);
  static const accent = Color(0xFF1DE9B6);
  static const accentDim = Color(0xFF00BFA5);

  static const expense = Color(0xFFFF4C6A);
  static const expenseDim = Color(0xFFBF3650);
  static const expenseSurface = Color(0xFF1F1118);
  static const income = Color(0xFF00E676);
  static const incomeSurface = Color(0xFF0D1F14);
  static const warning = Color(0xFFFFB300);
  static const warningSurface = Color(0xFF1F1A0D);
  static const info = Color(0xFF40C4FF);

  static const textPrimary = Color(0xFFECF5EE);
  static const textSecondary = Color(0xFF7DBF8A);
  static const textMuted = Color(0xFF3E6B49);
  static const textDisabled = Color(0xFF243B2A);

  // gradient stops
  static const g1 = Color(0xFF00E676);
  static const g2 = Color(0xFF1DE9B6);
  static const g3 = Color(0xFF00B0FF);
}

class AppTheme {
  static ThemeData get dark {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.bg900,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.primary,
        secondary: AppColors.accent,
        surface: AppColors.surface,
        error: AppColors.expense,
        onPrimary: AppColors.bg900,
        onSecondary: AppColors.bg900,
        onSurface: AppColors.textPrimary,
      ),
      textTheme: GoogleFonts.dmSansTextTheme().copyWith(
        displayLarge: GoogleFonts.spaceGrotesk(
          color: AppColors.textPrimary, fontSize: 32,
          fontWeight: FontWeight.w800, letterSpacing: -1,
        ),
        displayMedium: GoogleFonts.spaceGrotesk(
          color: AppColors.textPrimary, fontSize: 26,
          fontWeight: FontWeight.w700, letterSpacing: -0.5,
        ),
        headlineLarge: GoogleFonts.spaceGrotesk(
          color: AppColors.textPrimary, fontSize: 22,
          fontWeight: FontWeight.w700,
        ),
        headlineMedium: GoogleFonts.spaceGrotesk(
          color: AppColors.textPrimary, fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
        titleLarge: GoogleFonts.spaceGrotesk(
          color: AppColors.textPrimary, fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
        bodyLarge: GoogleFonts.dmSans(color: AppColors.textPrimary, fontSize: 15),
        bodyMedium: GoogleFonts.dmSans(color: AppColors.textSecondary, fontSize: 13),
        labelLarge: GoogleFonts.spaceGrotesk(
          color: AppColors.textPrimary, fontSize: 14,
          fontWeight: FontWeight.w600, letterSpacing: 0.2,
        ),
      ),
      cardTheme: CardThemeData(
        color: AppColors.surface,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: const BorderSide(color: AppColors.border, width: 1),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.bg700,
        contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: AppColors.border),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: AppColors.border),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: AppColors.primary, width: 1.5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: AppColors.expense),
        ),
        hintStyle: GoogleFonts.dmSans(color: AppColors.textMuted),
        labelStyle: GoogleFonts.dmSans(color: AppColors.textSecondary),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.bg900,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
          textStyle: GoogleFonts.spaceGrotesk(
            fontSize: 15, fontWeight: FontWeight.w700, letterSpacing: 0.2,
          ),
          elevation: 0,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.primaryLight,
          textStyle: GoogleFonts.spaceGrotesk(fontSize: 14, fontWeight: FontWeight.w600),
        ),
      ),
      dividerTheme: const DividerThemeData(color: AppColors.border, thickness: 1),
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.bg900,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
        titleTextStyle: GoogleFonts.spaceGrotesk(
          color: AppColors.textPrimary, fontSize: 20, fontWeight: FontWeight.w700,
        ),
        iconTheme: const IconThemeData(color: AppColors.textPrimary),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.bg800,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.textMuted,
        elevation: 0,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
