import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'blood_group_dropdown.dart';
import 'custom_button.dart';

class EmergencyRequestScreen extends StatefulWidget {
  const EmergencyRequestScreen({super.key});

  @override
  State<EmergencyRequestScreen> createState() =>
      _EmergencyRequestScreenState();
}

class _EmergencyRequestScreenState
    extends State<EmergencyRequestScreen> {
  String blood = 'O+';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Emergency Request'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () {
            if (Navigator.canPop(context)) {
              Navigator.pop(context);
            } else {
              Navigator.pushReplacementNamed(context, '/seeker/home');
            }
          },
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: AppColors.errorBg,
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: AppColors.error.withValues(alpha: 0.3)),
            ),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: const BoxDecoration(
                    color: AppColors.error,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.bolt_rounded,
                    color: Colors.white,
                    size: 32,
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Emergency Blood Request',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.error,
                  ),
                ),
                const SizedBox(height: 6),
                const Text(
                  'This broadcast will immediately alert registered donors in your vicinity.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 13,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          BloodGroupDropdown(
            value: blood,
            onChanged: (value) {
              setState(() {
                blood = value!;
              });
            },
          ),

          const SizedBox(height: 16),

          const TextField(
            decoration: InputDecoration(
              labelText: 'Hospital Name',
              hintText: 'e.g. Shifa International Hospital',
              prefixIcon: Icon(Icons.local_hospital_outlined, color: AppColors.error),
            ),
          ),

          const SizedBox(height: 16),

          const TextField(
            decoration: InputDecoration(
              labelText: 'Exact Location / Ward',
              hintText: 'e.g. ICU Ward 3, Floor 2',
              prefixIcon: Icon(Icons.location_on_outlined, color: AppColors.error),
            ),
          ),

          const SizedBox(height: 16),

          const TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'Required Units (Bags)',
              hintText: '2',
              prefixIcon: Icon(Icons.numbers_rounded, color: AppColors.error),
            ),
          ),

          const SizedBox(height: 28),

          CustomButton(
            text: 'Broadcast Emergency Alert',
            icon: Icons.campaign_rounded,
            onPressed: () {
              Navigator.pushNamed(
                context,
                '/seeker/status',
              );
            },
          ),
        ],
      ),
    );
  }
}
