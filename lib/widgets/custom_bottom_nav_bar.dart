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
    final isRtl = Directionality.of(context) == TextDirection.rtl;
    debugPrint('CustomBottomNavBar isRtl: ' + isRtl.toString());
    // Define nav item data
    final navItemsData = [
      {
        'selectedIcon': AppAssets.homeLogoSelected,
        'unselectedIcon': AppAssets.homeLogoUnselected,
      },
      {
        'selectedIcon': AppAssets.favoriteSelected,
        'unselectedIcon': AppAssets.favoriteUnselected,
      },
      {
        'selectedIcon': AppAssets.profileIcon,
        'unselectedIcon': AppAssets.profileIcon,
      },
      {
        'selectedIcon': AppAssets.downloadsSelected,
        'unselectedIcon': AppAssets.downloadsUnselected,
      },
      {
        'selectedIcon': AppAssets.informationSelected,
        'unselectedIcon': AppAssets.informationUnselected,
      },
    ];
    final itemsCount = navItemsData.length;
    final indicatorIndex = isRtl ? (itemsCount - 1 - currentIndex) : currentIndex;
    final navBarWidgets = List.generate(itemsCount, (visualIndex) {
      final logicalIndex = isRtl ? (itemsCount - 1 - visualIndex) : visualIndex;
      final data = navItemsData[logicalIndex];
      return _buildNavItem(context, logicalIndex,
        selectedIcon: data['selectedIcon']!,
        unselectedIcon: data['unselectedIcon']!,
        isSelected: currentIndex == logicalIndex,
        onTap: () => onTap(logicalIndex),
      );
    });
    final rowChildren = isRtl ? navBarWidgets.reversed.toList() : navBarWidgets;
    return Directionality(
      textDirection: isRtl ? TextDirection.rtl : TextDirection.ltr,
      child: Container(
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
                children: rowChildren,
              ),
            ),
            AnimatedPositioned(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeInOut,
              top: 0,
              left: itemWidth * indicatorIndex,
              child: Container(
                width: itemWidth,
                height: 2,
                color: AppColors.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Update _buildNavItem to accept isSelected and onTap
  Widget _buildNavItem(BuildContext context, int index, {
    required String selectedIcon,
    required String unselectedIcon,
    bool isSelected = false,
    VoidCallback? onTap,
  }) {
    final itemWidth = MediaQuery.of(context).size.width / 5;
    return SizedBox(
      width: itemWidth,
      height: 60,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
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
