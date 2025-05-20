import 'package:flutter/material.dart';

import 'colors.dart';

class AppThemes {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,

    // Colors
    colorScheme: ColorScheme.light(
      primary: AppColors.kPrimaryColor,
      onPrimary: AppColors.kTextColorLight,
      secondary: AppColors.kAccentOrangeColor,
      onSecondary: AppColors.kTextColorLight,
      surface: AppColors.kSecondaryColorLight,
      onSurface: AppColors.kTextColorDark,
      brightness: Brightness.light,
    ),

    primaryColor: AppColors.kPrimaryColor,
    scaffoldBackgroundColor: AppColors.kLightBackgroundColor,

    // App Bar
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.kLightBackgroundColor,
      foregroundColor: AppColors.kTextColorDark,
      titleSpacing: 16,
      actionsPadding: EdgeInsets.only(right: 16),
      actionsIconTheme: IconThemeData(
        color: AppColors.kTextColorDark,
        size: 24,
      ),
      centerTitle: false,
      elevation: 0,
      titleTextStyle: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w400,
        color: AppColors.kTextColorDark,
        fontFamily: "Poppins",
      ),
    ),

    // Bottom Nav Bar
    bottomAppBarTheme: BottomAppBarTheme(color: AppColors.kSecondaryColorLight),

    // Typography
    textTheme: const TextTheme(
      headlineMedium: TextStyle(
        fontSize: 34,
        fontWeight: FontWeight.w400,
        color: AppColors.kTextColorDark,
        fontFamily: "Poppins",
      ),
      headlineSmall: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w400,
        color: AppColors.kTextColorDark,
        fontFamily: "Poppins",
      ),
      titleLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: AppColors.kTextColorDark,
        fontFamily: "Poppins",
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: AppColors.kTextColorDark,
        fontFamily: "Inter",
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: AppColors.kTextColorDark,
        fontFamily: "Inter",
      ),
      bodySmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: AppColors.kTextColorDark,
        fontFamily: "Inter",
      ),
      labelLarge: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: AppColors.kTextColorDark,
        fontFamily: "Inter",
      ),
    ),

    // Icons Theme
    iconTheme: IconThemeData(color: AppColors.kPrimaryColor, size: 24),

    // Divider Theme
    dividerTheme: DividerThemeData(
      color: AppColors.kNeutralDarkColor,
      thickness: 1,
    ),

    // Shapes
    // Elevated Buttons Theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.kButtonColor,
        foregroundColor: AppColors.kTextColorLight,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
    ),

    // Card Theme
    cardTheme: const CardTheme(color: AppColors.kSecondaryColorLight),
  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,

    // Colors
    colorScheme: ColorScheme.dark(
      primary: AppColors.kPrimaryColor,
      onPrimary: AppColors.kTextColorLight,
      secondary: AppColors.kAccentOrangeColor,
      onSecondary: AppColors.kTextColorLight,
      surface: AppColors.kNeutralDarkColor,
      onSurface: AppColors.kTextColorLight,
      brightness: Brightness.dark,
    ),

    primaryColor: AppColors.kPrimaryColor,
    scaffoldBackgroundColor: AppColors.kNeutralDarkColor,

    // App Bar
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.kNeutralDarkColor,
      foregroundColor: AppColors.kTextColorLight,
      titleSpacing: 16,
      actionsPadding: EdgeInsets.only(right: 16),
      actionsIconTheme: IconThemeData(
        color: AppColors.kTextColorLight,
        size: 24,
      ),
      centerTitle: false,
      elevation: 0,
      titleTextStyle: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w400,
        color: AppColors.kTextColorLight,
        fontFamily: "Poppins",
      ),
    ),

    // Bottom Nav Bar
    bottomAppBarTheme: BottomAppBarTheme(color: AppColors.kSecondaryColorDark),

    // Typography
    textTheme: const TextTheme(
      headlineMedium: TextStyle(
        fontSize: 34,
        fontWeight: FontWeight.w400,
        color: AppColors.kTextColorLight,
        fontFamily: "Poppins",
      ),
      headlineSmall: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w400,
        color: AppColors.kTextColorLight,
        fontFamily: "Poppins",
      ),
      titleLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: AppColors.kTextColorLight,
        fontFamily: "Poppins",
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: AppColors.kTextColorLight,
        fontFamily: "Inter",
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: AppColors.kTextColorLight,
        fontFamily: "Inter",
      ),
      bodySmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: AppColors.kTextColorLight,
        fontFamily: "Inter",
      ),
      labelLarge: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: AppColors.kTextColorLight,
        fontFamily: "Inter",
      ),
    ),

    // Icons Theme
    iconTheme: IconThemeData(color: AppColors.kPrimaryColor, size: 24),

    // Divider Theme
    dividerTheme: DividerThemeData(
      color: AppColors.kNeutralLightColor,
      thickness: 1,
    ),

    // Shapes
    // Elevated Buttons Theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.kButtonColor,
        foregroundColor: AppColors.kTextColorLight,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
    ),

    // Card Theme
    cardTheme: const CardTheme(color: AppColors.kSecondaryColorDark),
  );
}
