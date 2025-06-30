import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:royal/generated/l10n.dart';
import 'package:royal/core/routes/app_routes.dart';
import '../core/constants/app_assets.dart';
import '../core/constants/app_colors.dart';
import '../core/constants/app_text_styles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Function()? onMenuTap;

  const CustomAppBar({
    super.key,
    this.onMenuTap,
  });

  @override
  Size get preferredSize => const Size.fromHeight(80.0);

  @override
  Widget build(BuildContext context) {
    final isRtl = Directionality.of(context) == TextDirection.rtl;
    // In RTL: [menu, notification, cart, promo, search]
    // In LTR: [menu, notification, cart, promo, search]
    final List<Widget> ltrChildren = [
      // Menu icon (left)
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
            color: AppColors.primary,
            semanticsLabel: S.of(context).menuLabel,
          ),
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
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(AppRoutes.notificationCenter);
              },
              child: SvgPicture.asset(
                AppAssets.notification,
                width: 20,
                height: 20,
                color: AppColors.primary,
                semanticsLabel: S.of(context).notificationsLabel,
              ),
            ),
            _buildBadge('5'),
          ],
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
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(AppRoutes.cart);
              },
              child: SvgPicture.asset(
                AppAssets.cart,
                width: 20,
                height: 20,
                color: AppColors.primary,
                semanticsLabel: S.of(context).cartLabel,
              ),
            ),
            _buildBadge('99+'),
          ],
        ),
      ),
      const SizedBox(width: 12),
      // Blue promotion button beside cart
      ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.4,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Container(
            height: 32,
            decoration: const BoxDecoration(
              color: AppColors.primary,
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                child: Text(
                  S.of(context).promotionText,
                  style: AppTextStyles.promotionText,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ),
        ),
      ),
      const Spacer(),
      // Search icon (right)
      Container(
        width: 28,
        alignment: Alignment.center,
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(AppRoutes.search);
          },
          child: SvgPicture.asset(
            AppAssets.search,
            width: 20,
            height: 20,
            color: AppColors.primary,
            semanticsLabel: S.of(context).searchHint,
          ),
        ),
      ),
    ];
    final List<Widget> rtlChildren = [
      // Menu icon (left)
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
            color: AppColors.primary,
            semanticsLabel: S.of(context).menuLabel,
          ),
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
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(AppRoutes.notificationCenter);
              },
              child: SvgPicture.asset(
                AppAssets.notification,
                width: 20,
                height: 20,
                color: AppColors.primary,
                semanticsLabel: S.of(context).notificationsLabel,
              ),
            ),
            _buildBadge('5'),
          ],
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
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(AppRoutes.cart);
              },
              child: SvgPicture.asset(
                AppAssets.cart,
                width: 20,
                height: 20,
                color: AppColors.primary,
                semanticsLabel: S.of(context).cartLabel,
              ),
            ),
            _buildBadge('99+'),
          ],
        ),
      ),
      const SizedBox(width: 12),
      // Blue promotion button beside cart
      ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.4,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Container(
            height: 32,
            decoration: const BoxDecoration(
              color: AppColors.primary,
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                child: Text(
                  S.of(context).promotionText,
                  style: AppTextStyles.promotionText,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ),
        ),
      ),
      const Spacer(),
      // Search icon (right)
      Container(
        width: 28,
        alignment: Alignment.center,
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(AppRoutes.search);
          },
          child: SvgPicture.asset(
            AppAssets.search,
            width: 20,
            height: 20,
            color: AppColors.primary,
            semanticsLabel: S.of(context).searchHint,
          ),
        ),
      ),
    ];
    return Container(
      color: AppColors.white,
      height: 80.0,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ).copyWith(top: 28),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: isRtl ? rtlChildren : ltrChildren,
        ),
      ),
    );
  }

  Widget _buildBadge(String count) {
    return Positioned(
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
        child: Center(
          child: Text(
            count,
            style: AppTextStyles.badge,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
