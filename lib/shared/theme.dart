import 'package:flutter/material.dart';

class AppColors {
  // Primary
  static const Color primary = Color(0xFF9BD9D9);
  static const Color primaryLight = Color(0xFFBAE8E8);
  static const Color primaryDark = Color(0xFF73BFBF);

  // Status colors
  static const Color success = Color(0xFF4CAF50);
  static const Color error = Color(0xFFF44336);
  static const Color warning = Color(0xFFFF9800);

  // Neutral
  static const Color textPrimary = Color(0xFF212121);
  static const Color textSecondary = Color(0xFF757575);
  static const Color background = Color(0xFFFFFFFF);
  static const Color surface = Color(0xFFF5F5F5);
  static const Color border = Color(0xFFE0E0E0);
}

class AppTypography {
  static const String fontFamily = 'Segoe UI';

  static const TextStyle headlineSmall = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.15,
    height: 1.2,
  );

  static const TextStyle titleLarge = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.15,
    height: 1.5,
  );

  static const TextStyle bodyLarge = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.5,
    height: 1.5,
  );

  static const TextStyle labelLarge = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    letterSpacing: 1.25,
    height: 1.43,
  );

  static const TextStyle labelSmall = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w400,
    letterSpacing: 1.25,
    height: 1.43,
  );
}

class AppSpacing {
  static const double xs = 4.0;
  static const double sm = 8.0;
  static const double md = 16.0;
  static const double lg = 24.0;
  static const double xl = 32.0;
}

ThemeData createAppTheme() {
  return ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      brightness: Brightness.light,
    ),
    scaffoldBackgroundColor: AppColors.background,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primary,
      elevation: 0,
      centerTitle: false,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.sm,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: const BorderSide(color: AppColors.border),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: const BorderSide(color: AppColors.primary, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: const BorderSide(color: AppColors.error),
      ),
      labelStyle: AppTypography.bodyLarge.copyWith(
        color: AppColors.textSecondary,
      ),
      hintStyle: AppTypography.bodyLarge.copyWith(
        color: AppColors.textSecondary,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.lg,
          vertical: AppSpacing.md,
        ),
        minimumSize: const Size(double.infinity, 48),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        textStyle: AppTypography.labelLarge.copyWith(color: Colors.white),
      ),
    ),
  );
}
