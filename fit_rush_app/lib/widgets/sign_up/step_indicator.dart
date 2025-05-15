import 'package:fit_rush_app/styles/colors.dart';
import 'package:fit_rush_app/styles/sizes.dart';
import 'package:flutter/material.dart';

class StepIndicator extends StatelessWidget {
  final String label;
  final int index;
  final int currentStep;
  final VoidCallback onTap;

  const StepIndicator({
    super.key,
    required this.label,
    required this.index,
    required this.currentStep,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isActive = currentStep == index;

    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 4,
              children: [
                CircleAvatar(
                  radius: 10,
                  backgroundColor:
                      isActive
                          ? Theme.of(context).colorScheme.primary
                          : AppColors.kGreyColor,
                  child: Text(
                    "${index + 1}",
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColors.kSecondaryColorLight,
                    ),
                  ),
                ),
                AppSizes.kSizeH8,
                Text(
                  label,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color:
                        isActive
                            ? Theme.of(context).colorScheme.primary
                            : AppColors.kGreyColor,
                  ),
                ),
              ],
            ),
            AppSizes.kSizeH4,
            Container(
              height: 2,
              color:
                  isActive
                      ? Theme.of(context).colorScheme.primary
                      : AppColors.kGreyColor,
            ),
          ],
        ),
      ),
    );
  }
}
