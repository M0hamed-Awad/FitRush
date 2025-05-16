import 'package:fit_rush_app/styles/colors.dart';
import 'package:fit_rush_app/styles/sizes.dart';
import 'package:flutter/material.dart';

class CustomSignUpTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String hint;
  final IconData icon;
  final bool isPassword;
  final Widget? suffixIcon;
  final FormFieldValidator<String>? validator;
  final VoidCallback? onTap;
  final bool readOnly;
  final TextInputType? keyboardType;

  const CustomSignUpTextField({
    super.key,
    this.controller,
    required this.hint,
    required this.icon,
    this.isPassword = false,
    this.suffixIcon,
    this.validator,
    this.onTap,
    this.readOnly = false,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      controller: controller,
      validator: validator,
      obscureText: isPassword,
      onTap: onTap,
      readOnly: readOnly,
      style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: Theme.of(context).colorScheme.onSurface),
        suffixIcon: suffixIcon,
        hintText: hint,
        hintStyle: const TextStyle(color: AppColors.kGreyColor),
        filled: false,
        fillColor: const Color.fromRGBO(0, 0, 0, 0.2),
        border: OutlineInputBorder(borderRadius: AppSizes.kBorderRadius8),
      ),
    );
  }
}
