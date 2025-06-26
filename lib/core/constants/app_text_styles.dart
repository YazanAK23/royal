import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTextStyles {
  // App Bar Text Styles
  static const TextStyle buttonText = TextStyle(
    color: Colors.white,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    height: 1.2,
  );

  static const TextStyle promotionText = TextStyle(
    color: Colors.white,
    fontSize: 12,
    fontWeight: FontWeight.w300,
    height: 1.2,
    letterSpacing: 0,
  );

  static const TextStyle badge = TextStyle(
    color: Colors.white,
    fontSize: 8,
    fontWeight: FontWeight.w500,
    height: 1,
    letterSpacing: -0.3,
  );

  // Home Screen Text Styles
  static const TextStyle categoryTitle = TextStyle(
    color: AppColors.primary,
    fontSize: 16,
    fontWeight: FontWeight.w500,
    height: 1.2,
  );

  static const TextStyle greetingPrimary = TextStyle(
    color: AppColors.primary,
    fontSize: 24,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle greetingSecondary = TextStyle(
    color: AppColors.primary,
    fontSize: 28,
    fontWeight: FontWeight.w600,
  );

  // Drawer Text Styles
  static const TextStyle welcomeText = TextStyle(
    color: Colors.white,
    fontSize: 20,
    fontWeight: FontWeight.w400,
    height: 1.2,
  );

  static const TextStyle userName = TextStyle(
    color: Colors.white,
    fontSize: 24,
    fontWeight: FontWeight.w600,
    height: 1.2,
  );

  static const TextStyle drawerMenuItem = TextStyle(
    color: Colors.white,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle sectionTitle = TextStyle(
    color: Colors.white,
    fontSize: 18,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle languageToggle = TextStyle(
    color: Colors.white,
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );
}
