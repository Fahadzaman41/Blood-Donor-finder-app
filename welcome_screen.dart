import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'custom_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 20),
          child: Column(
            children: [
              const Spacer(),
              Container(
                width: 140,
                height: 140,
                decoration: BoxDecoration(
                  color: AppColors.primarySurface,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primary.withValues(alpha: 0.15),
                      blurRadius: 24,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.bloodtype_rounded,
                  color: AppColors.primary,
                  size: 90,
                ),
              ),
              const SizedBox(height: 36),
              const Text(
                'Welcome to BloodLink',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                  letterSpacing: -0.5,
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'Find blood donors quickly near you and help save precious lives when every second counts.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  color: AppColors.textSecondary,
                  height: 1.4,
                ),
              ),
              const Spacer(),
              CustomButton(
                text: 'Login to Account',
                icon: Icons.login_rounded,
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    '/login',
                  );
                },
              ),
              const SizedBox(height: 16),
              CustomButton(
                text: 'Create New Account',
                isSecondary: true,
                icon: Icons.person_add_outlined,
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    '/signup',
                  );
                },
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
