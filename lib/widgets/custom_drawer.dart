import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:royal/core/routes/app_routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
              left: isArabic ? -1.w : null,
              right: isArabic ? null : -1.w,
              bottom: 0,
              child: SvgPicture.asset(
                isArabic ? AppAssets.smallImageBottomLeft : AppAssets.smallImageBottomRight,
                width: MediaQuery.of(context).size.width * 0.10.w,
                height: MediaQuery.of(context).size.height * 0.15.h,
                fit: BoxFit.contain,
              ),
            ),
            Positioned(
              right: isArabic ? 0.w : null,
              left: isArabic ? null : 0.w,
              bottom: 0,
              child: SvgPicture.asset(
                isArabic ? AppAssets.smallImageBottomRight : AppAssets.smallImageBottomLeft,
                width: MediaQuery.of(context).size.width * 0.25.w,
                height: MediaQuery.of(context).size.height * 0.10.h,
                fit: BoxFit.contain,
              ),
            ),
            Positioned(
              left: isArabic ? 0.w : null,
              right: isArabic ? null : 6.w,
              bottom: MediaQuery.of(context).size.height * 0.0.h,
              child: SvgPicture.asset(
                isArabic ? AppAssets.bigImageBottomLeft : AppAssets.bigImageBottomLeftReversed,
                width: MediaQuery.of(context).size.width * 0.2.w,
                height: MediaQuery.of(context).size.height * 0.6.h,
                fit: BoxFit.contain,
              ),
            ),
            // Main content (no social section at the bottom)
            Column(
              children: [
                SizedBox(height: 30.h), // Added space to move content down
                // Top bar with Language toggle, Welcome text (left) and Search/Back (right)
                Padding(
                  padding: EdgeInsets.all(16.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Left side: Language toggle, Welcome, Name (all left-aligned)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildLanguageToggle(context, ref),
                          SizedBox(height: 16.h),
                          Text(
                            S.of(context).welcomeLabel,
                            style: AppTextStyles.welcomeText.copyWith(fontSize: 18.sp),
                            textAlign: TextAlign.left,
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            S.of(context).nameLabel,
                            style: AppTextStyles.userName.copyWith(fontSize: 16.sp),
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
                              width: 24.w,
                              height: 24.h,
                              colorFilter: const ColorFilter.mode(AppColors.white, BlendMode.srcIn),
                            ),
                          ),
                          SizedBox(height: 24.h),
                          GestureDetector(
                            onTap: () => Navigator.of(context).pushReplacementNamed('/home'),
                            child: SvgPicture.asset(
                              AppAssets.backButton,
                              width: 24.w,
                              height: 24.h,
                              colorFilter: const ColorFilter.mode(AppColors.white, BlendMode.srcIn),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 32.h),
                // Menu Items
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: isArabic ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                      children: DrawerMenuItems.getItems().map((item) => Padding(
                        padding: EdgeInsets.only(bottom: 0.h), // Adjusted to move items further up
                        child: _buildMenuItem(context, item),
                      )).toList(),
                    ),
                  ),
                ),
                // Remove the social section from here
              ],
            ),
            // Social Media Links section pinned to the bottom, above the SVG
            Positioned(
              left: isArabic ? null : 0.w,
              right: isArabic ? 0.w : null,
              bottom: -44.h, // Moved further down
              child: Align(
                alignment: isArabic ? Alignment.bottomRight : Alignment.bottomLeft,
                child: Padding(
                  padding: isArabic
                      ? EdgeInsets.only(bottom: 80.h, right: 32.w)
                      : EdgeInsets.only(bottom: 80.h, left: 32.w),
                  child: Builder(
                    builder: (context) {
                      double iconWidth = 40.w;
                      int iconCount = 4;
                      double rowWidth = iconWidth * iconCount;
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment:
                            isArabic ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: rowWidth,
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                S.of(context).contactUsLabel,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 28.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          SizedBox(height: 20.h), // Increased spacing for better separation
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              _buildSocialIcon(AppAssets.facebook, 'Facebook'),
                              _buildSocialIcon(AppAssets.instagram, 'Instagram'),
                              _buildSocialIcon(AppAssets.youtube, 'YouTube'),
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
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(color: AppColors.white),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Ar',
              style: TextStyle(
                color: isArabic ? AppColors.white : Colors.white60,
                fontSize: 14.sp,
                fontWeight: isArabic ? FontWeight.bold : FontWeight.normal,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 8.w),
              height: 16.h,
              width: 1.w,
              color: AppColors.white,
            ),
            Text(
              'En',
              style: TextStyle(
                color: !isArabic ? AppColors.white : Colors.white60,
                fontSize: 14.sp,
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
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Icon on left
            SvgPicture.asset(
              item.icon,
              width: 24.w,
              height: 24.h,
              colorFilter: const ColorFilter.mode(AppColors.white, BlendMode.srcIn),
            ),
            SizedBox(width: 12.w),
            // Text after icon
            Text(
              item.getLocalizedTitle(context),
              style: AppTextStyles.drawerMenuItem.copyWith(fontSize: 16.sp),
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
        width: 40.w,
        height: 40.h,
        decoration: BoxDecoration(
          color: Colors.white.withAlpha(38), // 0.15 * 255 ≈ 38
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(26), // 0.1 * 255 ≈ 26
              blurRadius: 8.r,
              offset: Offset(0.w, 4.h),
            ),
          ],
        ),
        child: Center(
          child: SvgPicture.asset(
            icon,
            width: 22.w,
            height: 22.h,
            colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
          ),
        ),
      ),
    );
  }
}
