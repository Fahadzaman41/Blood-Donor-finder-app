import 'package:flutter/material.dart';

import 'admin_home_screen.dart';
import 'app_colors.dart';
import 'create_request_screen.dart';
import 'donor_detail_screen.dart';
import 'donor_history_screen.dart';
import 'donor_home_screen.dart';
import 'donor_profile_screen.dart';
import 'donor_request_detail_screen.dart';
import 'donor_requests_screen.dart';
import 'emergency_request_screen.dart';
import 'login_screen.dart';
import 'manage_donors_screen.dart';
import 'manage_requests_screen.dart';
import 'manage_users_screen.dart';
import 'request_history_screen.dart';
import 'request_status_screen.dart';
import 'role_selection_screen.dart';
import 'search_donor_screen.dart';
import 'seeker_home_screen.dart';
import 'signup_screen.dart';
import 'splash_screen.dart';
import 'verify_donor_screen.dart';
import 'welcome_screen.dart';

void main() {
  runApp(const BloodDonorFinderApp());
}

class BloodDonorFinderApp extends StatelessWidget {
  const BloodDonorFinderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Blood Donor and Finder',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: AppColors.background,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primary,
          primary: AppColors.primary,
          secondary: AppColors.secondary,
          surface: AppColors.cardBg,
        ),
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          elevation: 0,
          backgroundColor: AppColors.background,
          surfaceTintColor: Colors.transparent,
          titleTextStyle: TextStyle(
            color: AppColors.textPrimary,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          iconTheme: IconThemeData(
            color: AppColors.textPrimary,
          ),
        ),
        cardTheme: CardThemeData(
          color: AppColors.cardBg,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: const BorderSide(
              color: AppColors.border,
              width: 1,
            ),
          ),
          margin: const EdgeInsets.symmetric(vertical: 6),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            foregroundColor: Colors.white,
            elevation: 0,
            minimumSize: const Size.fromHeight(52),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            foregroundColor: AppColors.primary,
            minimumSize: const Size.fromHeight(52),
            side: const BorderSide(color: AppColors.primary, width: 1.5),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 18,
            vertical: 16,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(color: AppColors.border),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(color: AppColors.border),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(color: AppColors.primary, width: 2),
          ),
          labelStyle: const TextStyle(
            color: AppColors.textSecondary,
            fontSize: 14,
          ),
          prefixIconColor: AppColors.textSecondary,
        ),
      ),
      builder: (context, child) {
        final screenWidth = MediaQuery.of(context).size.width;
        final screenHeight = MediaQuery.of(context).size.height;

        // On desktop/wide screens, wrap in a mobile device shell
        if (screenWidth > 500) {
          double phoneHeight = screenHeight - 40;
          if (phoneHeight > 860) phoneHeight = 860;
          if (phoneHeight < 550) phoneHeight = 550;

          return Scaffold(
            backgroundColor: const Color(0xFF0F172A),
            body: SafeArea(
              child: Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Sleek Mobile Phone Frame Container
                      Container(
                        width: 410,
                        height: phoneHeight,
                        decoration: BoxDecoration(
                          color: AppColors.background,
                          borderRadius: BorderRadius.circular(44),
                          border: Border.all(
                            color: const Color(0xFF334155),
                            width: 8,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.5),
                              blurRadius: 36,
                              offset: const Offset(0, 18),
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(36),
                          child: Stack(
                            children: [
                              // Mobile Screen Content
                              Positioned.fill(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 22, bottom: 10),
                                  child: child ?? const SizedBox(),
                                ),
                              ),
                              // Camera Notch / Speaker Bar
                              Positioned(
                                top: 0,
                                left: 0,
                                right: 0,
                                child: Center(
                                  child: Container(
                                    margin: const EdgeInsets.only(top: 6),
                                    width: 110,
                                    height: 20,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF0F172A),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 8,
                                          height: 8,
                                          decoration: const BoxDecoration(
                                            color: Color(0xFF334155),
                                            shape: BoxShape.circle,
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                        Container(
                                          width: 36,
                                          height: 4,
                                          decoration: BoxDecoration(
                                            color: const Color(0xFF334155),
                                            borderRadius: BorderRadius.circular(2),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              // Bottom Home Bar Indicator
                              Positioned(
                                bottom: 4,
                                left: 0,
                                right: 0,
                                child: Center(
                                  child: Container(
                                    width: 130,
                                    height: 4,
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade400,
                                      borderRadius: BorderRadius.circular(2),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }

        return child ?? const SizedBox();
      },
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/welcome': (context) => const WelcomeScreen(),
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => const SignupScreen(),
        '/roles': (context) => const RoleSelectionScreen(),

        // Donor routes
        '/donor/home': (context) => const DonorHomeScreen(),
        '/donor/profile': (context) => const DonorProfileScreen(),
        '/donor/requests': (context) => const DonorRequestsScreen(),
        '/donor/request-detail': (context) => const DonorRequestDetailScreen(),
        '/donor/history': (context) => const DonorHistoryScreen(),

        // Seeker routes
        '/seeker/home': (context) => const SeekerHomeScreen(),
        '/seeker/search': (context) => const SearchDonorScreen(),
        '/seeker/donor-detail': (context) => const DonorDetailScreen(),
        '/seeker/create-request': (context) => const CreateRequestScreen(),
        '/seeker/emergency': (context) => const EmergencyRequestScreen(),
        '/seeker/status': (context) => const RequestStatusScreen(),
        '/seeker/history': (context) => const RequestHistoryScreen(),

        // Admin routes
        '/admin/home': (context) => const AdminHomeScreen(),
        '/admin/users': (context) => const ManageUsersScreen(),
        '/admin/donors': (context) => const ManageDonorsScreen(),
        '/admin/requests': (context) => const ManageRequestsScreen(),
        '/admin/verify': (context) => const VerifyDonorScreen(),
      },
    );
  }
}
