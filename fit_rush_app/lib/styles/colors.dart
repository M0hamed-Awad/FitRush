import 'package:flutter/material.dart';

class AppColors {
  // Common colors
  static const Color kPrimaryColor = Color(0xFFC12B1D); // Rush Red
  static const Color kAccentOrangeColor = Color(0xFFFF6A2B); // Vital Orange
  static const Color kAccentLimeColor = Color(0xFFA8E200); // Fitness Lime
  static const Color kNeutralLightColor = Color(0xFFF3F3F3); // Soft Gray
  static const Color kNeutralDarkColor = Color(0xFF1D1C1C); // Graphite Gray
  static const Color kBlueColor = Color(0xFF2196F3); // Info Blue
  static const Color kLightBlueColor = Color(0xFFBBDEFB); // Light Blue
  static const Color kSuccessColor = kAccentLimeColor; // Use for celebrations
  static const Color kButtonColor =
      kAccentOrangeColor; // Use for primary buttons
  static const Color kGreyColor = Color(0xFFAAAAAA);
  static const Color kLightGreyColor = Color(0xFFDDDDDD);

  // Light theme
  static const Color kSecondaryColorLight = Color(0xFFFFFFFF); // Power White
  static const Color kLightBackgroundColor = kNeutralLightColor;
  static const Color kTextColorLight = kSecondaryColorLight;

  // Dark theme
  static const Color kSecondaryColorDark = Color(0xFF333232);
  static const Color kTextColorDark = kNeutralDarkColor;
  static const Color kDarkBackgroundColor = kNeutralDarkColor;
}
