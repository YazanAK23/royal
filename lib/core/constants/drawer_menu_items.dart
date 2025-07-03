import 'package:royal/core/routes/app_routes.dart';

import '../models/drawer_menu_item.dart';
import 'app_assets.dart';

class DrawerMenuItems {
  static List<DrawerMenuItem> getItems() {
    return [
      const DrawerMenuItem(
        titleKey: 'profileLabel',
        icon: AppAssets.profileIcon,
        route: AppRoutes.profile, // Updated to use AppRoutes
      ),
      const DrawerMenuItem(
        titleKey: 'ordersLabel',
        icon: AppAssets.orders,
        route: AppRoutes.orders, 
      ),
      const DrawerMenuItem(
        titleKey: 'newItemsLabel',
        icon: AppAssets.newItems,
        route: AppRoutes.newItems, // Updated to use AppRoutes  
      ),
      const DrawerMenuItem(
        titleKey: 'browsingArchiveLabel',
        icon: AppAssets.browsingArchive,
        route: AppRoutes.history,
      ),
      const DrawerMenuItem(
        titleKey: 'monthlyOffersLabel',
        icon: AppAssets.monthlyOffers,
        route: '/monthly-offers',
      ),
      const DrawerMenuItem(
        titleKey: 'newsLabel',
        icon: AppAssets.news,
        route: AppRoutes.news,
      ),
      const DrawerMenuItem(
        titleKey: 'certificatesLabel',
        icon: AppAssets.certificates,
        route: '/certificates',
      ),
      const DrawerMenuItem(
        titleKey: 'appInfoLabel', 
        icon: AppAssets.information,
        route: AppRoutes.aboutApp,
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