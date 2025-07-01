import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:royal/generated/l10n.dart';
import '../../core/constants/app_assets.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_text_styles.dart';
import '../../widgets/category_card.dart';
import '../../widgets/royal_scaffold.dart';
import '../categories/category_detail_screen.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  int _currentIndex = 0;
  int? _selectedCategoryIndex;

  String _getGreeting() {
    return S.of(context).goodMorningLabel;
  }


  void _onBackFromCategory() {
    setState(() {
      _selectedCategoryIndex = null;
    });
  }

  Widget _buildCategoryDetails(int index) {
    // Example: Only for "Sanitary Ware" (index 1), show your screenshot's list
    if (index == 1) {
      final items = [
        {'title': S.of(context).waterTanks, 'icon': AppAssets.tank},
        {'title': S.of(context).manholes, 'icon': null},
        {'title': S.of(context).plasticPipes, 'icon': AppAssets.tube},
        {'title': S.of(context).plasticParts, 'icon': null},
        {'title': S.of(context).collectionBoxes, 'icon': null},
        {'title': S.of(context).buildingSupplies, 'icon': null},
      ];
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: _onBackFromCategory,
                ),
                Expanded(
                  child: Text(
                    S.of(context).sanitaryLabel,
                    style: AppTextStyles.greetingPrimary,
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(width: 48), // To balance the back button
              ],
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemCount: items.length,
              separatorBuilder: (_, __) => const Divider(height: 1),
              itemBuilder: (context, i) => ListTile(
                leading: Icon(Icons.arrow_back_ios, color: AppColors.red),
                title: Text(items[i]['title']!),
                trailing: items[i]['icon'] != null
                    ? Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          color: AppColors.red.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: SvgPicture.asset(
                          items[i]['icon']!,
                          fit: BoxFit.contain,
                        ),
                      )
                    : Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          color: AppColors.red.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                onTap: () {},
              ),
            ),
          ),
        ],
      );
    }
    // For other categories, just show a placeholder
    final titles = [
      S.of(context).furnitureLabel,
      S.of(context).sanitaryLabel,
      S.of(context).energyLabel,
      S.of(context).trustLabel,
    ];
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Row(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: _onBackFromCategory,
              ),
              Expanded(
                child: Text(
                  titles[index],
                  style: AppTextStyles.greetingPrimary,
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(width: 48),
            ],
          ),
        ),
        Expanded(
          child: Center(child: Text(S.of(context).noContentYet)), // Localized placeholder
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return RoyalScaffold(
      currentIndex: _currentIndex,
      onNavTap: (index) {
        if (index == 0) {
          // Already on home
        } else if (index == 1) {
          Navigator.of(context).pushReplacementNamed('/favorite');
        } else if (index == 2) {
          Navigator.of(context).pushReplacementNamed('/profile');
        } else if (index == 3) {
          Navigator.of(context).pushReplacementNamed('/downloads');
        } else if (index == 4) {
          Navigator.of(context).pushReplacementNamed('/info');
        }
      },
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
          // Category Grid or Category Details
          Expanded(
            child: _selectedCategoryIndex == null
                ? GridView.count(
                    crossAxisCount: 2,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    childAspectRatio: 1,
                    children: [
                      CategoryCard(
                        iconPath: AppAssets.furniture,
                        title: S.of(context).furnitureLabel,
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => CategoryDetailScreen(
                              categoryTitle: S.of(context).furnitureLabel,
                              categoryIcon: AppAssets.furniture,
                            ),
                          ),
                        ),
                      ),
                      CategoryCard(
                        iconPath: AppAssets.sanitaryWare,
                        title: S.of(context).sanitaryLabel,
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => CategoryDetailScreen(
                              categoryTitle: S.of(context).sanitaryLabel,
                              categoryIcon: AppAssets.sanitaryWare,
                            ),
                          ),
                        ),
                      ),
                      CategoryCard(
                        iconPath: AppAssets.smartEnergy,
                        title: S.of(context).energyLabel,
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => CategoryDetailScreen(
                              categoryTitle: S.of(context).energyLabel,
                              categoryIcon: AppAssets.smartEnergy,
                            ),
                          ),
                        ),
                      ),
                      CategoryCard(
                        iconPath: AppAssets.trust,
                        title: S.of(context).trustLabel,
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => CategoryDetailScreen(
                              categoryTitle: S.of(context).trustLabel,
                              categoryIcon: AppAssets.trust,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                : _buildCategoryDetails(_selectedCategoryIndex!),
          ),
        ],
      ),
    );
  }
}

