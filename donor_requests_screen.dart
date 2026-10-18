import 'package:flutter/material.dart';
import 'app_colors.dart';

class DonorRequestsScreen extends StatelessWidget {
  const DonorRequestsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Blood Requests'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () {
            if (Navigator.canPop(context)) {
              Navigator.pop(context);
            } else {
              Navigator.pushReplacementNamed(context, '/donor/home');
            }
          },
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        children: [
          const Text(
            'Pending Blood Requests',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 6),
          const Text(
            'Patients matching your blood group (O+)',
            style: TextStyle(
              fontSize: 13,
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: 16),
          _requestItem(
            context,
            'Ali Khan',
            'O+',
            '2 Units',
            'PIMS Hospital',
            'Urgent',
          ),
          _requestItem(
            context,
            'Usman Ahmed',
            'O+',
            '1 Unit',
            'Shifa Hospital',
            'Standard',
          ),
        ],
      ),
    );
  }

  Widget _requestItem(
    BuildContext context,
    String name,
    String blood,
    String units,
    String hospital,
    String tag,
  ) {
    bool isUrgent = tag == 'Urgent';
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        onTap: () {
          Navigator.pushNamed(
            context,
            '/donor/request-detail',
          );
        },
        leading: Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: AppColors.primarySurface,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: Text(
              blood,
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
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: isUrgent ? AppColors.errorBg : AppColors.warningBg,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                tag,
                style: TextStyle(
                  color: isUrgent ? AppColors.error : AppColors.warning,
                  fontWeight: FontWeight.bold,
                  fontSize: 10,
                ),
              ),
            ),
          ],
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 4.0),
          child: Text(
            '$hospital • $units required',
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
