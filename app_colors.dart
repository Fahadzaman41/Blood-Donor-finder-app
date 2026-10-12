import 'package:flutter/material.dart';

class AppColors {
  // Vibrant Modern Rose Crimson Primary
  static const Color primary = Color(0xFFE11D48); // Rose Crimson
  static const Color primaryDark = Color(0xFFBE123C);
  static const Color primaryLight = Color(0xFFFB7185);
  static const Color primarySurface = Color(0xFFFFF1F2); // Soft Rose Tint

  // Secondary Accent (Royal Blue / Cyan)
  static const Color secondary = Color(0xFF2563EB); // Royal Blue
  static const Color secondaryLight = Color(0xFF60A5FA);
  static const Color secondarySurface = Color(0xFFEFF6FF);
  static const Color accent = Color(0xFF0288D1); // Cyan Accent

  // Background & Surface
  static const Color background = Color(0xFFF8FAFC); // Clean Slate Tint
  static const Color cardBg = Colors.white;
  static const Color border = Color(0xFFE2E8F0);
  static const Color inputBg = Color(0xFFF1F5F9);

  // Text Colors
  static const Color textPrimary = Color(0xFF0F172A); // Obsidian
  static const Color textSecondary = Color(0xFF475569); // Slate
  static const Color textMuted = Color(0xFF94A3B8); // Silver

  // Status Colors
  static const Color success = Color(0xFF059669); // Emerald
  static const Color successBg = Color(0xFFECFDF5);
  static const Color warning = Color(0xFFD97706); // Amber
  static const Color warningBg = Color(0xFFFEF3C7);
  static const Color error = Color(0xFFE11D48); // Ruby
  static const Color errorBg = Color(0xFFFFF1F2);

  // Soft Beautiful Gradients
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [Color(0xFFF43F5E), Color(0xFFE11D48)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient secondaryGradient = LinearGradient(
    colors: [Color(0xFF3B82F6), Color(0xFF1D4ED8)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient emergencyGradient = LinearGradient(
    colors: [Color(0xFFF43F5E), Color(0xFFBE123C)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
