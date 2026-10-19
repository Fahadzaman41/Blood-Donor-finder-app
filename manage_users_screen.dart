import 'package:flutter/material.dart';
import 'app_colors.dart';

class ManageUsersScreen extends StatelessWidget {
  const ManageUsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Manage Users'),
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
            'Registered Users',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 6),
          const Text(
            'List of all user accounts registered in BloodLink.',
            style: TextStyle(
              fontSize: 13,
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: 16),
          _userCard('Fahad Zaman', 'fahad@example.com', 'Donor', AppColors.primary),
          _userCard('Ali Khan', 'ali@example.com', 'Seeker', AppColors.secondary),
          _userCard('Hamza Ahmed', 'hamza@example.com', 'Donor', AppColors.primary),
        ],
      ),
    );
  }

  Widget _userCard(String name, String email, String role, Color roleColor) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: CircleAvatar(
          backgroundColor: roleColor.withValues(alpha: 0.12),
          child: Icon(Icons.person_rounded, color: roleColor),
        ),
        title: Text(
          name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
            fontSize: 16,
          ),
        ),
        subtitle: Text(
          '$email\nRole: $role',
          style: const TextStyle(
            color: AppColors.textSecondary,
            fontSize: 12,
          ),
        ),
        trailing: IconButton(
          icon: const Icon(Icons.more_vert_rounded, color: AppColors.textMuted),
          onPressed: () {},
        ),
      ),
    );
  }
}
