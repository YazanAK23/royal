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

  static const TextStyle heading1 = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: Colors.black,
    height: 1.2,
  );

  // About App Page Text Styles
  static const TextStyle appBarTitle = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.bold,
    color: AppColors.appBarTitle,
  );

  static const TextStyle menuItemText = TextStyle(
    fontSize: 18,
    color: AppColors.menuItemText,
  );

  static const TextStyle versionText = TextStyle(
    fontSize: 18,
    color: AppColors.versionText,
  );

  static const TextStyle madeInText = TextStyle(
    fontSize: 16,
    color: AppColors.menuItemText,
  );

  // Browsing History Page Text Styles
  static const TextStyle browsingHistoryTitle = TextStyle(
    color: AppColors.browsingHistoryText,
    fontSize: 22,
    fontWeight: FontWeight.w600,
  );

  // Cart Screen Text Styles
  static const TextStyle cartTitle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppColors.cartTitle,
  );

  static const TextStyle cartButtonText = TextStyle(
    fontSize: 18,
    color: AppColors.cartButtonText,
  );

  // SubProductDetailsScreen Text Styles
  static const TextStyle breadcrumbText = TextStyle(
    fontSize: 12,
    color: Colors.grey,
  );

  static const TextStyle titleText = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 20,
  );

  static const TextStyle tableHeaderText = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 13,
    color: AppColors.tableHeaderText,
  );

  // Downloads Screen Text Styles
  static const TextStyle downloadsCategorySelected = TextStyle(
    fontWeight: FontWeight.bold,
    color: AppColors.downloadsSelectedCategory,
    fontSize: 18,
  );

  static const TextStyle downloadsCategoryUnselected = TextStyle(
    fontWeight: FontWeight.normal,
    color: AppColors.downloadsUnselectedCategory,
    fontSize: 16,
  );

  static const TextStyle downloadsDialogText = TextStyle(
    fontSize: 16,
    color: Colors.black,
  );

  // Favorite Page Text Styles
  static const TextStyle favoriteTitle = TextStyle(
    color: AppColors.favoriteSelectedCategory,
    fontSize: 22,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle favoriteCategorySelected = TextStyle(
    color: AppColors.favoriteUnselectedCategory,
    fontWeight: FontWeight.w600,
    fontSize: 15,
  );

  static const TextStyle favoriteCategoryUnselected = TextStyle(
    color: Colors.grey,
    fontWeight: FontWeight.w600,
    fontSize: 15,
  );

  // FAQ Screen Text Styles
  static const TextStyle faqQuestion = TextStyle(
    fontFamily: 'Cairo',
    color: AppColors.primaryText,
    fontWeight: FontWeight.w500,
    fontSize: 16,
  );

  static const TextStyle faqAnswer = TextStyle(
    fontFamily: 'Cairo',
    color: AppColors.blueText,
    fontWeight: FontWeight.w400,
    fontSize: 15,
  );
}
