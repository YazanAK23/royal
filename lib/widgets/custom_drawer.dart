import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:royal/core/routes/app_routes.dart';
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

    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pushReplacementNamed('/home');
        return false;
      },
      child: Drawer(
        width: MediaQuery.of(context).size.width,
        backgroundColor: AppColors.primary,
        child: Stack(
          children: [
            // Pattern SVG absolutely at the bottom left of the screen, full width, flush with bottom
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: SvgPicture.asset(
                AppAssets.drawerPattern,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.fitWidth,
              ),
            ),
            // Main content (no social section at the bottom)
            Column(
              children: [
                const SizedBox(height: 64), // Added space to move content down
                // Top bar with Language toggle, Welcome text (left) and Search/Back (right)
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Left side: Language toggle, Welcome, Name (all left-aligned)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildLanguageToggle(context, ref),
                          const SizedBox(height: 16),
                          Text(
                            S.of(context).welcomeLabel,
                            style: AppTextStyles.welcomeText,
                            textAlign: TextAlign.left,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            S.of(context).nameLabel,
                            style: AppTextStyles.userName,
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                      // Right side: Search icon and Back button stacked vertically, right-aligned
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () => Navigator.of(context).pushNamed(AppRoutes.search),
                            child: SvgPicture.asset(
                              AppAssets.search,
                              width: 24,
                              height: 24,
                              color: AppColors.white,
                            ),
                          ),
                          const SizedBox(height: 24),
                          GestureDetector(
                            onTap: () => Navigator.of(context).pushReplacementNamed('/home'),
                            child: SvgPicture.asset(
                              AppAssets.backButton,
                              width: 24,
                              height: 24,
                              color: AppColors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
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
                // Remove the social section from here
              ],
            ),
            // Social Media Links section pinned to the bottom, above the SVG
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 24, right: 32),
                  child: Builder(
                    builder: (context) {
                      // Calculate the width of the icons row
                      double iconWidth = 40;
                      double iconSpacing = 20;
                      int iconCount = 4;
                      double rowWidth = iconWidth * iconCount + iconSpacing * (iconCount - 1);
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          SizedBox(
                            width: rowWidth,
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                S.of(context).contactUsLabel,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 28,
                                  fontWeight: FontWeight.w500,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          const SizedBox(height: 12),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              _buildSocialIcon(AppAssets.facebook, 'Facebook'),
                              const SizedBox(width: 20),
                              _buildSocialIcon(AppAssets.instagram, 'Instagram'),
                              const SizedBox(width: 20),
                              _buildSocialIcon(AppAssets.youtube, 'YouTube'),
                              const SizedBox(width: 20),
                              _buildSocialIcon(AppAssets.whatsapp, 'WhatsApp'),
                            ],
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
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
