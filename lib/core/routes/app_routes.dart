import 'package:flutter/material.dart';
import 'package:royal/screens/home/home_screen.dart';
import 'package:royal/screens/auth/login_screen.dart';
import 'package:royal/screens/categories/subcategory_detail_screen.dart';
import 'package:royal/screens/categories/product_detail_screen.dart'; // Import the ProductDetailScreen
import 'package:royal/screens/news/news_page.dart'; // Import the NewsPage
import 'package:royal/widgets/custom_drawer.dart'; // Import the CustomDrawer
import 'package:royal/screens/orders/order_screen.dart'; // Import the OrderScreen
import 'package:royal/screens/orders/order_details_page.dart'; // Import the OrderDetailsPage
import 'package:royal/screens/cart/cart_screen.dart'; // Import the CartScreen
import 'package:royal/screens/browsing%20history/browsing_history_page.dart'; // Import BrowsingHistoryPage
import 'package:royal/screens/New items/new_items.dart'; // Import NewItemsPage
import 'package:royal/screens/favorite/favorite_page.dart'; // Import the FavoritePage
import 'package:royal/screens/search/search_screen.dart'; // Import the SearchScreen
import 'package:royal/screens/about%20app/about_app_page.dart'; // Import AboutAppPage
import 'package:royal/screens/notifications/notification_center_page.dart'; // Import NotificationCenterPage
import 'package:royal/screens/why%20Royal/why_join_royal_page.dart'; // Import WhyJoinRoyalPage
import 'package:royal/screens/profile_screen.dart'; // Import ProfileScreen


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
  static const String orderDetails = '/orderDetails'; // NEW: route for order details
  static const String cart = '/cart'; // Added cart route
  static const String favorite = '/favorite'; // Added favorite route
  static const String search = '/search'; // Added search route
  static const String aboutApp = '/about-app'; // Added about app route
  static const String notificationCenter = '/notification-center'; // Added notification center route
  static const String whyJoinRoyal = '/why-join-royal'; // Add route constant
  static const String profile = '/profile'; // Added profile route


  // Route Map
  static Map<String, Widget Function(BuildContext)> routes = {
    login: (context) => const LoginScreen(),
    home: (context) => const HomeScreen(),
    subcategoryDetail: (context) => const SubcategoryDetailScreen(),
    categoryDetailScreen: (context) => const SubcategoryDetailScreen(), // Assuming this is the same as subcategoryDetail
    productDetail: (context) => const ProductDetailScreen(), // FIXED: now points to ProductDetailScreen
    news: (context) => const NewsPage(),
    orders: (context) => const OrderScreen(), // Added orders route
    customDrawer: (context) => CustomDrawer(
      onMenuItemTap: (route) {
        Navigator.of(context).pushReplacementNamed(route);
      },
    ), // NEW: CustomDrawer route
    orderDetails: (context) => const OrderDetailsPage(), // NEW: OrderDetailsPage route
    cart: (context) => const CartScreen(), // Added cart screen route
    history: (context) => const BrowsingHistoryPage(), // Added history route
    newItems: (context) => const NewItemsPage(), // Added new items route
    favorite: (context) => const FavoritePage(), // Added favorite page route
    search: (context) => const SearchScreen(), // Added search screen route
    aboutApp: (context) => const AboutAppPage(), // Added about app page route
    notificationCenter: (context) => const NotificationCenterPage(), // Added notification center route
    whyJoinRoyal: (context) => const WhyJoinRoyalPage(), // Add route to map
    profile: (context) => const ProfileScreen(), // Added profile screen route
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
