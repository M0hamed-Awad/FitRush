import 'package:fit_rush_app/constants.dart';
import 'package:fit_rush_app/widgets/common/custom_percent_progress_bar.dart';
import 'package:flutter/material.dart';

class CustomProgressBar extends StatelessWidget {
  final double percent;
  final String title;
  const CustomProgressBar({
    super.key,
    required this.percent,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: _buildProgressBarTitle(),
        ),
        SizedBox(height: 4),
        _buildProgressBar(),
      ],
    );
  }

  Widget _buildProgressBar() {
    return CustomPercentProgressBar(percent: percent);
  }

  Row _buildProgressBarTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("$title:", style: TextStyle(color: kTextColorDark)),
        Text(
          "${percent * 100}%",
          style: TextStyle(color: kTextColorDark, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
