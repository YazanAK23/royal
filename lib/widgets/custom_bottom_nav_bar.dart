import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../core/constants/app_assets.dart';
import '../core/constants/app_colors.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double itemWidth = MediaQuery.of(context).size.width / 5;
    return Container(
      height: 60,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color(0x1A000000),
            blurRadius: 10,
            offset: Offset(0, -1),
          ),
        ],
      ),
      child: Stack(
        children: [
          SizedBox(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildNavItem(context, 0, 
                  selectedIcon: AppAssets.homeLogoSelected,
                  unselectedIcon: AppAssets.homeLogoUnselected,
                ),
                _buildNavItem(context, 1,
                  selectedIcon: AppAssets.favoriteSelected,
                  unselectedIcon: AppAssets.favoriteUnselected,
                ),
                _buildNavItem(context, 2,
                  selectedIcon: AppAssets.profileIcon,
                  unselectedIcon: AppAssets.profileIcon,
                ),
                _buildNavItem(context, 3,
                  selectedIcon: AppAssets.downloadsSelected,
                  unselectedIcon: AppAssets.downloadsUnselected,
                ),
                _buildNavItem(context, 4,
                  selectedIcon: AppAssets.informationSelected,
                  unselectedIcon: AppAssets.informationUnselected,
                ),
              ],
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInOut,
            top: 0,
            left: itemWidth * currentIndex,
            child: Container(
              width: itemWidth,
              height: 2,
              color: AppColors.primary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(BuildContext context, int index, {
    required String selectedIcon,
    required String unselectedIcon,
  }) {
    final isSelected = index == currentIndex;
    final itemWidth = MediaQuery.of(context).size.width / 5;
    
    return SizedBox(
      width: itemWidth,
      height: 60,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => onTap(index),
          splashColor: AppColors.primary.withOpacity(0.1),
          highlightColor: AppColors.primary.withOpacity(0.05),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            child: Center(
              child: SvgPicture.asset(
                isSelected ? selectedIcon : unselectedIcon,
                width: 24,
                height: 24,
                colorFilter: ColorFilter.mode(
                  isSelected ? AppColors.primary : AppColors.iconInactive,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
