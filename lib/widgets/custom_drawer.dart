import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:royal/generated/l10n.dart';
import '../core/constants/app_assets.dart';
import '../core/constants/app_colors.dart';
import '../core/constants/app_text_styles.dart';
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
                // Search and Language Toggle
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SvgPicture.asset(
                        AppAssets.search,
                        width: 24,
                        height: 24,
                        color: AppColors.white,
                      ),
                      _buildLanguageToggle(context, ref),
                    ],
                  ),
                ),
                // Welcome Text
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Align(
                    alignment: isArabic ? Alignment.centerRight : Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: isArabic ? CrossAxisAlignment.end : CrossAxisAlignment.start,
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
                // Social Media Links
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: isArabic ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                    children: [
                      Text(
                        S.of(context).followUsLabel,
                        style: AppTextStyles.sectionTitle,
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: isArabic ? MainAxisAlignment.end : MainAxisAlignment.start,
                        children: [
                          _buildSocialIcon(AppAssets.facebook, 'Facebook'),
                          const SizedBox(width: 16),
                          _buildSocialIcon(AppAssets.instagram, 'Instagram'),
                          const SizedBox(width: 16),
                          _buildSocialIcon(AppAssets.youtube, 'YouTube'),
                          const SizedBox(width: 16),
                          _buildSocialIcon(AppAssets.whatsapp, 'WhatsApp'),
                        ],
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
          children: [
            SvgPicture.asset(
              item.icon,
              width: 24,
              height: 24,
              color: AppColors.white,
            ),
            const SizedBox(width: 12),
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
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          color: Colors.white24,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Center(
          child: SvgPicture.asset(
            icon,
            width: 20,
            height: 20,
            color: AppColors.white,
          ),
        ),
      ),
    );
  }
}
