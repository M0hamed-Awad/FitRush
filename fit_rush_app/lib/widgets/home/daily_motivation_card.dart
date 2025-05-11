import 'package:fit_rush_app/constants.dart';
import 'package:flutter/material.dart';

class DailyMotivationCard extends StatelessWidget {
  const DailyMotivationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: kSecondaryColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 8.0),
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: "Every step counts!\n",
            style: TextStyle(
              fontSize: 18,
              height: 2,
              fontWeight: FontWeight.w400,
              color: kTextColorDark,
            ),
            children: [
              TextSpan(text: "You are only "),
              TextSpan(
                text: "500 Steps ",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: kPrimaryColor,
                ),
              ),
              TextSpan(text: "away from your GOAL! "),
            ],
          ),
        ),
      ),
    );
  }
}
