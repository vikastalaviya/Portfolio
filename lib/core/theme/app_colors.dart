import 'package:flutter/material.dart';

class AppColors {
  // Jensen Omega Theme (Dark/Orange)
  static const Color background = Color(0xFF0B1121); // Dark Navy/Black
  static const Color backgroundDark = Color(0xFF000000); // Pure Black
  static const Color primary = Color(0xFFFF5722); // Deep Orange
  static const Color primaryDark = Color(0xFFE64A19); // Darker Orange
  static const Color secondary = Color(0xFF1E293B); // Slate 800 (Card Bg)
  static const Color accent = Color(0xFFFF8A65); // Light Orange/Salmon

  // Gradients
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [Color(0xFFFF5722), Color(0xFFFF8A65)],
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
