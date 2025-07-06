import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:royal/generated/l10n.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/constants/app_assets.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_dimensions.dart';
import '../../core/constants/app_text_styles.dart';
import '../../core/routes/app_routes.dart';
import '../../widgets/category_card.dart';
import '../../widgets/royal_scaffold.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final int _currentIndex = 0;
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
            padding: EdgeInsets.symmetric(
              horizontal: AppDimensions.padding24.w,
              vertical: AppDimensions.padding16.h,
            ),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back, size: 24.sp),
                  onPressed: _onBackFromCategory,
                ),
                Expanded(
                  child: Text(
                    S.of(context).sanitaryLabel,
                    style: AppTextStyles.greetingPrimary.copyWith(fontSize: 18.sp),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(width: AppDimensions.spacing24.w),
              ],
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemCount: items.length,
              separatorBuilder: (_, __) => Divider(height: 1.h),
              itemBuilder: (context, i) => ListTile(
                leading: Icon(Icons.arrow_back_ios, color: AppColors.iconActive, size: 20.sp),
                title: Text(
                  items[i]['title']!,
                  style: AppTextStyles.categoryTitle.copyWith(fontSize: 16.sp),
                ),
                trailing: items[i]['icon'] != null
                    ? Container(
                        width: AppDimensions.iconSize.w,
                        height: AppDimensions.iconSize.h,
                        decoration: BoxDecoration(
                          color: AppColors.iconActive.withAlpha(26),
                          borderRadius: BorderRadius.circular(AppDimensions.borderRadius10.r),
                        ),
                        child: SvgPicture.asset(
                          items[i]['icon']!,
                          fit: BoxFit.contain,
                        ),
                      )
                    : Container(
                        width: AppDimensions.iconSize.w,
                        height: AppDimensions.iconSize.h,
                        decoration: BoxDecoration(
                          color: AppColors.iconActive.withAlpha(26),
                          borderRadius: BorderRadius.circular(AppDimensions.borderRadius10.r),
                        ),
                      ),
                onTap: () {},
              ),
            ),
          ),
        ],
      );
    }

    final titles = [
      S.of(context).furnitureLabel,
      S.of(context).sanitaryLabel,
      S.of(context).energyLabel,
      S.of(context).trustLabel,
    ];
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppDimensions.padding24.w,
            vertical: AppDimensions.padding16.h,
          ),
          child: Row(
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back, size: 24.sp),
                onPressed: _onBackFromCategory,
              ),
              Expanded(
                child: Text(
                  titles[index],
                  style: AppTextStyles.greetingPrimary.copyWith(fontSize: 18.sp),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(width: AppDimensions.spacing24.w),
            ],
          ),
        ),
        Expanded(
          child: Center(
            child: Text(
              S.of(context).noContentYet,
              style: AppTextStyles.categoryTitle.copyWith(fontSize: 16.sp),
            ),
          ),
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
          Navigator.of(context).pushReplacementNamed(AppRoutes.favorite);
        } else if (index == 2) {
          Navigator.of(context).pushReplacementNamed(AppRoutes.profile);
        } else if (index == 3) {
          Navigator.of(context).pushReplacementNamed(AppRoutes.downloads);
        } else if (index == 4) {
          Navigator.of(context).pushReplacementNamed(AppRoutes.info);
        }
      },
      body: Column(
        children: [
          SizedBox(height: AppDimensions.spacing24.h),
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(left: AppDimensions.padding24.w),
            alignment: Alignment.centerLeft,
            child: SvgPicture.asset(
              AppAssets.companyLogo,
              height: AppDimensions.companyLogoHeight.h,
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(height: AppDimensions.spacing36.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppDimensions.padding24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  _getGreeting(),
                  style: AppTextStyles.greetingPrimary.copyWith(fontSize: 20.sp),
                  textAlign: TextAlign.start,
                ),
                SizedBox(height: AppDimensions.spacing4.h),
                Text(
                  S.of(context).nameLabel,
                  style: AppTextStyles.greetingSecondary.copyWith(fontSize: 16.sp),
                  textAlign: TextAlign.start,
                ),
              ],
            ),
          ),
          SizedBox(height: AppDimensions.spacing36.h),
          Expanded(
            child: _selectedCategoryIndex == null
                ? Builder(
                    builder: (context) {
                      final isRtl = Directionality.of(context) == TextDirection.rtl;
                      final categories = isRtl
                          ? [
                              CategoryCard(
                                iconPath: AppAssets.sanitaryWare,
                                title: S.of(context).sanitaryLabel,
                                onTap: () => Navigator.pushNamed(
                                  context,
                                  AppRoutes.categoryDetailScreen,
                                  arguments: {
                                    'categoryTitle': S.of(context).sanitaryLabel,
                                    'categoryIcon': AppAssets.sanitaryWare,
                                  },
                                ),
                              ),
                              CategoryCard(
                                iconPath: AppAssets.furniture,
                                title: S.of(context).furnitureLabel,
                                onTap: () => Navigator.pushNamed(
                                  context,
                                  AppRoutes.categoryDetailScreen,
                                  arguments: {
                                    'categoryTitle': S.of(context).furnitureLabel,
                                    'categoryIcon': AppAssets.furniture,
                                  },
                                ),
                              ),
                              CategoryCard(
                                iconPath: AppAssets.smartEnergy,
                                title: S.of(context).energyLabel,
                                onTap: () => Navigator.pushNamed(
                                  context,
                                  AppRoutes.categoryDetailScreen,
                                  arguments: {
                                    'categoryTitle': S.of(context).energyLabel,
                                    'categoryIcon': AppAssets.smartEnergy,
                                  },
                                ),
                              ),
                              CategoryCard(
                                iconPath: AppAssets.trust,
                                title: S.of(context).trustLabel,
                                onTap: () => Navigator.pushNamed(
                                  context,
                                  AppRoutes.categoryDetailScreen,
                                  arguments: {
                                    'categoryTitle': S.of(context).trustLabel,
                                    'categoryIcon': AppAssets.trust,
                                  },
                                ),
                              ),
                            ]
                          : [
                              CategoryCard(
                                iconPath: AppAssets.furniture,
                                title: S.of(context).furnitureLabel,
                                onTap: () => Navigator.pushNamed(
                                  context,
                                  AppRoutes.categoryDetailScreen,
                                  arguments: {
                                    'categoryTitle': S.of(context).furnitureLabel,
                                    'categoryIcon': AppAssets.furniture,
                                  },
                                ),
                              ),
                              CategoryCard(
                                iconPath: AppAssets.sanitaryWare,
                                title: S.of(context).sanitaryLabel,
                                onTap: () => Navigator.pushNamed(
                                  context,
                                  AppRoutes.categoryDetailScreen,
                                  arguments: {
                                    'categoryTitle': S.of(context).sanitaryLabel,
                                    'categoryIcon': AppAssets.sanitaryWare,
                                  },
                                ),
                              ),
                              CategoryCard(
                                iconPath: AppAssets.smartEnergy,
                                title: S.of(context).energyLabel,
                                onTap: () => Navigator.pushNamed(
                                  context,
                                  AppRoutes.categoryDetailScreen,
                                  arguments: {
                                    'categoryTitle': S.of(context).energyLabel,
                                    'categoryIcon': AppAssets.smartEnergy,
                                  },
                                ),
                              ),
                              CategoryCard(
                                iconPath: AppAssets.trust,
                                title: S.of(context).trustLabel,
                                onTap: () => Navigator.pushNamed(
                                  context,
                                  AppRoutes.categoryDetailScreen,
                                  arguments: {
                                    'categoryTitle': S.of(context).trustLabel,
                                    'categoryIcon': AppAssets.trust,
                                  },
                                ),
                              ),
                            ];
                      return GridView.count(
                        crossAxisCount: 2,
                        padding: EdgeInsets.symmetric(horizontal: AppDimensions.padding20.w),
                        mainAxisSpacing: AppDimensions.gridSpacing.h,
                        crossAxisSpacing: AppDimensions.gridSpacing.w,
                        childAspectRatio: 1,
                        children: categories,
                      );
                    },
                  )
                : _buildCategoryDetails(_selectedCategoryIndex!),
          ),
        ],
      ),
    );
  }
}

