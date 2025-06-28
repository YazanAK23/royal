import 'package:flutter/material.dart';
import 'package:royal/generated/l10n.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_dimensions.dart';
import '../../core/routes/app_routes.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_bottom_nav_bar.dart';
import '../../widgets/custom_drawer.dart';
import '../../widgets/category_item_list.dart';

class CategoryDetailScreen extends StatelessWidget {
  final String categoryTitle;
  final String categoryIcon;

  const CategoryDetailScreen({
    super.key,
    required this.categoryTitle,
    required this.categoryIcon,
  });

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final items = [
      CategoryItem(title: s.waterTanks, icon: 'assets/images/tank2.png'),
      CategoryItem(title: s.manholes, icon: null),
      CategoryItem(title: s.plasticPipes, icon: 'assets/images/tube.svg'),
      CategoryItem(title: s.plasticSurfaces, icon: null),
      CategoryItem(title: s.assemblyParts, icon: null),
      CategoryItem(title: s.buildingSupplies, icon: null),
    ];
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
      body: CategoryItemList(
        title: categoryTitle.isNotEmpty ? categoryTitle : s.sanitaryLabel,
        items: items,
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: 0,
        onTap: (index) {},
      ),
    );
  }
}
