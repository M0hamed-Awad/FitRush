import 'package:fit_rush_app/widgets/sign_up/custom_sign_up_text_field.dart';
import 'package:flutter/material.dart';

class BioDataStep extends StatelessWidget {
  final TextEditingController heightController;
  final TextEditingController weightController;
  final VoidCallback onPickDate;
  final DateTime? selectedDate;

  const BioDataStep({
    super.key,
    required this.heightController,
    required this.weightController,
    required this.onPickDate,
    required this.selectedDate,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      children: [
        GestureDetector(
          onTap: onPickDate,
          child: AbsorbPointer(
            child: CustomSignUpTextField(
              hint:
                  selectedDate != null
                      ? "${selectedDate!.toLocal()}".split(' ')[0]
                      : "Date of Birth",
              icon: Icons.calendar_today,
              readOnly: true,
            ),
          ),
        ),
        CustomSignUpTextField(
          controller: heightController,
          hint: "Height (cm)",
          icon: Icons.height,
          validator:
              (val) => val == null || val.isEmpty ? "Height required" : null,
        ),
        CustomSignUpTextField(
          controller: weightController,
          hint: "Weight (kg)",
          icon: Icons.monitor_weight,
          validator:
              (val) => val == null || val.isEmpty ? "Weight required" : null,
        ),
      ],
    );
  }
}
