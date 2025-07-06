import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/constants/app_colors.dart';
import '../core/constants/app_dimensions.dart';
import 'custom_app_bar.dart';
import 'custom_bottom_nav_bar.dart';
import 'custom_drawer.dart';

class RoyalScaffold extends StatelessWidget {
  final Widget body;
  final int currentIndex;
  final ValueChanged<int> onNavTap;
  final bool showDrawer;
  final Color? backgroundColor;
  final PreferredSizeWidget? appBar;
  final Widget? endDrawer;

  const RoyalScaffold({
    super.key,
    required this.body,
    required this.currentIndex,
    required this.onNavTap,
    this.showDrawer = true,
    this.backgroundColor,
    this.appBar,
    this.endDrawer,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor ?? AppColors.white,
      endDrawer: showDrawer
          ? (endDrawer ?? CustomDrawer(
              onMenuItemTap: (route) {
                Navigator.of(context).pop();
                Navigator.of(context).pushReplacementNamed(route);
              },
            ))
          : null,
      appBar: appBar ?? PreferredSize(
        preferredSize: Size.fromHeight(AppDimensions.appBarHeight.h),
        child: Builder(
          builder: (context) => CustomAppBar(
            onMenuTap: () => Scaffold.of(context).openEndDrawer(),
          ),
        ),
      ),
      body: body,
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: currentIndex,
        onTap: onNavTap,
      ),
    );
  }
}
