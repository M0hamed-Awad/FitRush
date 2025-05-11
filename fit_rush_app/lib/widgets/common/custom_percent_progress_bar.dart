import 'package:fit_rush_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class CustomPercentProgressBar extends StatelessWidget {
  final double percent;
  const CustomPercentProgressBar({super.key, required this.percent});

  @override
  Widget build(BuildContext context) {
    return LinearPercentIndicator(
      percent: percent,
      lineHeight: 16,
      animation: true,
      barRadius: Radius.circular(24),
      progressColor: kPrimaryColor,
      backgroundColor: kSecondaryColor,
    );
  }
}
