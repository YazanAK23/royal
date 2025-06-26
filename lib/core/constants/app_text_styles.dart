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

  // Drawer Text Styles
  static const TextStyle drawerHeaderTitle = TextStyle(
    color: Colors.white,
    fontSize: 24,
    fontWeight: FontWeight.w500,
    height: 1.2,
  );

  static const TextStyle drawerHeaderName = TextStyle(
    color: Colors.white,
    fontSize: 28,
    fontWeight: FontWeight.w600,
    height: 1.2,
  );

  static const TextStyle drawerMenuItem = TextStyle(
    color: Colors.white,
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle drawerLanguageButton = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle drawerSocialTitle = TextStyle(
    color: Colors.white,
    fontSize: 18,
    fontWeight: FontWeight.w500,
    letterSpacing: 1.2,
  );

  // Home Screen Text Styles
  static const TextStyle greeting = TextStyle(
    color: AppColors.primaryText,
    fontSize: 24,
    fontWeight: FontWeight.w600,
    height: 1.2,
  );

  static const TextStyle categoryTitle = TextStyle(
    color: AppColors.primaryText,
    fontSize: 16,
    fontWeight: FontWeight.w500,
    height: 1.2,
  );

  // Greeting Text Styles
  static const TextStyle greetingPrimary = TextStyle(
    fontSize: 35,
    fontWeight: FontWeight.w400,
    color: AppColors.blueText,
    height: 1,
    letterSpacing: 0,
  );

  static const TextStyle greetingSecondary = TextStyle(
    fontSize: 35,
    fontWeight: FontWeight.w400,
    color: AppColors.greyText,
    height: 1,
    letterSpacing: 0,
    fontFamily: 'Inter',
  );

  // Badge Text Style
  static const TextStyle badgeText = TextStyle(
    color: AppColors.white,
    fontSize: 9,
    fontWeight: FontWeight.bold,
  );
}
