import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:royal/generated/l10n.dart';
import 'package:royal/screens/home/home_screen.dart';
import 'core/theme/app_theme.dart';
import 'core/routes/app_routes.dart';
import 'core/providers/locale_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = ref.watch(localeProvider);

    return MaterialApp(
      title: 'Royal',

      routes: {
        '/': (ctx) => const HomeScreen(),      
        ...AppRoutes.routes,                   
      },

      // 2) Keep login as the initial route
      initialRoute: AppRoutes.login,

      // 3) Fallback for any routes not in `routes`
      onGenerateRoute: AppRoutes.onGenerateRoute,

      theme: AppTheme.lightTheme(),
      locale: locale,
      supportedLocales: const [
        Locale('ar'), // Arabic
        Locale('en'), // English
      ],
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],

      debugShowCheckedModeBanner: false,
    );
  }
}
