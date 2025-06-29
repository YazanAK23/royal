import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../core/constants/app_assets.dart';
import '../core/constants/app_colors.dart';
import '../core/constants/app_text_styles.dart';
import '../generated/l10n.dart';
import '../core/constants/drawer_menu_items.dart';
import '../core/models/drawer_menu_item.dart';
import '../core/providers/locale_provider.dart';

class CustomDrawer extends ConsumerWidget {
  final Function(String) onMenuItemTap;

  const CustomDrawer({
    super.key,
    required this.onMenuItemTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = ref.watch(localeProvider);
    final isArabic = locale.languageCode == 'ar';

    return Drawer(
      width: MediaQuery.of(context).size.width,
      backgroundColor: AppColors.primary,
      child: SafeArea(
        child: Stack(
          children: [
            // Background pattern at the bottom
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Transform(
                alignment: Alignment.center,
                transform: Matrix4.rotationY(isArabic ? 0 : pi),
                child: SvgPicture.asset(
                  AppAssets.drawerPattern,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            // Main content
            Column(
              children: [
                // Top bar with Search, Back button, and Language toggle
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Search icon on left
                      GestureDetector(
                        onTap: () => Navigator.of(context).pushNamed('/search'),
                        child: SvgPicture.asset(
                          AppAssets.search,
                          width: 24,
                          height: 24,
                          color: AppColors.white,
                        ),
                      ),
                      // Back button in center
                      GestureDetector(
                        onTap: () => Navigator.of(context).pop(),
                        child: SvgPicture.asset(
                          AppAssets.backButton,
                          width: 24,
                          height: 24,
                          color: AppColors.white,
                        ),
                      ),
                      // Language toggle on right
                      _buildLanguageToggle(context, ref),
                    ],
                  ),
                ),
                // Welcome Text - right aligned as shown in the image
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Align(
                    alignment: Alignment.centerRight, // Always right-aligned in Arabic layout
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end, // Always end-aligned in Arabic layout
                      children: [
                        Text(
                          S.of(context).welcomeLabel,
                          style: AppTextStyles.welcomeText,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          S.of(context).nameLabel,
                          style: AppTextStyles.userName,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                // Menu Items
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: isArabic ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                      children: DrawerMenuItems.getItems().map((item) => _buildMenuItem(context, item)).toList(),
                    ),
                  ),
                ),
                // Social Media Links with wave pattern background
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black.withOpacity(0.1),
                      ],
                    ),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          S.of(context).contactUsLabel,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.right,
                        ),
                      ),
                      const SizedBox(height: 16),
                      // Social media icons with new styling - right aligned
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            _buildSocialIcon(AppAssets.facebook, 'Facebook'),
                            const SizedBox(width: 24),
                            _buildSocialIcon(AppAssets.instagram, 'Instagram'),
                            const SizedBox(width: 24),
                            _buildSocialIcon(AppAssets.youtube, 'YouTube'),
                            const SizedBox(width: 24),
                            _buildSocialIcon(AppAssets.whatsapp, 'WhatsApp'),
                          ],
                        ),
                      ),
                      const SizedBox(height: 32),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLanguageToggle(BuildContext context, WidgetRef ref) {
    final locale = ref.watch(localeProvider);
    final isArabic = locale.languageCode == 'ar';

    return GestureDetector(
      onTap: () {
        ref.read(localeProvider.notifier).setLocale(
          isArabic ? const Locale('en') : const Locale('ar'),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColors.white),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Ar',
              style: TextStyle(
                color: isArabic ? AppColors.white : Colors.white60,
                fontSize: 14,
                fontWeight: isArabic ? FontWeight.bold : FontWeight.normal,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 8),
              height: 16,
              width: 1,
              color: AppColors.white,
            ),
            Text(
              'En',
              style: TextStyle(
                color: !isArabic ? AppColors.white : Colors.white60,
                fontSize: 14,
                fontWeight: !isArabic ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(BuildContext context, DrawerMenuItem item) {
    return InkWell(
      onTap: () => onMenuItemTap(item.route),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Icon on left
            SvgPicture.asset(
              item.icon,
              width: 24,
              height: 24,
              color: AppColors.white,
            ),
            const SizedBox(width: 12),
            // Text after icon
            Text(
              item.getLocalizedTitle(context),
              style: AppTextStyles.drawerMenuItem,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSocialIcon(String icon, String label) {
    return GestureDetector(
      onTap: () {
        // Handle social media tap
      },
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.15),
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Center(
          child: SvgPicture.asset(
            icon,
            width: 22,
            height: 22,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
