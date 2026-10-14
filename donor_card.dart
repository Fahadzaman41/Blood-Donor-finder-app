import 'package:flutter/material.dart';
import 'app_colors.dart';

class DonorCard extends StatelessWidget {
  final String name;
  final String bloodGroup;
  final String location;
  final String distanceOrStatus;
  final VoidCallback onTap;
  final bool isVerified;

  const DonorCard({
    super.key,
    required this.name,
    required this.bloodGroup,
    required this.location,
    this.distanceOrStatus = '',
    required this.onTap,
    this.isVerified = true,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        onTap: onTap,
        leading: Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: AppColors.primarySurface,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: AppColors.primaryLight.withValues(alpha: 0.3),
            ),
          ),
          child: Center(
            child: Text(
              bloodGroup,
              style: const TextStyle(
                color: AppColors.primary,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ),
        title: Row(
          children: [
            Text(
              name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
                fontSize: 16,
              ),
            ),
            if (isVerified) ...[
              const SizedBox(width: 6),
              const Icon(
                Icons.verified_rounded,
                size: 16,
                color: AppColors.success,
              ),
            ],
          ],
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 4.0),
          child: Text(
            distanceOrStatus.isNotEmpty
                ? '$location • $distanceOrStatus'
                : location,
            style: const TextStyle(
              color: AppColors.textSecondary,
              fontSize: 13,
            ),
          ),
        ),
        trailing: const Icon(
          Icons.chevron_right_rounded,
          color: AppColors.textMuted,
        ),
      ),
    );
  }
}
