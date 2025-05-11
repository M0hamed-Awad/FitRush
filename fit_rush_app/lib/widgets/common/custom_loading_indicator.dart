import 'package:fit_rush_app/constants.dart';
import 'package:flutter/material.dart';

class CustomLoadingIndicator extends StatelessWidget {
  const CustomLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      backgroundColor: Colors.transparent,
      color: kPrimaryColor,
      strokeWidth: 8,
      strokeCap: StrokeCap.round,
    );
  }
}
