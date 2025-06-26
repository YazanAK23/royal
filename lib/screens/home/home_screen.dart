import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:royal/generated/l10n.dart';
import '../../core/constants/app_assets.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_dimensions.dart';
import '../../core/constants/app_text_styles.dart';
import '../../core/routes/app_routes.dart';
import '../../widgets/category_card.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_bottom_nav_bar.dart';
import '../../widgets/custom_drawer.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  int _currentIndex = 0;

  String _getGreeting() {
    return S.of(context).goodMorningLabel;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      endDrawer: CustomDrawer(
        onMenuItemTap: (route) {
          AppRoutes.pop(context);
          AppRoutes.navigateTo(context, route);
        },
      ),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(AppDimensions.appBarHeight),
        child: Builder(
          builder: (context) => CustomAppBar(
            onMenuTap: () => Scaffold.of(context).openEndDrawer(),
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 24),
          // Company logo
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
          // Greeting text
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  _getGreeting(),
                  style: AppTextStyles.greetingPrimary,
                  textAlign: TextAlign.start,
                ),
                const SizedBox(height: 4),
                Text(
                  S.of(context).nameLabel,
                  style: AppTextStyles.greetingSecondary,
                  textAlign: TextAlign.start,
                ),
              ],
            ),
          ),
          const SizedBox(height: 36),
          // Category Grid
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
                  title: S.of(context).furnitureLabel,
                ),
                CategoryCard(
                  iconPath: AppAssets.sanitaryWare,
                  title: S.of(context).sanitaryLabel,
                ),
                CategoryCard(
                  iconPath: AppAssets.smartEnergy,
                  title: S.of(context).smartEnergyLabel,
                ),
                CategoryCard(
                  iconPath: AppAssets.trust,
                  title: S.of(context).electricalLabel,
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
