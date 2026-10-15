import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'blood_group_dropdown.dart';
import 'custom_button.dart';

class CreateRequestScreen extends StatefulWidget {
  const CreateRequestScreen({super.key});

  @override
  State<CreateRequestScreen> createState() =>
      _CreateRequestScreenState();
}

class _CreateRequestScreenState
    extends State<CreateRequestScreen> {
  String blood = 'O+';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Request'),
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
          const Text(
            'Request Details',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 6),
          const Text(
            'Fill in the information below to find compatible donors.',
            style: TextStyle(
              fontSize: 14,
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: 20),

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
              labelText: 'Location / Area',
              hintText: 'e.g. F-8 Sector, Islamabad',
              prefixIcon: Icon(Icons.location_on_outlined, color: AppColors.primary),
            ),
          ),

          const SizedBox(height: 16),

          const TextField(
            decoration: InputDecoration(
              labelText: 'Hospital Name',
              hintText: 'e.g. PIMS Hospital',
              prefixIcon: Icon(Icons.local_hospital_outlined, color: AppColors.primary),
            ),
          ),

          const SizedBox(height: 16),

          const TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'Required Units (Bags)',
              hintText: '1',
              prefixIcon: Icon(Icons.numbers_rounded, color: AppColors.primary),
            ),
          ),

          const SizedBox(height: 16),

          const TextField(
            maxLines: 3,
            decoration: InputDecoration(
              labelText: 'Additional Notes / Message',
              hintText: 'Specify patient condition or urgency...',
              prefixIcon: Icon(Icons.note_alt_outlined, color: AppColors.primary),
            ),
          ),

          const SizedBox(height: 28),

          CustomButton(
            text: 'Submit Request',
            icon: Icons.send_rounded,
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
