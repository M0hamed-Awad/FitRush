import 'package:flutter/material.dart';

class FailWidget extends StatelessWidget {
  final String errorMessage;
  final VoidCallback onRetry;

  const FailWidget({
    super.key,
    required this.errorMessage,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Icon(Icons.error_outline, color: Colors.red, size: 50),
        const SizedBox(height: 20),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Text(errorMessage, style: const TextStyle(color: Colors.red)),
        ),
        const SizedBox(height: 20),
        ElevatedButton(onPressed: onRetry, child: const Text('Try Again')),
      ],
    );
  }
}
