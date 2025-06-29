import 'package:royal/core/routes/app_routes.dart';

import '../models/drawer_menu_item.dart';
import 'app_assets.dart';

class DrawerMenuItems {
  static List<DrawerMenuItem> getItems() {
    return [
      DrawerMenuItem(
        titleKey: 'profileLabel',
        icon: AppAssets.profileIcon,
        route: '/profile',
      ),
      DrawerMenuItem(
        titleKey: 'ordersLabel',
        icon: AppAssets.orders,
        route: AppRoutes.orders, 
      ),
      DrawerMenuItem(
        titleKey: 'newItemsLabel',
        icon: AppAssets.newItems,
        route: '/new-items',
      ),
      DrawerMenuItem(
        titleKey: 'browsingArchiveLabel',
        icon: AppAssets.browsingArchive,
        route: AppRoutes.history,
      ),
      DrawerMenuItem(
        titleKey: 'monthlyOffersLabel',
        icon: AppAssets.monthlyOffers,
        route: '/monthly-offers',
      ),
      DrawerMenuItem(
        titleKey: 'newsLabel',
        icon: AppAssets.news,
        route: AppRoutes.news,
      ),
      DrawerMenuItem(
        titleKey: 'certificatesLabel',
        icon: AppAssets.certificates,
        route: '/certificates',
      ),
      DrawerMenuItem(
        titleKey: 'appInfoLabel',
        icon: AppAssets.information,
        route: '/app-info',
      ),
    ];
  }

  static const List<String> socialLinks = [
    AppAssets.facebook,
    AppAssets.instagram,
    AppAssets.youtube,
    AppAssets.whatsapp,
  ];
}