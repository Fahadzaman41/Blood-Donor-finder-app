import 'package:flutter/material.dart';
import 'app_colors.dart';

class VerifyDonorScreen extends StatefulWidget {
  const VerifyDonorScreen({super.key});

  @override
  State<VerifyDonorScreen> createState() =>
      _VerifyDonorScreenState();
}

class _VerifyDonorScreenState
    extends State<VerifyDonorScreen> {
  List<String> donors = [
    'Hamza Shah - B+',
    'Bilal Ahmed - O-',
    'Usman Khan - A+',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verify Donors'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () {
            if (Navigator.canPop(context)) {
              Navigator.pop(context);
            } else {
              Navigator.pushReplacementNamed(context, '/admin/home');
            }
          },
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        children: [
          const Text(
            'Pending Medical Verification',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 6),
          const Text(
            'Review pending donor credentials before making profiles public.',
            style: TextStyle(
              fontSize: 13,
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: 16),
          if (donors.isEmpty)
            Container(
              padding: const EdgeInsets.all(32),
              alignment: Alignment.center,
              child: Column(
                children: const [
                  Icon(Icons.check_circle_outline_rounded, size: 60, color: AppColors.success),
                  SizedBox(height: 12),
                  Text(
                    'All donors verified!',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ],
              ),
            )
          else
            ...List.generate(donors.length, (index) {
              return Card(
                margin: const EdgeInsets.symmetric(vertical: 6),
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  leading: const CircleAvatar(
                    backgroundColor: AppColors.primarySurface,
                    child: Icon(
                      Icons.person_rounded,
                      color: AppColors.primary,
                    ),
                  ),
                  title: Text(
                    donors[index],
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                      fontSize: 16,
                    ),
                  ),
                  subtitle: const Text(
                    'Pending verification',
                    style: TextStyle(
                      color: AppColors.warning,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.close_rounded,
                          color: AppColors.error,
                        ),
                        onPressed: () {
                          setState(() {
                            donors.removeAt(index);
                          });
                        },
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.check_rounded,
                          color: AppColors.success,
                        ),
                        onPressed: () {
                          setState(() {
                            donors.removeAt(index);
                          });

                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Donor verified successfully'),
                              backgroundColor: AppColors.success,
                              behavior: SnackBarBehavior.floating,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              );
            }),
        ],
      ),
    );
  }
}
