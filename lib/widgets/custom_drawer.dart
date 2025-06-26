import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../core/constants/app_assets.dart';
import '../core/constants/app_colors.dart';
import '../core/constants/app_dimensions.dart';
import '../core/constants/app_strings.dart';
import '../core/constants/app_text_styles.dart';
import '../core/constants/drawer_menu_items.dart';
import '../core/models/drawer_menu_item.dart';

class CustomDrawer extends StatelessWidget {
  final String userName;
  final String userNameAr;
  final bool isArabic;
  final Function(String) onMenuItemTap;

  const CustomDrawer({
    super.key,
    required this.userName,
    required this.userNameAr,
    required this.isArabic,
    required this.onMenuItemTap,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width,
      backgroundColor: AppColors.primary,
      child: SafeArea(
        child: Stack(
          children: [
            // Background pattern
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: SvgPicture.asset(
                AppAssets.drawerPattern,
                fit: BoxFit.fitWidth,
              ),
            ),
            // Content
            Column(
              children: [
                _buildHeader(),
                Expanded(
                  child: _buildMenuItems(),
                ),
                _buildSocialLinks(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.drawerPaddingH,
        vertical: AppDimensions.drawerPaddingV,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Language Switch
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                decoration: BoxDecoration(
                  // ignore: deprecated_member_use
                  color: AppColors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(AppDimensions.drawerLanguageButtonRadius),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildLanguageButton(AppStrings.languageAr, isArabic),
                    _buildLanguageButton(AppStrings.languageEn, !isArabic),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: AppDimensions.drawerItemSpacing),
          // Welcome Text
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    isArabic ? AppStrings.welcomeAr : AppStrings.welcomeEn,
                    style: AppTextStyles.drawerHeaderTitle,
                  ),
                  const SizedBox(height: AppDimensions.padding4),
                  Text(
                    isArabic ? userNameAr : userName,
                    style: AppTextStyles.drawerHeaderName,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLanguageButton(String text, bool isSelected) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.drawerLanguageButtonPaddingH,
        vertical: AppDimensions.drawerLanguageButtonPaddingV,
      ),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.white : Colors.transparent,
        borderRadius: BorderRadius.circular(AppDimensions.drawerLanguageButtonRadius),
      ),
      child: Text(
        text,
        style: AppTextStyles.drawerLanguageButton.copyWith(
          color: isSelected ? AppColors.primary : AppColors.white,
        ),
      ),
    );
  }

  Widget _buildMenuItems() {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: AppDimensions.drawerPaddingH),
      itemCount: DrawerMenuItems.items.length,
      itemBuilder: (context, index) {
        final item = DrawerMenuItems.items[index];
        return _buildMenuItem(item);
      },
    );
  }

  Widget _buildMenuItem(DrawerMenuItem item) {
    return InkWell(
      onTap: () => onMenuItemTap(item.route),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: AppDimensions.drawerItemSpacing),
        child: Row(
          textDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,
          children: [
            SvgPicture.asset(
              item.icon,
              width: AppDimensions.drawerIconSize,
              height: AppDimensions.drawerIconSize,
              colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
            ),
            const SizedBox(width: AppDimensions.drawerItemSpacing),
            Text(
              isArabic ? item.titleAr : item.title,
              style: AppTextStyles.drawerMenuItem,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSocialLinks() {
    return Container(
      padding: const EdgeInsets.all(AppDimensions.drawerPaddingH),
      child: Column(
        children: [
          Text(
            isArabic ? AppStrings.connectWithUsAr : AppStrings.connectWithUsEn,
            style: AppTextStyles.drawerSocialTitle,
          ),
          const SizedBox(height: AppDimensions.drawerItemSpacing),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: DrawerMenuItems.socialLinks.map((iconPath) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppDimensions.drawerSocialIconSpacing,
                ),
                child: SvgPicture.asset(
                  iconPath,
                  width: AppDimensions.drawerIconSize,
                  height: AppDimensions.drawerIconSize,
                  colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: AppDimensions.drawerItemSpacing),
        ],
      ),
    );
  }
}
