import 'package:flutter/material.dart';
import 'app_colors.dart';

class StatusBadge extends StatelessWidget {
  final String status;

  const StatusBadge({
    super.key,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    Color bg = AppColors.warningBg;
    Color fg = AppColors.warning;

    if (status == 'Completed' || status == 'Accepted' || status == 'Verified') {
      bg = AppColors.successBg;
      fg = AppColors.success;
    } else if (status == 'Rejected' || status == 'Cancelled' || status == 'Emergency') {
      bg = AppColors.errorBg;
      fg = AppColors.error;
    }

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 6,
      ),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: fg.withValues(alpha: 0.2)),
      ),
      child: Text(
        status,
        style: TextStyle(
          color: fg,
          fontWeight: FontWeight.bold,
          fontSize: 12,
        ),
      ),
    );
  }
}
