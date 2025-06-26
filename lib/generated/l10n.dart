// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Royal`
  String get appName {
    return Intl.message(
      'Royal',
      name: 'appName',
      desc: 'The name of the application',
      args: [],
    );
  }

  /// `Welcome`
  String get welcomeLabel {
    return Intl.message(
      'Welcome',
      name: 'welcomeLabel',
      desc: 'Welcome text in drawer',
      args: [],
    );
  }

  /// `Orders`
  String get ordersLabel {
    return Intl.message(
      'Orders',
      name: 'ordersLabel',
      desc: 'Orders menu item',
      args: [],
    );
  }

  /// `New Items`
  String get newItemsLabel {
    return Intl.message(
      'New Items',
      name: 'newItemsLabel',
      desc: 'New Items menu item',
      args: [],
    );
  }

  /// `Browsing Archive`
  String get browsingArchiveLabel {
    return Intl.message(
      'Browsing Archive',
      name: 'browsingArchiveLabel',
      desc: 'Browsing Archive menu item',
      args: [],
    );
  }

  /// `Monthly Offers`
  String get monthlyOffersLabel {
    return Intl.message(
      'Monthly Offers',
      name: 'monthlyOffersLabel',
      desc: 'Monthly Offers menu item',
      args: [],
    );
  }

  /// `News`
  String get newsLabel {
    return Intl.message(
      'News',
      name: 'newsLabel',
      desc: 'News menu item',
      args: [],
    );
  }

  /// `Certificates`
  String get certificatesLabel {
    return Intl.message(
      'Certificates',
      name: 'certificatesLabel',
      desc: 'Certificates menu item',
      args: [],
    );
  }

  /// `App Info`
  String get appInfoLabel {
    return Intl.message(
      'App Info',
      name: 'appInfoLabel',
      desc: 'App Info menu item',
      args: [],
    );
  }

  /// `Search`
  String get searchHint {
    return Intl.message(
      'Search',
      name: 'searchHint',
      desc: 'Hint text for search field',
      args: [],
    );
  }

  /// `Get your business identity free for a limited time`
  String get promotionText {
    return Intl.message(
      'Get your business identity free for a limited time',
      name: 'promotionText',
      desc: 'Promotion text shown in app bar',
      args: [],
    );
  }

  /// `Cart`
  String get cartLabel {
    return Intl.message(
      'Cart',
      name: 'cartLabel',
      desc: 'Label for shopping cart',
      args: [],
    );
  }

  /// `Notifications`
  String get notificationsLabel {
    return Intl.message(
      'Notifications',
      name: 'notificationsLabel',
      desc: 'Label for notifications',
      args: [],
    );
  }

  /// `Menu`
  String get menuLabel {
    return Intl.message(
      'Menu',
      name: 'menuLabel',
      desc: 'Label for menu button',
      args: [],
    );
  }

  /// `English`
  String get languageEnglish {
    return Intl.message(
      'English',
      name: 'languageEnglish',
      desc: 'English language option',
      args: [],
    );
  }

  /// `العربية`
  String get languageArabic {
    return Intl.message(
      'العربية',
      name: 'languageArabic',
      desc: 'Arabic language option',
      args: [],
    );
  }

  /// `Home`
  String get homeLabel {
    return Intl.message(
      'Home',
      name: 'homeLabel',
      desc: 'Label for home navigation item',
      args: [],
    );
  }

  /// `Favorites`
  String get favoritesLabel {
    return Intl.message(
      'Favorites',
      name: 'favoritesLabel',
      desc: 'Label for favorites navigation item',
      args: [],
    );
  }

  /// `Downloads`
  String get downloadsLabel {
    return Intl.message(
      'Downloads',
      name: 'downloadsLabel',
      desc: 'Label for downloads navigation item',
      args: [],
    );
  }

  /// `Information`
  String get informationLabel {
    return Intl.message(
      'Information',
      name: 'informationLabel',
      desc: 'Label for information navigation item',
      args: [],
    );
  }

  /// `Profile`
  String get profileLabel {
    return Intl.message(
      'Profile',
      name: 'profileLabel',
      desc: 'Label for profile navigation item',
      args: [],
    );
  }

  /// `Follow Us`
  String get followUsLabel {
    return Intl.message(
      'Follow Us',
      name: 'followUsLabel',
      desc: 'Label for social media section',
      args: [],
    );
  }

  /// `Bashar`
  String get nameLabel {
    return Intl.message(
      'Bashar',
      name: 'nameLabel',
      desc: 'User\'s name',
      args: [],
    );
  }

  /// `Good Morning`
  String get goodMorningLabel {
    return Intl.message(
      'Good Morning',
      name: 'goodMorningLabel',
      desc: 'Morning greeting',
      args: [],
    );
  }

  /// `Good Evening`
  String get goodEveningLabel {
    return Intl.message(
      'Good Evening',
      name: 'goodEveningLabel',
      desc: 'Evening greeting',
      args: [],
    );
  }

  /// `Furniture`
  String get furnitureLabel {
    return Intl.message(
      'Furniture',
      name: 'furnitureLabel',
      desc: 'Label for furniture category',
      args: [],
    );
  }

  /// `Sanitary Ware`
  String get sanitaryLabel {
    return Intl.message(
      'Sanitary Ware',
      name: 'sanitaryLabel',
      desc: 'Label for sanitary ware category',
      args: [],
    );
  }

  /// `Smart Energy`
  String get smartEnergyLabel {
    return Intl.message(
      'Smart Energy',
      name: 'smartEnergyLabel',
      desc: 'Label for smart energy category',
      args: [],
    );
  }

  /// `Electrical Devices`
  String get electricalLabel {
    return Intl.message(
      'Electrical Devices',
      name: 'electricalLabel',
      desc: 'Label for electrical devices category',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
