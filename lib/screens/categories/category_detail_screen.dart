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
  final String? categoryTitle;
  final String? categoryIcon;

  const CategoryDetailScreen({
    super.key,
    this.categoryTitle,
    this.categoryIcon,
  });

  List<CategoryItem> getCategoryItems(BuildContext context, String? title) {
    final s = S.of(context);
    // Example: return different data based on the title
    if (title == s.waterTanks) {
      return [
        CategoryItem(title: s.tank300L, icon: 'assets/images/tank2.png'),
        CategoryItem(title: s.tank300LLong, icon: 'assets/images/tank_long.png'),
        CategoryItem(title: s.tank100L, icon: null),
        CategoryItem(title: s.tank150L, icon: null),
        CategoryItem(title: s.tank250L, icon: null),
        CategoryItem(title: s.tank500L, icon: null),
      ];
    }
    // Default: top-level categories
    return [
      CategoryItem(title: s.waterTanks, icon: 'assets/images/tank2.png'),
      CategoryItem(title: s.manholes, icon: null),
      CategoryItem(title: s.plasticPipes, icon: 'assets/images/tube2.png'),
      CategoryItem(title: s.plasticSurfaces, icon: null),
      CategoryItem(title: s.assemblyParts, icon: null),
      CategoryItem(title: s.buildingSupplies, icon: null),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    final String title = args?['title'] ?? categoryTitle ?? s.sanitaryLabel;
    final String? icon = args?['icon'] ?? categoryIcon;
    final items = getCategoryItems(context, title);
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
            onMenuTap: () => AppRoutes.navigateTo(context, AppRoutes.customDrawer),
          ),
        ),
      ),
      body: CategoryItemList(
        title: title,
        items: items,
        onItemTap: (item) {
          AppRoutes.navigateTo(
            context,
            AppRoutes.categoryDetailScreen,
            arguments: {'title': item.title, 'icon': item.icon},
          );
        },
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: 0,
        onTap: (index) {  
          if (index == 0) {
            Navigator.of(context).pushReplacementNamed('/home');
          } else if (index == 1) {
            Navigator.of(context).pushReplacementNamed('/favorites');
          } else if (index == 2) {
            Navigator.of(context).pushReplacementNamed('/profile');
          } else if (index == 3) {
            Navigator.of(context).pushReplacementNamed('/downloads');
          } else if (index == 4) {
            Navigator.of(context).pushReplacementNamed('/info');
          }
        },
      ),
    );
  }
}
