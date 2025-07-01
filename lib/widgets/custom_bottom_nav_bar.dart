import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../core/constants/app_assets.dart';
import '../core/constants/app_colors.dart';
import '../core/routes/app_routes.dart';

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
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double deviceHeight = MediaQuery.of(context).size.height;
    final double navBarHeight = (deviceHeight * 0.09).clamp(60.0, 90.0); // Responsive height
    final double iconSize = (deviceWidth * 0.06).clamp(22.0, 32.0); // Responsive icon size
    final double itemWidth = deviceWidth / 5;
    final isRtl = Directionality.of(context) == TextDirection.rtl;
    debugPrint('CustomBottomNavBar isRtl: ' + isRtl.toString());
    // Define nav item data
    final navItemsData = [
      {
        'selectedIcon': AppAssets.homeLogoSelected,
        'unselectedIcon': AppAssets.homeLogoUnselected,
        'route': AppRoutes.home,
      },
      {
        'selectedIcon': AppAssets.favoriteSelected,
        'unselectedIcon': AppAssets.favoriteUnselected,
        'route': AppRoutes.favorite,
      },
      {
        'selectedIcon': AppAssets.profileIcon,
        'unselectedIcon': AppAssets.profileIcon,
        'route': AppRoutes.profile, // Navigate to profile screen
      },
      {
        'selectedIcon': AppAssets.downloadsSelected,
        'unselectedIcon': AppAssets.downloadsUnselected,
        'route': AppRoutes.downloads, // Corrected to downloads route
      },
      {
        'selectedIcon': AppAssets.informationSelected,
        'unselectedIcon': AppAssets.informationUnselected,
        'route': AppRoutes.info, // Updated to use the new info route
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
        iconSize: iconSize,
        onTap: () {
          if (currentIndex != logicalIndex) {
            Navigator.of(context).pushReplacementNamed(data['route']!);
          }
          onTap(logicalIndex);
        },
      );
    });
    final rowChildren = isRtl ? navBarWidgets.reversed.toList() : navBarWidgets;
    return SafeArea(
      top: false,
      child: Container(
        height: navBarHeight,
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
              height: navBarHeight,
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

  // Update _buildNavItem to accept isSelected, iconSize, and onTap
  Widget _buildNavItem(BuildContext context, int index, {
    required String selectedIcon,
    required String unselectedIcon,
    bool isSelected = false,
    double iconSize = 24,
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
                width: iconSize,
                height: iconSize,
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
