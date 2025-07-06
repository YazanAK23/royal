import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:royal/generated/l10n.dart';
import 'package:royal/widgets/product_card.dart';
import '../../../widgets/royal_scaffold.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_text_styles.dart';
import '../../core/constants/app_dimensions.dart';
import '../../core/routes/app_routes.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  int selectedCategory = 0;
  String? _source;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)?.settings.arguments;
    if (args is Map && args['source'] is String) {
      _source = args['source'] as String;
    } else {
      _source = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final categories = [
      s.sanitaryLabel,
      s.energyLabel,
      s.furnitureLabel,
      s.trustLabel,
    ];
    final products = [
      // Example products, you can replace with your real data
      {'image': 'assets/images/tank7.png', 'title': s.waterTanks},
      {'image': 'assets/images/tank6.png', 'title': s.waterTanks},
      {'image': 'assets/images/tank4.png', 'title': s.waterTanks},
      {'image': 'assets/images/tank3.png', 'title': s.waterTanks},
      {'image': 'assets/images/tank5.png', 'title': s.waterTanks},
      {'image': 'assets/images/tank7.png', 'title': s.waterTanks},
    ];
    return WillPopScope(
      onWillPop: () async {
        if (_source == 'drawer') {
          Navigator.of(context).pushReplacementNamed('/'); // or AppRoutes.customDrawer
          return false;
        }
        return true;
      },
      child: RoyalScaffold(
        currentIndex: 1, // 1 for Favorite page
        onNavTap: (index) {
          if (index == 0) {
            Navigator.of(context).pushReplacementNamed(AppRoutes.home);
          } else if (index == 1) {
            // Already on favorite, do nothing
          } else if (index == 2) {
            Navigator.of(context).pushReplacementNamed(AppRoutes.profile);
          } else if (index == 3) {
            Navigator.of(context).pushReplacementNamed(AppRoutes.history);
          } else if (index == 4) {
            Navigator.of(context).pushReplacementNamed(AppRoutes.info);
          }
        },
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          child: Column(
            children: [
              SizedBox(height: 24.h),
              Center(
                child: Text(
                  s.favoritesLabel, // Use your localized favorite label
                  style: AppTextStyles.favoriteTitle.copyWith(fontSize: 20.sp),
                ),
              ),
              SizedBox(height: 16.h),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(categories.length, (index) {
                    final isSelected = index == selectedCategory;
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(height: 8.h),
                          TextButton(
                            onPressed: () {
                              setState(() => selectedCategory = index);
                            },
                            style: TextButton.styleFrom(
                              backgroundColor: isSelected ? AppColors.favoriteSelectedCategory : Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                                side: BorderSide(
                                  color: isSelected ? AppColors.favoriteSelectedCategory : Colors.grey.shade300,
                                  width: 1.5,
                                ),
                              ),
                              padding: EdgeInsets.symmetric(horizontal: AppDimensions.favoriteCategoryPaddingHorizontal.w, vertical: AppDimensions.favoriteCategoryPaddingVertical.h),
                            ),
                            child: Text(
                              categories[index],
                              style: isSelected ? AppTextStyles.favoriteCategorySelected.copyWith(fontSize: 16.sp) : AppTextStyles.favoriteCategoryUnselected.copyWith(fontSize: 16.sp),
                            ),
                          ),
                          SizedBox(height: 4.h),
                        ],
                      ),
                    );
                  }),
                ),
              ),
              SizedBox(height: 12.h),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                  child: GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 0.95,
                    children: products.map((product) => ProductCard(
                      imagePath: product['image']!,
                      title: product['title']!,
                    )).toList(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
