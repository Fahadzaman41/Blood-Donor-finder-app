import 'package:flutter/material.dart';
import 'app_colors.dart';

class BloodGroupDropdown extends StatelessWidget {
  final String value;
  final ValueChanged<String?> onChanged;

  const BloodGroupDropdown({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      initialValue: value,
      icon: const Icon(Icons.arrow_drop_down_circle_outlined, color: AppColors.primary),
      decoration: const InputDecoration(
        labelText: 'Blood Group',
        prefixIcon: Icon(Icons.bloodtype, color: AppColors.primary),
      ),
      items: const [
        DropdownMenuItem(value: 'A+', child: Text('A+ (Positive)')),
        DropdownMenuItem(value: 'A-', child: Text('A- (Negative)')),
        DropdownMenuItem(value: 'B+', child: Text('B+ (Positive)')),
        DropdownMenuItem(value: 'B-', child: Text('B- (Negative)')),
        DropdownMenuItem(value: 'AB+', child: Text('AB+ (Positive)')),
        DropdownMenuItem(value: 'AB-', child: Text('AB- (Negative)')),
        DropdownMenuItem(value: 'O+', child: Text('O+ (Positive)')),
        DropdownMenuItem(value: 'O-', child: Text('O- (Negative)')),
      ],
      onChanged: onChanged,
    );
  }
}
