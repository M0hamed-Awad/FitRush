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
              children: [
                CircleAvatar(
                  radius: 10,
                  backgroundColor:
                      isActive ? const Color(0xFFF06500) : Colors.grey,
                  child: Text(
                    "${index + 1}",
                    style: const TextStyle(fontSize: 12, color: Colors.white),
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  label,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: isActive ? const Color(0xFFF06500) : Colors.grey,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Container(
              height: 2,
              color: isActive ? const Color(0xFFF06500) : Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
