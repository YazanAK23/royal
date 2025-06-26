import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../core/constants/app_assets.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_dimensions.dart';
import '../../core/constants/app_strings.dart';
import '../../core/constants/app_text_styles.dart';
import '../../core/routes/app_routes.dart';
import '../../widgets/category_card.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_bottom_nav_bar.dart';
import '../../widgets/custom_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final bool _isArabic = true; // TODO: Get this from your app's locale/settings

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      endDrawer: CustomDrawer(
        userName: _isArabic ? AppStrings.userNameAr : AppStrings.userNameEn,
        userNameAr: AppStrings.userNameAr,
        isArabic: _isArabic,
        onMenuItemTap: (route) {
          AppRoutes.pop(context);
          AppRoutes.navigateTo(context, route);
        },
      ),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(AppDimensions.appBarHeight),
        child: Builder(
          builder: (context) => CustomAppBar(
            isArabic: _isArabic,
            onMenuTap: () => Scaffold.of(context).openEndDrawer(),
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 24),
          // Company logo - left aligned as per design
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(left: 24),
            alignment: Alignment.centerLeft,
            child: SvgPicture.asset(
              AppAssets.companyLogo,
              height: 62,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: 36),
          // Greeting text - right aligned as per design
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      AppStrings.morningGreetingAr,
                      style: AppTextStyles.greetingPrimary,
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      AppStrings.userNameAr,
                      style: AppTextStyles.greetingSecondary,
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 36),
          // Category Grid - exactly as per design
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              childAspectRatio: 1,
              children: [
                CategoryCard(
                  iconPath: AppAssets.furniture,
                  title: AppStrings.furnitureAr,
                ),
                CategoryCard(
                  iconPath: AppAssets.sanitaryWare,
                  title: AppStrings.sanitaryWareAr,
                ),
                CategoryCard(
                  iconPath: AppAssets.smartEnergy,
                  title: AppStrings.smartEnergyAr,
                ),
                CategoryCard(
                  iconPath: AppAssets.trust,
                  title: AppStrings.electricalDevicesAr,
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
      ),
    );
  }
}
