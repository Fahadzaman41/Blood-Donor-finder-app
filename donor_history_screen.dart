import 'package:flutter/material.dart';
import 'app_colors.dart';

class DonorHistoryScreen extends StatelessWidget {
  const DonorHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Donation History'),
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
            'Completed Donations',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 6),
          const Text(
            'Your recorded donation logs and verified contributions.',
            style: TextStyle(
              fontSize: 13,
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: 16),
          _historyCard(
            patientName: 'Ali Khan',
            hospital: 'PIMS Hospital, Islamabad',
            date: '15 September 2026',
            units: '1 Unit (O+)',
          ),
          _historyCard(
            patientName: 'Usman Ahmed',
            hospital: 'Shifa Hospital, Islamabad',
            date: '02 August 2026',
            units: '1 Unit (O+)',
          ),
        ],
      ),
    );
  }

  Widget _historyCard({
    required String patientName,
    required String hospital,
    required String date,
    required String units,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: AppColors.successBg,
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Icon(
            Icons.favorite_rounded,
            color: AppColors.success,
            size: 24,
          ),
        ),
        title: Text(
          patientName,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
            fontSize: 16,
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 4.0),
          child: Text(
            '$hospital\n$date • $units',
            style: const TextStyle(
              color: AppColors.textSecondary,
              fontSize: 12,
            ),
          ),
        ),
        trailing: Container(
          padding: const EdgeInsets.all(6),
          decoration: const BoxDecoration(
            color: AppColors.successBg,
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.check_rounded,
            color: AppColors.success,
            size: 16,
          ),
        ),
      ),
    );
  }
}
