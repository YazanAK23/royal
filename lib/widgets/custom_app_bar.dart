import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../core/constants/app_assets.dart';
import '../core/constants/app_colors.dart';
import '../core/constants/app_strings.dart';
import '../core/constants/app_text_styles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Function()? onMenuTap;
  final bool isArabic;

  const CustomAppBar({
    super.key,
    this.onMenuTap,
    required this.isArabic,
  });

  @override
  Size get preferredSize => const Size.fromHeight(80.0);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      height: 80.0,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
          top: 28,
          bottom: 8,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Search icon on left
            Container(
              width: 28,
              alignment: Alignment.center,
              child: SvgPicture.asset(
                AppAssets.search,
                width: 20,
                height: 20,
                // ignore: deprecated_member_use
                color: AppColors.primary,
              ),
            ),
            const Spacer(),

            // Blue promotion button beside cart
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Container(
                height: 32,
                decoration: const BoxDecoration(
                  color: AppColors.primary,
                ),
                child: const Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    child: Text(
                      AppStrings.promotionTextAr,
                      style: AppTextStyles.promotionText,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            
            // Cart icon with badge
            Container(
              width: 28,
              alignment: Alignment.center,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  SvgPicture.asset(
                    AppAssets.cart,
                    width: 20,
                    height: 20,
                    color: AppColors.primary,
                  ),
                  Positioned(
                    top: -4,
                    right: -4,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 1),
                      decoration: BoxDecoration(
                        color: AppColors.error,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      constraints: const BoxConstraints(
                        minWidth: 14,
                        minHeight: 10,
                      ),
                      child: const Center(
                        child: Text(
                          '99+',
                          style: AppTextStyles.badge,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            
            // Notification icon with badge
            Container(
              width: 28,
              alignment: Alignment.center,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  SvgPicture.asset(
                    AppAssets.notification,
                    width: 20,
                    height: 20,
                    // ignore: deprecated_member_use
                    color: AppColors.primary,
                  ),
                  Positioned(
                    top: -4,
                    right: -4,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 1),
                      decoration: BoxDecoration(
                        color: AppColors.error,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      constraints: const BoxConstraints(
                        minWidth: 14,
                        minHeight: 10,
                      ),
                      child: const Center(
                        child: Text(
                          '99+',
                          style: AppTextStyles.badge,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),

            // Menu icon for drawer
            Container(
              width: 28,
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: onMenuTap,
                behavior: HitTestBehavior.translucent,
                child: SvgPicture.asset(
                  AppAssets.drawerMenu,
                  width: 20,
                  height: 20,
                  // ignore: deprecated_member_use
                  color: AppColors.primary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
