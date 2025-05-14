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
        backgroundColor: const Color(0xFFF06500),
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      ),
      child: Text(
        isFinalStep ? "Sign Up" : "Next",
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
