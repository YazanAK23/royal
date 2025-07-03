import 'package:flutter/material.dart';
import 'package:royal/core/models/product_item.dart';
import 'package:royal/generated/l10n.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_dimensions.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_bottom_nav_bar.dart';
import '../../widgets/custom_drawer.dart';
import '../../widgets/product_item_list.dart';
import '../../core/routes/app_routes.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  late String title;
  late List<ProductItem> products;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final s = S.of(context);
    final args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>? ?? {};
    title = args['title'] ?? s.sanitaryLabel;

    products = [
      ProductItem(title: s.tank300L, image: 'assets/images/tank2.png'),
      ProductItem(title: s.tank300LLong, image: 'assets/images/tank_long.png', isFavorite: true),
      ProductItem(title: s.tank100L),
      ProductItem(title: s.tank150L),
      ProductItem(title: s.tank250L),
      ProductItem(title: s.tank500L),
    ];
  }

  void toggleFavorite(ProductItem item) {
    setState(() {
      final index = products.indexOf(item);
      products[index] = item.copyWith(isFavorite: !item.isFavorite);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      endDrawer: CustomDrawer(
        onMenuItemTap: (route) {
          Navigator.pop(context);
          Navigator.pushNamed(context, route);
        },
      ),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(AppDimensions.appBarHeight),
        child: Builder(
          builder: (context) => CustomAppBar(
            onMenuTap: () => AppRoutes.navigateTo(context, AppRoutes.customDrawer),
          ),
        ),
      ),
      body: ProductItemList(
        title: title,
        items: products,
        onFavoriteToggle: toggleFavorite,
        onItemTap: (product) {
          Navigator.of(context).pushNamed(
            AppRoutes.subProductDetail,
            arguments: {'title': product.title, 'image': product.image},
          );
        },
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: 0,
        onTap: (index) {
          if (index == 0) {
            Navigator.of(context).pushReplacementNamed('/home');
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
      ),
    );
  }
}
