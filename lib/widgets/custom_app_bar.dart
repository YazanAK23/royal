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
  Size get preferredSize {
    final mq = MediaQueryData.fromWindow(WidgetsBinding.instance.window);
    // Responsive height: base 80px proportional to screen + status bar
    final baseHeight = mq.size.height * 0.08;
    return Size.fromHeight(baseHeight + mq.padding.top);
  }

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    final isRtl = Directionality.of(context) == TextDirection.rtl;
    // Responsive dimensions
    final iconArea = mq.size.width * 0.1; // 10% of width
    final iconSize = iconArea * 0.5;      // 50% of area
    final gap = mq.size.width * 0.01;     // 1% of width

    Widget badge(String count) {
      final double size = iconArea * 0.35;
      return Positioned(
        top: -size * 0.2,
        right: -size * 0.2,
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: size * 0.2,
            vertical: size * 0.1,
          ),
          decoration: BoxDecoration(
            color: AppColors.error,
            borderRadius: BorderRadius.circular(size * 0.3),
          ),
          constraints: BoxConstraints(
            minWidth: size,
            minHeight: size * 0.6,
          ),
          child: Center(
            child: Text(
              count,
              style: AppTextStyles.badge.copyWith(fontSize: size * 0.5),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      );
    }

    List<Widget> ltrChildren = [
      // Menu icon (left)
      Container(
        width: iconArea,
        height: iconArea,
        alignment: Alignment.center,
        child: GestureDetector(
          onTap: onMenuTap,
          behavior: HitTestBehavior.translucent,
          child: SvgPicture.asset(
            AppAssets.drawerMenu,
            width: iconSize,
            height: iconSize,
            colorFilter: const ColorFilter.mode(AppColors.primary, BlendMode.srcIn),
            semanticsLabel: S.of(context).menuLabel,
          ),
        ),
      ),
      SizedBox(width: gap),
      // Notification icon with badge
      Container(
        width: iconArea,
        height: iconArea,
        alignment: Alignment.center,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            GestureDetector(
              onTap: () => Navigator.of(context).pushNamed(AppRoutes.notificationCenter),
              child: SvgPicture.asset(
                AppAssets.notification,
                width: iconSize,
                height: iconSize,
                colorFilter: const ColorFilter.mode(AppColors.primary, BlendMode.srcIn),
                semanticsLabel: S.of(context).notificationsLabel,
              ),
            ),
            badge('5'),
          ],
        ),
      ),
      SizedBox(width: gap),
      // Cart icon with badge
      Container(
        width: iconArea,
        height: iconArea,
        alignment: Alignment.center,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            GestureDetector(
              onTap: () => Navigator.of(context).pushNamed(AppRoutes.cart),
              child: SvgPicture.asset(
                AppAssets.cart,
                width: iconSize,
                height: iconSize,
                colorFilter: const ColorFilter.mode(AppColors.primary, BlendMode.srcIn),
                semanticsLabel: S.of(context).cartLabel,
              ),
            ),
            badge('99+'),
          ],
        ),
      ),
      SizedBox(width: gap),
      // --- Get Offer / Promotion Button ---
      /*
      ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: mq.size.width * 0.4,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Container(
            height: iconArea * 0.8,
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
      */ // Promotion button is hidden for now
      const Spacer(),
      // Search icon (right)
      Container(
        width: iconArea,
        height: iconArea,
        alignment: Alignment.center,
        child: GestureDetector(
          onTap: () => Navigator.of(context).pushNamed(AppRoutes.search),
          child: SvgPicture.asset(
            AppAssets.search,
            width: iconSize,
            height: iconSize,
            colorFilter: const ColorFilter.mode(AppColors.primary, BlendMode.srcIn),
            semanticsLabel: S.of(context).searchHint,
          ),
        ),
      ),
    ];

    List<Widget> rtlChildren = [
      // Menu icon (right)
      Container(
        width: iconArea,
        height: iconArea,
        alignment: Alignment.center,
        child: GestureDetector(
          onTap: onMenuTap,
          behavior: HitTestBehavior.translucent,
          child: SvgPicture.asset(
            AppAssets.drawerMenu,
            width: iconSize,
            height: iconSize,
            colorFilter: const ColorFilter.mode(AppColors.primary, BlendMode.srcIn),
            semanticsLabel: S.of(context).menuLabel,
          ),
        ),
      ),
      SizedBox(width: gap),
      // Notification icon with badge
      Container(
        width: iconArea,
        height: iconArea,
        alignment: Alignment.center,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            GestureDetector(
              onTap: () => Navigator.of(context).pushNamed(AppRoutes.notificationCenter),
              child: SvgPicture.asset(
                AppAssets.notification,
                width: iconSize,
                height: iconSize,
                colorFilter: const ColorFilter.mode(AppColors.primary, BlendMode.srcIn),
                semanticsLabel: S.of(context).notificationsLabel,
              ),
            ),
            badge('5'),
          ],
        ),
      ),
      SizedBox(width: gap),
      // Cart icon with badge
      Container(
        width: iconArea,
        height: iconArea,
        alignment: Alignment.center,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            GestureDetector(
              onTap: () => Navigator.of(context).pushNamed(AppRoutes.cart),
              child: SvgPicture.asset(
                AppAssets.cart,
                width: iconSize,
                height: iconSize,
                colorFilter: const ColorFilter.mode(AppColors.primary, BlendMode.srcIn),
                semanticsLabel: S.of(context).cartLabel,
              ),
            ),
            badge('99+'),
          ],
        ),
      ),
      SizedBox(width: gap),
      /*
      ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: mq.size.width * 0.4,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Container(
            height: iconArea * 0.8,
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
      */
      const Spacer(),
      // Search icon (left)
      Container(
        width: iconArea,
        height: iconArea,
        alignment: Alignment.center,
        child: GestureDetector(
          onTap: () => Navigator.of(context).pushNamed(AppRoutes.search),
          child: SvgPicture.asset(
            AppAssets.search,
            width: iconSize,
            height: iconSize,
            colorFilter: const ColorFilter.mode(AppColors.primary, BlendMode.srcIn),
            semanticsLabel: S.of(context).searchHint,
          ),
        ),
      ),
    ];

    return Container(
      color: AppColors.white,
      height: preferredSize.height,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: mq.size.width * 0.04,
          vertical: mq.size.height * 0.01,
        ).copyWith(top: mq.padding.top + mq.size.height * 0.01),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: isRtl ? rtlChildren : ltrChildren,
        ),
      ),
    );
  }
}
