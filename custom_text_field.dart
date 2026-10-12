import 'package:flutter/material.dart';
import 'app_colors.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final IconData icon;
  final bool password;
  final TextInputType? keyboardType;
  final int maxLines;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.label,
    required this.hint,
    required this.icon,
    this.password = false,
    this.keyboardType,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: password,
      keyboardType: keyboardType,
      maxLines: maxLines,
      style: const TextStyle(
        fontSize: 15,
        color: AppColors.textPrimary,
        fontWeight: FontWeight.w500,
      ),
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        hintStyle: const TextStyle(
          color: AppColors.textMuted,
          fontSize: 14,
        ),
        prefixIcon: Icon(
          icon,
          color: AppColors.primary,
        ),
      ),
    );
  }
}
