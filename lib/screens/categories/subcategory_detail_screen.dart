import 'package:flutter/material.dart';
import 'package:royal/generated/l10n.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_dimensions.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_bottom_nav_bar.dart';
import '../../widgets/custom_drawer.dart';
import '../../widgets/category_item_list.dart';
import '../../core/routes/app_routes.dart';

class SubcategoryDetailScreen extends StatefulWidget {
  const SubcategoryDetailScreen({Key? key}) : super(key: key);

  @override
  State<SubcategoryDetailScreen> createState() => _SubcategoryDetailScreenState();
}

class _SubcategoryDetailScreenState extends State<SubcategoryDetailScreen> {
  late String title;
  late String? icon;
  late List<CategoryItem> items;
  late bool isProductLevelCategory;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final s = S.of(context);
    final args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>? ?? {};
    title = args['title'] ?? s.sanitaryLabel;
    icon = args['icon'];
    isProductLevelCategory = _isProductLevel(title, context);
    items = _getItems(context, title);
  }

  bool _isProductLevel(String title, BuildContext context) {
    final s = S.of(context);
    // Add all product-level subcategories here
    return title == s.oneLayerTanks || title == s.twoLayerTanks;
  }

  List<CategoryItem> _getItems(BuildContext context, String title) {
    final s = S.of(context);
    // Only return subcategories if not at product level
    if (_isProductLevel(title, context)) {
      return [];
    }
    return [
      CategoryItem(title: s.oneLayerTanks, icon: 'assets/images/tank2.png'),
      CategoryItem(title: s.twoLayerTanks),
      CategoryItem(title: s.threeLayerTanks),
      CategoryItem(title: s.fourLayerTanks),
      CategoryItem(title: s.medicalTanks),
      CategoryItem(title: s.grpTanks),
    ];
  }

  @override
  Widget build(BuildContext context) {
    // Guard: If this is a product-level category, redirect to ProductDetailScreen
    if (isProductLevelCategory) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.of(context).pushReplacementNamed(
          AppRoutes.productDetail,
          arguments: {'title': title, 'icon': icon},
        );
      });
      // Show a loading indicator while redirecting
      return const Scaffold(
        backgroundColor: AppColors.white,
        body: Center(child: CircularProgressIndicator()),
      );
    }
    return Scaffold(
      backgroundColor: AppColors.white,
      endDrawer: CustomDrawer(
        onMenuItemTap: (route) {
          Navigator.of(context).pop();
          Navigator.of(context).pushNamed(route);
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
        title: title,
        items: items,
        onItemTap: (item) {
          final isEndLevel = _isProductLevel(item.title, context);
          final route = isEndLevel
              ? AppRoutes.productDetail // Go to ProductDetailScreen
              : AppRoutes.subcategoryDetail;
          Navigator.of(context).pushNamed(
            route,
            arguments: {'title': item.title, 'icon': item.icon},
          );
        },
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: 0,
        onTap: (index) {},
      ),
    );
  }
}
