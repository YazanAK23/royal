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

  /// `Contact Us`
  String get contactUsLabel {
    return Intl.message(
      'Contact Us',
      name: 'contactUsLabel',
      desc: '',
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
  String get energyLabel {
    return Intl.message(
      'Smart Energy',
      name: 'energyLabel',
      desc: 'Label for smart energy category',
      args: [],
    );
  }

  /// `Trust`
  String get trustLabel {
    return Intl.message(
      'Trust',
      name: 'trustLabel',
      desc: 'Label for trust category',
      args: [],
    );
  }

  /// `Welcome Back`
  String get loginWelcome {
    return Intl.message(
      'Welcome Back',
      name: 'loginWelcome',
      desc: 'Welcome text on login page',
      args: [],
    );
  }

  /// `Email / ID`
  String get emailIdLabel {
    return Intl.message(
      'Email / ID',
      name: 'emailIdLabel',
      desc: 'Label for email/ID field',
      args: [],
    );
  }

  /// `Enter your email or ID`
  String get emailIdHint {
    return Intl.message(
      'Enter your email or ID',
      name: 'emailIdHint',
      desc: 'Hint text for email/ID field',
      args: [],
    );
  }

  /// `Password`
  String get passwordLabel {
    return Intl.message(
      'Password',
      name: 'passwordLabel',
      desc: 'Label for password field',
      args: [],
    );
  }

  /// `Enter your password`
  String get passwordHint {
    return Intl.message(
      'Enter your password',
      name: 'passwordHint',
      desc: 'Hint text for password field',
      args: [],
    );
  }

  /// `Remember me`
  String get rememberMe {
    return Intl.message(
      'Remember me',
      name: 'rememberMe',
      desc: 'Remember me checkbox label',
      args: [],
    );
  }

  /// `Forgot Password?`
  String get forgotPassword {
    return Intl.message(
      'Forgot Password?',
      name: 'forgotPassword',
      desc: 'Forgot password link text',
      args: [],
    );
  }

  /// `Login`
  String get loginButton {
    return Intl.message(
      'Login',
      name: 'loginButton',
      desc: 'Login button text',
      args: [],
    );
  }

  /// `Don't have an account?`
  String get noAccount {
    return Intl.message(
      'Don\'t have an account?',
      name: 'noAccount',
      desc: 'Text shown before register link',
      args: [],
    );
  }

  /// `Register Now`
  String get registerNow {
    return Intl.message(
      'Register Now',
      name: 'registerNow',
      desc: 'Register link text',
      args: [],
    );
  }

  /// `Please enter your email or ID`
  String get emailRequired {
    return Intl.message(
      'Please enter your email or ID',
      name: 'emailRequired',
      desc: 'Email required validation message',
      args: [],
    );
  }

  /// `Please enter your password`
  String get passwordRequired {
    return Intl.message(
      'Please enter your password',
      name: 'passwordRequired',
      desc: 'Password required validation message',
      args: [],
    );
  }

  /// `Continue as Guest`
  String get continueAsGuest {
    return Intl.message(
      'Continue as Guest',
      name: 'continueAsGuest',
      desc: 'Text for the guest login option',
      args: [],
    );
  }

  /// `Why Royal?`
  String get whyRoyal {
    return Intl.message(
      'Why Royal?',
      name: 'whyRoyal',
      desc: 'Text for why royal question',
      args: [],
    );
  }

  /// `Sanitary Ware`
  String get sanitaryTitle {
    return Intl.message(
      'Sanitary Ware',
      name: 'sanitaryTitle',
      desc: 'Title for sanitary page',
      args: [],
    );
  }

  /// `Sanitary Ware`
  String get sanitaryWareTitle {
    return Intl.message(
      'Sanitary Ware',
      name: 'sanitaryWareTitle',
      desc: 'Title for sanitary ware category page',
      args: [],
    );
  }

  /// `Water Tanks`
  String get waterTanks {
    return Intl.message(
      'Water Tanks',
      name: 'waterTanks',
      desc: 'Water tanks subcategory',
      args: [],
    );
  }

  /// `Manholes`
  String get manholes {
    return Intl.message(
      'Manholes',
      name: 'manholes',
      desc: 'Manholes subcategory',
      args: [],
    );
  }

  /// `Plastic Pipes`
  String get plasticPipes {
    return Intl.message(
      'Plastic Pipes',
      name: 'plasticPipes',
      desc: 'Plastic pipes subcategory',
      args: [],
    );
  }

  /// `Plastic Surfaces`
  String get plasticSurfaces {
    return Intl.message(
      'Plastic Surfaces',
      name: 'plasticSurfaces',
      desc: 'Plastic surfaces subcategory',
      args: [],
    );
  }

  /// `Assembly Parts`
  String get assemblyParts {
    return Intl.message(
      'Assembly Parts',
      name: 'assemblyParts',
      desc: 'Assembly parts subcategory',
      args: [],
    );
  }

  /// `Building Supplies`
  String get buildingSupplies {
    return Intl.message(
      'Building Supplies',
      name: 'buildingSupplies',
      desc: 'Building supplies subcategory',
      args: [],
    );
  }

  /// `Plastic Parts`
  String get plasticParts {
    return Intl.message(
      'Plastic Parts',
      name: 'plasticParts',
      desc: 'Plastic parts subcategory',
      args: [],
    );
  }

  /// `Collection Boxes`
  String get collectionBoxes {
    return Intl.message(
      'Collection Boxes',
      name: 'collectionBoxes',
      desc: 'Collection boxes subcategory',
      args: [],
    );
  }

  /// `No content yet`
  String get noContentYet {
    return Intl.message(
      'No content yet',
      name: 'noContentYet',
      desc: 'Placeholder text for empty category details',
      args: [],
    );
  }

  /// `One Layer Tanks`
  String get oneLayerTanks {
    return Intl.message(
      'One Layer Tanks',
      name: 'oneLayerTanks',
      desc: 'One layer tanks subcategory',
      args: [],
    );
  }

  /// `Two Layer Tanks`
  String get twoLayerTanks {
    return Intl.message(
      'Two Layer Tanks',
      name: 'twoLayerTanks',
      desc: 'Two layer tanks subcategory',
      args: [],
    );
  }

  /// `Three Layer Tanks`
  String get threeLayerTanks {
    return Intl.message(
      'Three Layer Tanks',
      name: 'threeLayerTanks',
      desc: 'Three layer tanks subcategory',
      args: [],
    );
  }

  /// `Four Layer Tanks`
  String get fourLayerTanks {
    return Intl.message(
      'Four Layer Tanks',
      name: 'fourLayerTanks',
      desc: 'Four layer tanks subcategory',
      args: [],
    );
  }

  /// `Medical Tanks`
  String get medicalTanks {
    return Intl.message(
      'Medical Tanks',
      name: 'medicalTanks',
      desc: 'Medical tanks subcategory',
      args: [],
    );
  }

  /// `GRP Tanks`
  String get grpTanks {
    return Intl.message(
      'GRP Tanks',
      name: 'grpTanks',
      desc: 'GRP tanks subcategory',
      args: [],
    );
  }

  /// `Water Tanks`
  String get waterTanksCategoryTitle {
    return Intl.message(
      'Water Tanks',
      name: 'waterTanksCategoryTitle',
      desc: 'Title for water tanks category used in CategoryDetailScreen',
      args: [],
    );
  }

  /// `300 Litre`
  String get tank300L {
    return Intl.message('300 Litre', name: 'tank300L', desc: '', args: []);
  }

  /// `300 Litre Long`
  String get tank300LLong {
    return Intl.message(
      '300 Litre Long',
      name: 'tank300LLong',
      desc: '',
      args: [],
    );
  }

  /// `100 Litre`
  String get tank100L {
    return Intl.message('100 Litre', name: 'tank100L', desc: '', args: []);
  }

  /// `150 Litre`
  String get tank150L {
    return Intl.message('150 Litre', name: 'tank150L', desc: '', args: []);
  }

  /// `250 Litre`
  String get tank250L {
    return Intl.message('250 Litre', name: 'tank250L', desc: '', args: []);
  }

  /// `500 Litre`
  String get tank500L {
    return Intl.message('500 Litre', name: 'tank500L', desc: '', args: []);
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
