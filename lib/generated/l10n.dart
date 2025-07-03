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

  /// `Electrical Appliances`
  String get trustLabel {
    return Intl.message(
      'Electrical Appliances',
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

  /// `News`
  String get newsPageTitle {
    return Intl.message(
      'News',
      name: 'newsPageTitle',
      desc: 'Title for the news page',
      args: [],
    );
  }

  /// `Royal Industrial Trading Company hosted Mr. Mazen Zghair, Public Relations Manager, and Mr.`
  String get news1Title {
    return Intl.message(
      'Royal Industrial Trading Company hosted Mr. Mazen Zghair, Public Relations Manager, and Mr.',
      name: 'news1Title',
      desc: 'Title for the first news item on the news page',
      args: [],
    );
  }

  /// `Royal Industrial Trading Company hosted Mr. Mazen Zghair, Public Relations Manager, and Mr.`
  String get news2Title {
    return Intl.message(
      'Royal Industrial Trading Company hosted Mr. Mazen Zghair, Public Relations Manager, and Mr.',
      name: 'news2Title',
      desc: 'Title for the second news item on the news page',
      args: [],
    );
  }

  /// `Royal Industrial Trading Company hosted Mr. Mazen Zghair, Public Relations Manager, and Mr.`
  String get news3Title {
    return Intl.message(
      'Royal Industrial Trading Company hosted Mr. Mazen Zghair, Public Relations Manager, and Mr.',
      name: 'news3Title',
      desc: 'Title for the third news item on the news page',
      args: [],
    );
  }

  /// `Royal hosts a delegation from the Civil Defense Directorate`
  String get news1Subtitle {
    return Intl.message(
      'Royal hosts a delegation from the Civil Defense Directorate',
      name: 'news1Subtitle',
      desc: '',
      args: [],
    );
  }

  /// `Royal hosts a delegation from the Civil Defense Directorate`
  String get news2Subtitle {
    return Intl.message(
      'Royal hosts a delegation from the Civil Defense Directorate',
      name: 'news2Subtitle',
      desc: '',
      args: [],
    );
  }

  /// `Royal hosts a delegation from the Civil Defense Directorate`
  String get news3Subtitle {
    return Intl.message(
      'Royal hosts a delegation from the Civil Defense Directorate',
      name: 'news3Subtitle',
      desc: '',
      args: [],
    );
  }

  /// `Royal Industrial Trading Company hosted Mr. Mazen Zghair, Public Relations Manager, and Mr. Ghassan Ghaith, HR Manager...\n\nThis visit included a meeting with the company's management, during which the Civil Defense Shield was presented in appreciation of the company's efforts in supporting the Civil Defense. The company management thanked the Civil Defense for their efforts.`
  String get news1Content {
    return Intl.message(
      'Royal Industrial Trading Company hosted Mr. Mazen Zghair, Public Relations Manager, and Mr. Ghassan Ghaith, HR Manager...\n\nThis visit included a meeting with the company\'s management, during which the Civil Defense Shield was presented in appreciation of the company\'s efforts in supporting the Civil Defense. The company management thanked the Civil Defense for their efforts.',
      name: 'news1Content',
      desc: '',
      args: [],
    );
  }

  /// `Royal Industrial Trading Company hosted Mr. Mazen Zghair, Public Relations Manager, and Mr. Ghassan Ghaith, HR Manager...\n\nThis visit included a meeting with the company's management, during which the Civil Defense Shield was presented in appreciation of the company's efforts in supporting the Civil Defense. The company management thanked the Civil Defense for their efforts.`
  String get news2Content {
    return Intl.message(
      'Royal Industrial Trading Company hosted Mr. Mazen Zghair, Public Relations Manager, and Mr. Ghassan Ghaith, HR Manager...\n\nThis visit included a meeting with the company\'s management, during which the Civil Defense Shield was presented in appreciation of the company\'s efforts in supporting the Civil Defense. The company management thanked the Civil Defense for their efforts.',
      name: 'news2Content',
      desc: '',
      args: [],
    );
  }

  /// `Royal Industrial Trading Company hosted Mr. Mazen Zghair, Public Relations Manager, and Mr. Ghassan Ghaith, HR Manager...\n\nThis visit included a meeting with the company's management, during which the Civil Defense Shield was presented in appreciation of the company's efforts in supporting the Civil Defense. The company management thanked the Civil Defense for their efforts.`
  String get news3Content {
    return Intl.message(
      'Royal Industrial Trading Company hosted Mr. Mazen Zghair, Public Relations Manager, and Mr. Ghassan Ghaith, HR Manager...\n\nThis visit included a meeting with the company\'s management, during which the Civil Defense Shield was presented in appreciation of the company\'s efforts in supporting the Civil Defense. The company management thanked the Civil Defense for their efforts.',
      name: 'news3Content',
      desc: '',
      args: [],
    );
  }

  /// `News`
  String get newsTitle {
    return Intl.message(
      'News',
      name: 'newsTitle',
      desc: 'Title for the news section or page',
      args: [],
    );
  }

  /// `Previous News`
  String get previousNews {
    return Intl.message(
      'Previous News',
      name: 'previousNews',
      desc: 'Label for previous news button in details page',
      args: [],
    );
  }

  /// `Next News`
  String get nextNews {
    return Intl.message(
      'Next News',
      name: 'nextNews',
      desc: 'Label for next news button in details page',
      args: [],
    );
  }

  /// `Kitchen Sink`
  String get itemKitchenSinkTitle {
    return Intl.message(
      'Kitchen Sink',
      name: 'itemKitchenSinkTitle',
      desc: '',
      args: [],
    );
  }

  /// `71-8533`
  String get itemKitchenSinkCode {
    return Intl.message(
      '71-8533',
      name: 'itemKitchenSinkCode',
      desc: '',
      args: [],
    );
  }

  /// `Box = 12 pieces`
  String get itemKitchenSinkUnitDetails {
    return Intl.message(
      'Box = 12 pieces',
      name: 'itemKitchenSinkUnitDetails',
      desc: '',
      args: [],
    );
  }

  /// `CTN`
  String get itemKitchenSinkUnitCTN {
    return Intl.message(
      'CTN',
      name: 'itemKitchenSinkUnitCTN',
      desc: '',
      args: [],
    );
  }

  /// `PACK`
  String get itemKitchenSinkUnitPACK {
    return Intl.message(
      'PACK',
      name: 'itemKitchenSinkUnitPACK',
      desc: '',
      args: [],
    );
  }

  /// `#5022201`
  String get itemOrderNumber {
    return Intl.message(
      '#5022201',
      name: 'itemOrderNumber',
      desc: '',
      args: [],
    );
  }

  /// `Order`
  String get itemOrderTitle {
    return Intl.message('Order', name: 'itemOrderTitle', desc: '', args: []);
  }

  /// `Save`
  String get itemSave {
    return Intl.message('Save', name: 'itemSave', desc: '', args: []);
  }

  /// `Current Orders`
  String get ordersCurrent {
    return Intl.message(
      'Current Orders',
      name: 'ordersCurrent',
      desc: '',
      args: [],
    );
  }

  /// `Order Archive`
  String get ordersArchive {
    return Intl.message(
      'Order Archive',
      name: 'ordersArchive',
      desc: '',
      args: [],
    );
  }

  /// `Order Date`
  String get orderDate {
    return Intl.message('Order Date', name: 'orderDate', desc: '', args: []);
  }

  /// `Order Number`
  String get orderNumber {
    return Intl.message(
      'Order Number',
      name: 'orderNumber',
      desc: '',
      args: [],
    );
  }

  /// `Items Count`
  String get orderItems {
    return Intl.message('Items Count', name: 'orderItems', desc: '', args: []);
  }

  /// `Edit`
  String get orderEdit {
    return Intl.message('Edit', name: 'orderEdit', desc: '', args: []);
  }

  /// `Delete`
  String get orderDelete {
    return Intl.message('Delete', name: 'orderDelete', desc: '', args: []);
  }

  /// `Order Details`
  String get orderDetails {
    return Intl.message(
      'Order Details',
      name: 'orderDetails',
      desc: '',
      args: [],
    );
  }

  /// `Order Status`
  String get orderStatus {
    return Intl.message(
      'Order Status',
      name: 'orderStatus',
      desc: '',
      args: [],
    );
  }

  /// `Ready`
  String get orderReady {
    return Intl.message('Ready', name: 'orderReady', desc: '', args: []);
  }

  /// `Cancelled`
  String get orderCancelled {
    return Intl.message(
      'Cancelled',
      name: 'orderCancelled',
      desc: '',
      args: [],
    );
  }

  /// `Preparing`
  String get orderPreparing {
    return Intl.message(
      'Preparing',
      name: 'orderPreparing',
      desc: '',
      args: [],
    );
  }

  /// `8 items`
  String get orderItemsSample {
    return Intl.message(
      '8 items',
      name: 'orderItemsSample',
      desc: '',
      args: [],
    );
  }

  /// `#5022201`
  String get orderNumberSample {
    return Intl.message(
      '#5022201',
      name: 'orderNumberSample',
      desc: '',
      args: [],
    );
  }

  /// `12/12/2022`
  String get orderDateSample {
    return Intl.message(
      '12/12/2022',
      name: 'orderDateSample',
      desc: '',
      args: [],
    );
  }

  /// `Complete Order`
  String get completeOrderButton {
    return Intl.message(
      'Complete Order',
      name: 'completeOrderButton',
      desc: 'Button text for completing the order in the cart screen',
      args: [],
    );
  }

  /// `Water Tank`
  String get browsingHistoryProductTitle {
    return Intl.message(
      'Water Tank',
      name: 'browsingHistoryProductTitle',
      desc: 'Title for a product card in the browsing history page',
      args: [],
    );
  }

  /// `Search`
  String get searchTitle {
    return Intl.message(
      'Search',
      name: 'searchTitle',
      desc: 'Title for the search screen',
      args: [],
    );
  }

  /// `Search by item name or code`
  String get searchHintDetails {
    return Intl.message(
      'Search by item name or code',
      name: 'searchHintDetails',
      desc: 'Hint for the search details field',
      args: [],
    );
  }

  /// `Quantity:`
  String get quantityLabel {
    return Intl.message(
      'Quantity:',
      name: 'quantityLabel',
      desc: 'Label for quantity selector',
      args: [],
    );
  }

  /// `Confirm`
  String get confirmLabel {
    return Intl.message(
      'Confirm',
      name: 'confirmLabel',
      desc: 'Confirm button label',
      args: [],
    );
  }

  /// `Cancel`
  String get cancelLabel {
    return Intl.message(
      'Cancel',
      name: 'cancelLabel',
      desc: 'Cancel button label',
      args: [],
    );
  }

  /// `Added to cart`
  String get addedToCartLabel {
    return Intl.message(
      'Added to cart',
      name: 'addedToCartLabel',
      desc: 'Label for item added to cart',
      args: [],
    );
  }

  /// `Add to cart`
  String get addToCartLabel {
    return Intl.message(
      'Add to cart',
      name: 'addToCartLabel',
      desc: 'Add to cart button label',
      args: [],
    );
  }

  /// `Add to favorites`
  String get addToFavoritesLabel {
    return Intl.message(
      'Add to favorites',
      name: 'addToFavoritesLabel',
      desc: 'Add to favorites button label',
      args: [],
    );
  }

  /// `1000L Tank`
  String get tankTitle {
    return Intl.message(
      '1000L Tank',
      name: 'tankTitle',
      desc: 'Title for 1000L tank',
      args: [],
    );
  }

  /// `Water Tanks > One Layer Tanks`
  String get tankDesc {
    return Intl.message(
      'Water Tanks > One Layer Tanks',
      name: 'tankDesc',
      desc: 'Description for 1000L tank',
      args: [],
    );
  }

  /// `About Royal`
  String get aboutRoyalLabel {
    return Intl.message(
      'About Royal',
      name: 'aboutRoyalLabel',
      desc: '',
      args: [],
    );
  }

  /// `Jobs`
  String get jobsLabel {
    return Intl.message('Jobs', name: 'jobsLabel', desc: '', args: []);
  }

  /// `Privacy Policy`
  String get privacyPolicyLabel {
    return Intl.message(
      'Privacy Policy',
      name: 'privacyPolicyLabel',
      desc: '',
      args: [],
    );
  }

  /// `Version {version}`
  String versionLabel(Object version) {
    return Intl.message(
      'Version $version',
      name: 'versionLabel',
      desc: 'Label for app version with version number',
      args: [version],
    );
  }

  /// `Made in Palestine`
  String get madeInPalestine {
    return Intl.message(
      'Made in Palestine',
      name: 'madeInPalestine',
      desc: '',
      args: [],
    );
  }

  /// `Royal Co 2022.`
  String get royalCo2022 {
    return Intl.message(
      'Royal Co 2022.',
      name: 'royalCo2022',
      desc: '',
      args: [],
    );
  }

  /// `Notification Center`
  String get notificationCenterTitle {
    return Intl.message(
      'Notification Center',
      name: 'notificationCenterTitle',
      desc: '',
      args: [],
    );
  }

  /// `New Category`
  String get notificationNewCategory {
    return Intl.message(
      'New Category',
      name: 'notificationNewCategory',
      desc: '',
      args: [],
    );
  }

  /// `A category or group of categories has been added`
  String get notificationNewCategoryMsg {
    return Intl.message(
      'A category or group of categories has been added',
      name: 'notificationNewCategoryMsg',
      desc: '',
      args: [],
    );
  }

  /// `Update`
  String get notificationUpdate {
    return Intl.message(
      'Update',
      name: 'notificationUpdate',
      desc: '',
      args: [],
    );
  }

  /// `A catalog has been added to the downloads list`
  String get notificationUpdateMsg {
    return Intl.message(
      'A catalog has been added to the downloads list',
      name: 'notificationUpdateMsg',
      desc: '',
      args: [],
    );
  }

  /// `Event`
  String get notificationEvent {
    return Intl.message('Event', name: 'notificationEvent', desc: '', args: []);
  }

  /// `Visit us at the construction business event`
  String get notificationEventMsg {
    return Intl.message(
      'Visit us at the construction business event',
      name: 'notificationEventMsg',
      desc: '',
      args: [],
    );
  }

  /// `Why Join Royal?`
  String get whyJoinRoyalTitle {
    return Intl.message(
      'Why Join Royal?',
      name: 'whyJoinRoyalTitle',
      desc: 'Title for why join royal page',
      args: [],
    );
  }

  /// `Salujaan\n\nIf this book is good-natured, it will inspire you from the start. I do not seek to preach from behind its pages, but rather to pour out what is in my heart and mind, and I do not want your service or your praise, for I am writing to benefit myself before you from this experience. I have dedicated it to my special group of family and friends, for if they believed, they could create a better image of my nature and talents. They would find the lines I wrote in this book as a mirror of my soul and my talents. Even if I am not honest, I do not show my feelings, but I have worked to express myself and show my soul in a transparent area, so I do not know if I am in the midst of the images of ordinary nature without cost or embellishment, or if I am the one who paints myself with colors and allows myself to be painted by the customs and traditions.\n\nIt is clear in the introduction of Ibn al-Jawzi's book 'Sayd al-Khatir' that he wrote these chapters as a way to record his thoughts and reflections, which he experienced and lived through. These thoughts are not the result of deep research and study, but rather are always the result of thoughts that are born and descend quickly if not recorded. For this reason, I tried to record them in this book and called it 'Sayd al-Khatir' (Catching Thoughts), as Ibn Ahmad did months ago in the literary field and in the field of modern speech (Catching Thoughts), and this means that the concept of the chapters and what is in them are thoughts about what is said or that they are the experiences of the person himself and what he has reached from ideas related to life and society.`
  String get whyJoinRoyalContent {
    return Intl.message(
      'Salujaan\n\nIf this book is good-natured, it will inspire you from the start. I do not seek to preach from behind its pages, but rather to pour out what is in my heart and mind, and I do not want your service or your praise, for I am writing to benefit myself before you from this experience. I have dedicated it to my special group of family and friends, for if they believed, they could create a better image of my nature and talents. They would find the lines I wrote in this book as a mirror of my soul and my talents. Even if I am not honest, I do not show my feelings, but I have worked to express myself and show my soul in a transparent area, so I do not know if I am in the midst of the images of ordinary nature without cost or embellishment, or if I am the one who paints myself with colors and allows myself to be painted by the customs and traditions.\n\nIt is clear in the introduction of Ibn al-Jawzi\'s book \'Sayd al-Khatir\' that he wrote these chapters as a way to record his thoughts and reflections, which he experienced and lived through. These thoughts are not the result of deep research and study, but rather are always the result of thoughts that are born and descend quickly if not recorded. For this reason, I tried to record them in this book and called it \'Sayd al-Khatir\' (Catching Thoughts), as Ibn Ahmad did months ago in the literary field and in the field of modern speech (Catching Thoughts), and this means that the concept of the chapters and what is in them are thoughts about what is said or that they are the experiences of the person himself and what he has reached from ideas related to life and society.',
      name: 'whyJoinRoyalContent',
      desc: 'Content for why join royal page',
      args: [],
    );
  }

  /// `Join`
  String get joinButton {
    return Intl.message(
      'Join',
      name: 'joinButton',
      desc: 'Join button text for why join royal page',
      args: [],
    );
  }

  /// `Not now`
  String get notNowButton {
    return Intl.message(
      'Not now',
      name: 'notNowButton',
      desc: 'Not now button text for why join royal page',
      args: [],
    );
  }

  /// `Welcome`
  String get profileWelcome {
    return Intl.message(
      'Welcome',
      name: 'profileWelcome',
      desc: 'Welcome text on profile page',
      args: [],
    );
  }

  /// `Bashar`
  String get profileName {
    return Intl.message(
      'Bashar',
      name: 'profileName',
      desc: 'User\'s name on profile page',
      args: [],
    );
  }

  /// `Edit Profile`
  String get profileEdit {
    return Intl.message(
      'Edit Profile',
      name: 'profileEdit',
      desc: 'Edit profile button text',
      args: [],
    );
  }

  /// `Orders`
  String get profileOrders {
    return Intl.message(
      'Orders',
      name: 'profileOrders',
      desc: 'Orders menu item on profile page',
      args: [],
    );
  }

  /// `New Items`
  String get profileNewItems {
    return Intl.message(
      'New Items',
      name: 'profileNewItems',
      desc: 'New items menu item on profile page',
      args: [],
    );
  }

  /// `Browsing Archive`
  String get profileBrowsingArchive {
    return Intl.message(
      'Browsing Archive',
      name: 'profileBrowsingArchive',
      desc: 'Browsing archive menu item on profile page',
      args: [],
    );
  }

  /// `Favorites`
  String get profileFavorites {
    return Intl.message(
      'Favorites',
      name: 'profileFavorites',
      desc: 'Favorites menu item on profile page',
      args: [],
    );
  }

  /// `Logout`
  String get profileLogout {
    return Intl.message(
      'Logout',
      name: 'profileLogout',
      desc: 'Logout button text on profile page',
      args: [],
    );
  }

  /// `First Name`
  String get profileFirstName {
    return Intl.message(
      'First Name',
      name: 'profileFirstName',
      desc: 'First name field in profile edit screen',
      args: [],
    );
  }

  /// `Last Name`
  String get profileLastName {
    return Intl.message(
      'Last Name',
      name: 'profileLastName',
      desc: 'Last name field in profile edit screen',
      args: [],
    );
  }

  /// `Mobile`
  String get profileMobile {
    return Intl.message(
      'Mobile',
      name: 'profileMobile',
      desc: 'Mobile field in profile edit screen',
      args: [],
    );
  }

  /// `Phone`
  String get profilePhone {
    return Intl.message(
      'Phone',
      name: 'profilePhone',
      desc: 'Phone field in profile edit screen',
      args: [],
    );
  }

  /// `Address`
  String get profileAddress {
    return Intl.message(
      'Address',
      name: 'profileAddress',
      desc: 'Address field in profile edit screen',
      args: [],
    );
  }

  /// `Email`
  String get profileEmail {
    return Intl.message(
      'Email',
      name: 'profileEmail',
      desc: 'Email field in profile edit screen',
      args: [],
    );
  }

  /// `Password`
  String get profilePassword {
    return Intl.message(
      'Password',
      name: 'profilePassword',
      desc: 'Password field in profile edit screen',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: 'Save button in profile edit screen',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: 'Cancel button in profile edit screen',
      args: [],
    );
  }

  /// `Downloads Center`
  String get downloadsCenterTitle {
    return Intl.message(
      'Downloads Center',
      name: 'downloadsCenterTitle',
      desc: 'Title for the downloads center screen',
      args: [],
    );
  }

  /// `Furniture`
  String get downloadsCategoryFurniture {
    return Intl.message(
      'Furniture',
      name: 'downloadsCategoryFurniture',
      desc: 'Label for furniture category in downloads',
      args: [],
    );
  }

  /// `Sanitary Ware`
  String get downloadsCategorySanitary {
    return Intl.message(
      'Sanitary Ware',
      name: 'downloadsCategorySanitary',
      desc: 'Label for sanitary ware category in downloads',
      args: [],
    );
  }

  /// `All`
  String get downloadsCategoryAll {
    return Intl.message(
      'All',
      name: 'downloadsCategoryAll',
      desc: 'Label for food category in downloads',
      args: [],
    );
  }

  /// `Catalog Name`
  String get downloadsCatalogName {
    return Intl.message(
      'Catalog Name',
      name: 'downloadsCatalogName',
      desc: 'Label for catalog name in downloads grid',
      args: [],
    );
  }

  /// `Preview`
  String get downloadsPreview {
    return Intl.message(
      'Preview',
      name: 'downloadsPreview',
      desc: 'Preview button in downloads popup',
      args: [],
    );
  }

  /// `Download`
  String get downloadsDownload {
    return Intl.message(
      'Download',
      name: 'downloadsDownload',
      desc: 'Download button in downloads popup',
      args: [],
    );
  }

  /// `At Royal, your satisfaction is our goal`
  String get contactSubtitle {
    return Intl.message(
      'At Royal, your satisfaction is our goal',
      name: 'contactSubtitle',
      desc: 'Subtitle under contact us title in info screen',
      args: [],
    );
  }

  /// `FAQ`
  String get faqLabel {
    return Intl.message(
      'FAQ',
      name: 'faqLabel',
      desc: 'FAQ card label in info screen',
      args: [],
    );
  }

  /// `Support`
  String get supportLabel {
    return Intl.message(
      'Support',
      name: 'supportLabel',
      desc: 'Support card label in info screen',
      args: [],
    );
  }

  /// `Main Office`
  String get mainOfficeLabel {
    return Intl.message(
      'Main Office',
      name: 'mainOfficeLabel',
      desc: 'Main office card label in info screen',
      args: [],
    );
  }

  /// `Working Hours`
  String get workingHoursLabel {
    return Intl.message(
      'Working Hours',
      name: 'workingHoursLabel',
      desc: 'Working hours label in info screen',
      args: [],
    );
  }

  /// `Everyday except official holidays`
  String get workingDaysLabel {
    return Intl.message(
      'Everyday except official holidays',
      name: 'workingDaysLabel',
      desc: 'Working days label in info screen',
      args: [],
    );
  }

  /// `258m Haram Al-Rama, Hebron, Palestine 90000`
  String get addressLabel {
    return Intl.message(
      '258m Haram Al-Rama, Hebron, Palestine 90000',
      name: 'addressLabel',
      desc: 'Address label in info screen',
      args: [],
    );
  }

  /// `Royal`
  String get royalTitle {
    return Intl.message('Royal', name: 'royalTitle', desc: '', args: []);
  }

  /// `Your satisfaction is our goal`
  String get royalSlogan {
    return Intl.message(
      'Your satisfaction is our goal',
      name: 'royalSlogan',
      desc: '',
      args: [],
    );
  }

  /// `Contact Royal`
  String get contactRoyalLabel {
    return Intl.message(
      'Contact Royal',
      name: 'contactRoyalLabel',
      desc: '',
      args: [],
    );
  }

  /// `8:00AM - 16:00PM`
  String get workingHoursTime {
    return Intl.message(
      '8:00AM - 16:00PM',
      name: 'workingHoursTime',
      desc: '',
      args: [],
    );
  }

  /// `Daily except official holidays`
  String get workingHoursNote {
    return Intl.message(
      'Daily except official holidays',
      name: 'workingHoursNote',
      desc: '',
      args: [],
    );
  }

  /// `+970 2 2219800`
  String get phone1 {
    return Intl.message('+970 2 2219800', name: 'phone1', desc: '', args: []);
  }

  /// `+970 2 2220127`
  String get phone2 {
    return Intl.message('+970 2 2220127', name: 'phone2', desc: '', args: []);
  }

  /// `info@royal.ps`
  String get email {
    return Intl.message('info@royal.ps', name: 'email', desc: '', args: []);
  }

  /// `www.royal.ps`
  String get website {
    return Intl.message('www.royal.ps', name: 'website', desc: '', args: []);
  }

  /// `258 Bir Haram Al-Rama`
  String get addressLine1 {
    return Intl.message(
      '258 Bir Haram Al-Rama',
      name: 'addressLine1',
      desc: '',
      args: [],
    );
  }

  /// `Hebron, Palestine 90000`
  String get addressLine2 {
    return Intl.message(
      'Hebron, Palestine 90000',
      name: 'addressLine2',
      desc: '',
      args: [],
    );
  }

  /// `Contact Us`
  String get contactUsLabelMini {
    return Intl.message(
      'Contact Us',
      name: 'contactUsLabelMini',
      desc: '',
      args: [],
    );
  }

  /// `Beyond Creativity`
  String get beyondCreativity {
    return Intl.message(
      'Beyond Creativity',
      name: 'beyondCreativity',
      desc: '',
      args: [],
    );
  }

  /// `Stylish, Elegant, Innovation`
  String get beyondCreativityDesc {
    return Intl.message(
      'Stylish, Elegant, Innovation',
      name: 'beyondCreativityDesc',
      desc: '',
      args: [],
    );
  }

  /// `+970 2 2219800`
  String get contactPhone {
    return Intl.message(
      '+970 2 2219800',
      name: 'contactPhone',
      desc: 'Contact phone number for info screen',
      args: [],
    );
  }

  /// `+970 2 2220127`
  String get contactFax {
    return Intl.message(
      '+970 2 2220127',
      name: 'contactFax',
      desc: 'Contact fax number for info screen',
      args: [],
    );
  }

  /// `info@royal.ps`
  String get contactEmail {
    return Intl.message(
      'info@royal.ps',
      name: 'contactEmail',
      desc: 'Contact email for info screen',
      args: [],
    );
  }

  /// `www.royal.ps`
  String get contactWebsite {
    return Intl.message(
      'www.royal.ps',
      name: 'contactWebsite',
      desc: 'Contact website for info screen',
      args: [],
    );
  }

  /// `What are the production processes carried out in your factory?`
  String get faqProductionProcessQ {
    return Intl.message(
      'What are the production processes carried out in your factory?',
      name: 'faqProductionProcessQ',
      desc: '',
      args: [],
    );
  }

  /// `At Royal factory, we use various production processes such as rotational molding, blow molding, injection molding, and many other processes that allow us to control the quality and production time of our products.`
  String get faqProductionProcessA {
    return Intl.message(
      'At Royal factory, we use various production processes such as rotational molding, blow molding, injection molding, and many other processes that allow us to control the quality and production time of our products.',
      name: 'faqProductionProcessA',
      desc: '',
      args: [],
    );
  }

  /// `What are the working hours at the factory?`
  String get faqWorkingHoursQ {
    return Intl.message(
      'What are the working hours at the factory?',
      name: 'faqWorkingHoursQ',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get faqWorkingHoursA {
    return Intl.message('', name: 'faqWorkingHoursA', desc: '', args: []);
  }

  /// `Where is the factory located? Can I visit the factory?`
  String get faqFactoryLocationQ {
    return Intl.message(
      'Where is the factory located? Can I visit the factory?',
      name: 'faqFactoryLocationQ',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get faqFactoryLocationA {
    return Intl.message('', name: 'faqFactoryLocationA', desc: '', args: []);
  }

  /// `Do you have enough experience in manufacturing and exporting?`
  String get faqExperienceQ {
    return Intl.message(
      'Do you have enough experience in manufacturing and exporting?',
      name: 'faqExperienceQ',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get faqExperienceA {
    return Intl.message('', name: 'faqExperienceA', desc: '', args: []);
  }

  /// `Where do you mainly sell your products?`
  String get faqMainMarketQ {
    return Intl.message(
      'Where do you mainly sell your products?',
      name: 'faqMainMarketQ',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get faqMainMarketA {
    return Intl.message('', name: 'faqMainMarketA', desc: '', args: []);
  }

  /// `Here to help you`
  String get hereToHelpTitle {
    return Intl.message(
      'Here to help you',
      name: 'hereToHelpTitle',
      desc: '',
      args: [],
    );
  }

  /// `1700 900 300`
  String get supportPhone {
    return Intl.message(
      '1700 900 300',
      name: 'supportPhone',
      desc: '',
      args: [],
    );
  }

  /// `Support@royal.ps`
  String get supportEmail {
    return Intl.message(
      'Support@royal.ps',
      name: 'supportEmail',
      desc: '',
      args: [],
    );
  }

  /// `P.O Box 51841`
  String get supportPOBox {
    return Intl.message(
      'P.O Box 51841',
      name: 'supportPOBox',
      desc: '',
      args: [],
    );
  }

  /// `Jerusalem, IL 9711025`
  String get supportJerusalem {
    return Intl.message(
      'Jerusalem, IL 9711025',
      name: 'supportJerusalem',
      desc: '',
      args: [],
    );
  }

  /// `Need help?`
  String get faqNeedHelpTitle {
    return Intl.message(
      'Need help?',
      name: 'faqNeedHelpTitle',
      desc: '',
      args: [],
    );
  }

  /// `Browse the FAQ.`
  String get faqBrowseSubtitle {
    return Intl.message(
      'Browse the FAQ.',
      name: 'faqBrowseSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `99+`
  String get badge99plus {
    return Intl.message('99+', name: 'badge99plus', desc: '', args: []);
  }

  /// `Press back again to exit`
  String get pressBackAgainToExit {
    return Intl.message(
      'Press back again to exit',
      name: 'pressBackAgainToExit',
      desc: 'Shown when user presses back once on home page',
      args: [],
    );
  }

  /// `Ready`
  String get statusReady {
    return Intl.message('Ready', name: 'statusReady', desc: '', args: []);
  }

  /// `Cancelled`
  String get statusCancelled {
    return Intl.message(
      'Cancelled',
      name: 'statusCancelled',
      desc: '',
      args: [],
    );
  }

  /// `Preparing`
  String get statusPreparing {
    return Intl.message(
      'Preparing',
      name: 'statusPreparing',
      desc: '',
      args: [],
    );
  }

  /// `Bashar`
  String get profileLastNameHint {
    return Intl.message(
      'Bashar',
      name: 'profileLastNameHint',
      desc: 'Hint for last name field in profile edit screen',
      args: [],
    );
  }

  /// `Hjooj`
  String get profileFirstNameHint {
    return Intl.message(
      'Hjooj',
      name: 'profileFirstNameHint',
      desc: 'Hint for first name field in profile edit screen',
      args: [],
    );
  }

  /// `0599 123 123`
  String get profilePhoneHint {
    return Intl.message(
      '0599 123 123',
      name: 'profilePhoneHint',
      desc: 'Hint for phone field in profile edit screen',
      args: [],
    );
  }

  /// `02 22 22222`
  String get profileMobileHint {
    return Intl.message(
      '02 22 22222',
      name: 'profileMobileHint',
      desc: 'Hint for mobile field in profile edit screen',
      args: [],
    );
  }

  /// `Sample address`
  String get profileAddressHint {
    return Intl.message(
      'Sample address',
      name: 'profileAddressHint',
      desc: 'Hint for address field in profile edit screen',
      args: [],
    );
  }

  /// `Bashar@royal.ps`
  String get profileEmailHint {
    return Intl.message(
      'Bashar@royal.ps',
      name: 'profileEmailHint',
      desc: 'Hint for email field in profile edit screen',
      args: [],
    );
  }

  /// `**********`
  String get profilePasswordHint {
    return Intl.message(
      '**********',
      name: 'profilePasswordHint',
      desc: 'Hint for password field in profile edit screen',
      args: [],
    );
  }

  /// `Package`
  String get packageLabel {
    return Intl.message(
      'Package',
      name: 'packageLabel',
      desc: 'Label for package unit selector',
      args: [],
    );
  }

  /// `Pieces`
  String get piecesLabel {
    return Intl.message(
      'Pieces',
      name: 'piecesLabel',
      desc: 'Label for pieces unit selector',
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
