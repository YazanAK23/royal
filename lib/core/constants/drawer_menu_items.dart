import '../models/drawer_menu_item.dart';
import 'app_assets.dart';

class DrawerMenuItems {
  static const List<DrawerMenuItem> items = [
    DrawerMenuItem(
      title: 'Profile',
      titleAr: 'الملف الشخصي',
      icon: AppAssets.profile,
      route: '/profile',
    ),
    DrawerMenuItem(
      title: 'Orders',
      titleAr: 'الطلبات',
      icon: AppAssets.orders,
      route: '/orders',
    ),
    DrawerMenuItem(
      title: 'New Items',
      titleAr: 'الاصناف الجديدة',
      icon: AppAssets.newItems,
      route: '/new-items',
    ),
    DrawerMenuItem(
      title: 'Browsing Archive',
      titleAr: 'أرشيف التصفح',
      icon: AppAssets.browsingArchive,
      route: '/browsing-archive',
    ),
    DrawerMenuItem(
      title: 'Monthly Offers',
      titleAr: 'الاعلانات الشهرية',
      icon: AppAssets.monthlyOffers,
      route: '/monthly-offers',
    ),
    DrawerMenuItem(
      title: 'News',
      titleAr: 'الاخبار',
      icon: AppAssets.news,
      route: '/news',
    ),
    DrawerMenuItem(
      title: 'Certificates',
      titleAr: 'الشهادات',
      icon: AppAssets.certificates,
      route: '/certificates',
    ),
    DrawerMenuItem(
      title: 'App Info',
      titleAr: 'معلومات التطبيق',
      icon: AppAssets.information,
      route: '/app-info',
    ),
  ];

  static const List<String> socialLinks = [
    AppAssets.facebook,
    AppAssets.instagram,
    AppAssets.youtube,
    AppAssets.whatsapp,
  ];
}
