import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'custom_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  String selectedRole = 'Donor'; // 'Donor', 'Seeker', or 'Admin'

  @override
  void initState() {
    super.initState();
    emailController.addListener(_autoDetectRole);
  }

  @override
  void dispose() {
    emailController.removeListener(_autoDetectRole);
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _autoDetectRole() {
    final text = emailController.text.toLowerCase();
    if (text.contains('seeker')) {
      if (selectedRole != 'Seeker') {
        setState(() => selectedRole = 'Seeker');
      }
    } else if (text.contains('admin')) {
      if (selectedRole != 'Admin') {
        setState(() => selectedRole = 'Admin');
      }
    } else if (text.contains('donor')) {
      if (selectedRole != 'Donor') {
        setState(() => selectedRole = 'Donor');
      }
    }
  }

  void login() {
    if (emailController.text.trim().isEmpty || passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter email address and password'),
          backgroundColor: AppColors.error,
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }

    // Determine target route based on account role
    String targetRoute;
    if (selectedRole == 'Donor') {
      targetRoute = '/donor/home';
    } else if (selectedRole == 'Seeker') {
      targetRoute = '/seeker/home';
    } else {
      targetRoute = '/admin/home';
    }

    // Opens ONLY the target role page and removes login stack
    Navigator.pushNamedAndRemoveUntil(
      context,
      targetRoute,
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(18),
              decoration: const BoxDecoration(
                color: AppColors.primarySurface,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.lock_outline_rounded,
                size: 48,
                color: AppColors.primary,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Welcome Back',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              'Sign in to access your account dashboard',
              style: TextStyle(
                fontSize: 13,
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: 24),

            // Role Selector Chips
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: AppColors.inputBg,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: AppColors.border),
              ),
              child: Row(
                children: [
                  _roleSegment('Donor', Icons.bloodtype_rounded),
                  _roleSegment('Seeker', Icons.search_rounded),
                  _roleSegment('Admin', Icons.admin_panel_settings_rounded),
                ],
              ),
            ),

            const SizedBox(height: 24),

            TextField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              style: const TextStyle(
                fontSize: 15,
                color: AppColors.textPrimary,
                fontWeight: FontWeight.w500,
              ),
              decoration: const InputDecoration(
                labelText: 'Email Address',
                hintText: 'e.g. donor@example.com or seeker@example.com',
                prefixIcon: Icon(Icons.email_outlined, color: AppColors.primary),
              ),
            ),

            const SizedBox(height: 16),

            TextField(
              controller: passwordController,
              obscureText: true,
              style: const TextStyle(
                fontSize: 15,
                color: AppColors.textPrimary,
                fontWeight: FontWeight.w500,
              ),
              decoration: const InputDecoration(
                labelText: 'Password',
                hintText: '••••••••',
                prefixIcon: Icon(Icons.lock_outline_rounded, color: AppColors.primary),
              ),
            ),

            const SizedBox(height: 28),

            CustomButton(
              text: 'Login to $selectedRole Page',
              icon: Icons.arrow_forward_rounded,
              onPressed: login,
            ),

            const SizedBox(height: 24),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Don't have an account? ",
                  style: TextStyle(color: AppColors.textSecondary),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      '/signup',
                    );
                  },
                  child: const Text(
                    'Create Account',
                    style: TextStyle(
                      color: AppColors.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _roleSegment(String role, IconData icon) {
    bool isSelected = selectedRole == role;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedRole = role;
          });
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: isSelected ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(10),
            boxShadow: isSelected
                ? [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.08),
                      blurRadius: 6,
                      offset: const Offset(0, 2),
                    ),
                  ]
                : null,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 18,
                color: isSelected ? AppColors.primary : AppColors.textMuted,
              ),
              const SizedBox(width: 6),
              Text(
                role,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                  color: isSelected ? AppColors.textPrimary : AppColors.textSecondary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
