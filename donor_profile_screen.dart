import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'blood_group_dropdown.dart';
import 'custom_button.dart';
import 'custom_text_field.dart';
import 'validators.dart';

class DonorProfileScreen extends StatefulWidget {
  const DonorProfileScreen({super.key});

  @override
  State<DonorProfileScreen> createState() =>
      _DonorProfileScreenState();
}

class _DonorProfileScreenState
    extends State<DonorProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController(text: 'Fahad Zaman');
  final phoneController = TextEditingController(text: '03001234567');
  final locationController = TextEditingController(text: 'Islamabad');
  String blood = 'O+';
  bool available = true;

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    locationController.dispose();
    super.dispose();
  }

  void _saveProfile() {
    if (!_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please fix form errors before saving'),
          backgroundColor: AppColors.error,
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Profile saved successfully!'),
        backgroundColor: AppColors.success,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile'),
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
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: ListView(
            children: [
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: AppColors.primarySurface,
                        shape: BoxShape.circle,
                        border: Border.all(color: AppColors.primary, width: 2),
                      ),
                      child: const Icon(
                        Icons.person,
                        size: 60,
                        color: AppColors.primary,
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        padding: const EdgeInsets.all(6),
                        decoration: const BoxDecoration(
                          color: AppColors.primary,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.edit,
                          color: Colors.white,
                          size: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              CustomTextField(
                controller: nameController,
                label: 'Full Name',
                hint: 'e.g. Fahad Zaman',
                icon: Icons.person_outline_rounded,
                validator: Validators.name,
              ),

              const SizedBox(height: 16),

              CustomTextField(
                controller: phoneController,
                label: 'Phone Number',
                hint: 'e.g. 03001234567',
                icon: Icons.phone_outlined,
                keyboardType: TextInputType.phone,
                validator: Validators.phone,
              ),

              const SizedBox(height: 16),

              BloodGroupDropdown(
                value: blood,
                onChanged: (value) {
                  setState(() {
                    blood = value!;
                  });
                },
              ),

              const SizedBox(height: 16),

              CustomTextField(
                controller: locationController,
                label: 'City / Location',
                hint: 'e.g. Islamabad',
                icon: Icons.location_on_outlined,
                validator: (value) => Validators.required(value, 'City / Location'),
              ),

              const SizedBox(height: 16),

              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: AppColors.border),
                ),
                child: SwitchListTile(
                  title: const Text(
                    'Available for Donation',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  subtitle: const Text(
                    'Allow seekers to view your contact for emergency requests',
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColors.textSecondary,
                    ),
                  ),
                  value: available,
                  activeTrackColor: AppColors.primary,
                  onChanged: (value) {
                    setState(() {
                      available = value;
                    });
                  },
                ),
              ),

              const SizedBox(height: 28),

              CustomButton(
                text: 'Save Profile',
                icon: Icons.save_rounded,
                onPressed: _saveProfile,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
