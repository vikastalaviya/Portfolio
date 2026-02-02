import 'package:flutter/material.dart';

class AppColors {
  // Deep Space Theme
  static const Color background = Color(0xFF0F172A); // Deep Blue/Slate
  static const Color backgroundDark = Color(0xFF020617); // Almost Black
  static const Color primary = Color(0xFF00F0FF); // Neon Cyan
  static const Color primaryDark = Color(0xFF00B8D9); // Darker Cyan
  static const Color secondary = Color(0xFF1E293B); // Slate 800
  static const Color accent = Color(0xFF7000FF); // Electric Purple

  // Gradients
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [Color(0xFF00F0FF), Color(0xFF7000FF)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient glassGradient = LinearGradient(
    colors: [Colors.white10, Color(0x0DFFFFFF)], // 0.05 opacity
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const Color textLight = Color(0xFFF8FAFC);
  static const Color textGrey = Color(0xFF94A3B8);

  static const Color textPrimary = textLight;
  static const Color textSecondary = textGrey;
}
