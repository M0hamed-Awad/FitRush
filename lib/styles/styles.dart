import 'package:fit_rush_app/styles/colors.dart';
import 'package:flutter/material.dart';

class AppTextStyles {
  static const TextStyle kActivityTextDate = TextStyle(
    color: AppColors.kGreyColor,
    fontWeight: FontWeight.w300,
    fontSize: 12,
    fontFamily: "Inter",
  );

  static const TextStyle kActivityTextData = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    fontFamily: "Inter",
  );

  static const TextStyle kStatsTextTitle = TextStyle(
    color: AppColors.kPrimaryColor,
    fontSize: 16,
    fontWeight: FontWeight.w500,
    fontFamily: "Inter",
  );

  static const TextStyle kRingsDataText = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    fontFamily: "Inter",
  );
}