import 'package:flutter/material.dart';
import 'package:royal/screens/home/home_screen.dart';
import 'package:royal/screens/auth/login_screen.dart';
import 'package:royal/screens/categories/subcategory_detail_screen.dart';
import 'package:royal/screens/categories/product_detail_screen.dart'; // Import the ProductDetailScreen
import 'package:royal/screens/news_page.dart'; // Import the NewsPage
import 'package:royal/widgets/custom_drawer.dart'; // Import the CustomDrawer


class AppRoutes {
  // Route Names
  static const String login = '/login';
  static const String home = '/home';
  static const String account = '/account';
  static const String orders = '/orders';
  static const String newItems = '/new-items';
  static const String history = '/browsing-history';
  static const String monthlyAd = '/monthly-ad';
  static const String news = '/news';
  static const String certificates = '/certificates';
  static const String information = '/information';
  static const String sanitaryWare = '/sanitary-ware';
  static const String furniture = '/furniture';
  static const String smartEnergy = '/smart-energy';
  static const String trust = '/trust';
  static const String categoryDetailScreen = '/categoryDetailScreen';
  static const String subcategoryDetail = '/subcategoryDetail';
  static const String productDetail = '/productDetail';
  static const String customDrawer = '/drawer'; // NEW: route for the custom drawer


  // Route Map
  static Map<String, Widget Function(BuildContext)> routes = {
    login: (context) => const LoginScreen(),
    home: (context) => const HomeScreen(),
    subcategoryDetail: (context) => const SubcategoryDetailScreen(),
    categoryDetailScreen: (context) => const SubcategoryDetailScreen(), // Assuming this is the same as subcategoryDetail
    productDetail: (context) => const ProductDetailScreen(), // FIXED: now points to ProductDetailScreen
    news: (context) => const NewsPage(),
    customDrawer: (context) => CustomDrawer(
      onMenuItemTap: (route) {
        Navigator.of(context).pushReplacementNamed(route);
      },
    ), // NEW: CustomDrawer route
  };

  // Route Generator
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    // Get the route builder from our routes map
    final routeBuilder = routes[settings.name];

    // If no builder is found, return a route to a default "not found" screen
    // or return null to let the app handle it
    if (routeBuilder == null) {
      return MaterialPageRoute(
        builder: (_) => Scaffold(
          body: Center(
            child: Text('Route ${settings.name} not found'),
          ),
        ),
      );
    }

    // If we have a builder, build the route
    return MaterialPageRoute(
      builder: (context) => routeBuilder(context),
      settings: settings,
    );
  }

  // Navigation Methods
  static Future<T?> navigateTo<T>(BuildContext context, String routeName, {Object? arguments}) {
    return Navigator.pushNamed<T>(context, routeName, arguments: arguments);
  }

  static Future<T?> navigateToAndReplace<T>(BuildContext context, String routeName) {
    return Navigator.pushReplacementNamed<T, dynamic>(context, routeName);
  }

  static void pop<T>(BuildContext context, [T? result]) {
    Navigator.pop<T>(context, result);
  }

  static Future<T?> navigateToAndRemoveUntil<T>(
    BuildContext context,
    String newRouteName,
    String anchorRoute,
  ) 
  
  {
    return Navigator.pushNamedAndRemoveUntil<T>(
      context,
      newRouteName,
      (route) => route.settings.name == anchorRoute,
    );
  }
}
