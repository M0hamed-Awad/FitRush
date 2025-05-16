import 'package:fit_rush_app/styles/sizes.dart';
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
          padding: AppSizes.kPaddingH12,
          child: _buildProgressBarTitle(context),
        ),
        AppSizes.kSizeH4,
        _buildProgressBar(),
      ],
    );
  }

  Widget _buildProgressBar() {
    return CustomPercentProgressBar(percent: percent);
  }

  Row _buildProgressBarTitle(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("$title:", style: Theme.of(context).textTheme.bodyLarge),
        Text(
          "${percent * 100}%",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
      ],
    );
  }
}
