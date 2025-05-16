import 'package:fit_rush_app/styles/sizes.dart';
import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  final bool isFinalStep;
  final VoidCallback onPressed;

  const SubmitButton({
    super.key,
    required this.isFinalStep,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).colorScheme.primary,
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(borderRadius: AppSizes.kBorderRadius6),
      ),
      child: Text(
        isFinalStep ? "Sign Up" : "Next",
        style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
      ),
    );
  }
}
