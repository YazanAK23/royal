import 'package:flutter/material.dart';
import 'package:royal/screens/home/home_screen.dart';
import 'package:royal/screens/auth/login_screen.dart';

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

  // Route Map
  static Map<String, Widget Function(BuildContext)> routes = {
    login: (context) => const LoginScreen(),
    home: (context) => const HomeScreen(),

  };

  // Navigation Methods
  static Future<T?> navigateTo<T>(BuildContext context, String routeName) {
    return Navigator.pushNamed<T>(context, routeName);
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
  ) {
    return Navigator.pushNamedAndRemoveUntil<T>(
      context,
      newRouteName,
      (route) => route.settings.name == anchorRoute,
    );
  }

  // Route Generator
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    // You can add logic here to handle dynamic routes or route parameters
    return MaterialPageRoute(
      builder: (context) => routes[settings.name]!(context),
      settings: settings,
    );
  }
}
