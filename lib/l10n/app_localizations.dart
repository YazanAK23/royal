import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('ar')
  ];

  /// The name of the application
  ///
  /// In en, this message translates to:
  /// **'Royal'**
  String get appName;

  /// Welcome text in drawer
  ///
  /// In en, this message translates to:
  /// **'Welcome'**
  String get welcomeLabel;

  /// Orders menu item
  ///
  /// In en, this message translates to:
  /// **'Orders'**
  String get ordersLabel;

  /// New Items menu item
  ///
  /// In en, this message translates to:
  /// **'New Items'**
  String get newItemsLabel;

  /// Browsing Archive menu item
  ///
  /// In en, this message translates to:
  /// **'Browsing Archive'**
  String get browsingArchiveLabel;

  /// Monthly Offers menu item
  ///
  /// In en, this message translates to:
  /// **'Monthly Offers'**
  String get monthlyOffersLabel;

  /// News menu item
  ///
  /// In en, this message translates to:
  /// **'News'**
  String get newsLabel;

  /// Certificates menu item
  ///
  /// In en, this message translates to:
  /// **'Certificates'**
  String get certificatesLabel;

  /// App Info menu item
  ///
  /// In en, this message translates to:
  /// **'App Info'**
  String get appInfoLabel;

  /// Hint text for search field
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get searchHint;

  /// Promotion text shown in app bar
  ///
  /// In en, this message translates to:
  /// **'Get your business identity free for a limited time'**
  String get promotionText;

  /// Label for shopping cart
  ///
  /// In en, this message translates to:
  /// **'Cart'**
  String get cartLabel;

  /// Label for notifications
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notificationsLabel;

  /// Label for menu button
  ///
  /// In en, this message translates to:
  /// **'Menu'**
  String get menuLabel;

  /// English language option
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get languageEnglish;

  /// Arabic language option
  ///
  /// In en, this message translates to:
  /// **'العربية'**
  String get languageArabic;

  /// Label for home navigation item
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get homeLabel;

  /// Label for favorites navigation item
  ///
  /// In en, this message translates to:
  /// **'Favorites'**
  String get favoritesLabel;

  /// Label for downloads navigation item
  ///
  /// In en, this message translates to:
  /// **'Downloads'**
  String get downloadsLabel;

  /// Label for information navigation item
  ///
  /// In en, this message translates to:
  /// **'Information'**
  String get informationLabel;

  /// Label for profile navigation item
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profileLabel;

  /// Label for social media section
  ///
  /// In en, this message translates to:
  /// **'Follow Us'**
  String get followUsLabel;

  /// No description provided for @contactUsLabel.
  ///
  /// In en, this message translates to:
  /// **'Contact Us'**
  String get contactUsLabel;

  /// User's name
  ///
  /// In en, this message translates to:
  /// **'Bashar'**
  String get nameLabel;

  /// Morning greeting
  ///
  /// In en, this message translates to:
  /// **'Good Morning'**
  String get goodMorningLabel;

  /// Evening greeting
  ///
  /// In en, this message translates to:
  /// **'Good Evening'**
  String get goodEveningLabel;

  /// Label for furniture category
  ///
  /// In en, this message translates to:
  /// **'Furniture'**
  String get furnitureLabel;

  /// Label for sanitary ware category
  ///
  /// In en, this message translates to:
  /// **'Sanitary Ware'**
  String get sanitaryLabel;

  /// Label for smart energy category
  ///
  /// In en, this message translates to:
  /// **'Smart Energy'**
  String get energyLabel;

  /// Label for trust category
  ///
  /// In en, this message translates to:
  /// **'Electrical Appliances'**
  String get trustLabel;

  /// Welcome text on login page
  ///
  /// In en, this message translates to:
  /// **'Welcome Back'**
  String get loginWelcome;

  /// Label for email/ID field
  ///
  /// In en, this message translates to:
  /// **'Email / ID'**
  String get emailIdLabel;

  /// Hint text for email/ID field
  ///
  /// In en, this message translates to:
  /// **'Enter your email or ID'**
  String get emailIdHint;

  /// Label for password field
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get passwordLabel;

  /// Hint text for password field
  ///
  /// In en, this message translates to:
  /// **'Enter your password'**
  String get passwordHint;

  /// Remember me checkbox label
  ///
  /// In en, this message translates to:
  /// **'Remember me'**
  String get rememberMe;

  /// Forgot password link text
  ///
  /// In en, this message translates to:
  /// **'Forgot Password?'**
  String get forgotPassword;

  /// Login button text
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get loginButton;

  /// Text shown before register link
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account?'**
  String get noAccount;

  /// Register link text
  ///
  /// In en, this message translates to:
  /// **'Register Now'**
  String get registerNow;

  /// Email required validation message
  ///
  /// In en, this message translates to:
  /// **'Please enter your email or ID'**
  String get emailRequired;

  /// Password required validation message
  ///
  /// In en, this message translates to:
  /// **'Please enter your password'**
  String get passwordRequired;

  /// Text for the guest login option
  ///
  /// In en, this message translates to:
  /// **'Continue as Guest'**
  String get continueAsGuest;

  /// Text for why royal question
  ///
  /// In en, this message translates to:
  /// **'Why Royal?'**
  String get whyRoyal;

  /// Title for sanitary page
  ///
  /// In en, this message translates to:
  /// **'Sanitary Ware'**
  String get sanitaryTitle;

  /// Title for sanitary ware category page
  ///
  /// In en, this message translates to:
  /// **'Sanitary Ware'**
  String get sanitaryWareTitle;

  /// Water tanks subcategory
  ///
  /// In en, this message translates to:
  /// **'Water Tanks'**
  String get waterTanks;

  /// Manholes subcategory
  ///
  /// In en, this message translates to:
  /// **'Manholes'**
  String get manholes;

  /// Plastic pipes subcategory
  ///
  /// In en, this message translates to:
  /// **'Plastic Pipes'**
  String get plasticPipes;

  /// Plastic surfaces subcategory
  ///
  /// In en, this message translates to:
  /// **'Plastic Surfaces'**
  String get plasticSurfaces;

  /// Assembly parts subcategory
  ///
  /// In en, this message translates to:
  /// **'Assembly Parts'**
  String get assemblyParts;

  /// Building supplies subcategory
  ///
  /// In en, this message translates to:
  /// **'Building Supplies'**
  String get buildingSupplies;

  /// Plastic parts subcategory
  ///
  /// In en, this message translates to:
  /// **'Plastic Parts'**
  String get plasticParts;

  /// Collection boxes subcategory
  ///
  /// In en, this message translates to:
  /// **'Collection Boxes'**
  String get collectionBoxes;

  /// Placeholder text for empty category details
  ///
  /// In en, this message translates to:
  /// **'No content yet'**
  String get noContentYet;

  /// One layer tanks subcategory
  ///
  /// In en, this message translates to:
  /// **'One Layer Tanks'**
  String get oneLayerTanks;

  /// Two layer tanks subcategory
  ///
  /// In en, this message translates to:
  /// **'Two Layer Tanks'**
  String get twoLayerTanks;

  /// Three layer tanks subcategory
  ///
  /// In en, this message translates to:
  /// **'Three Layer Tanks'**
  String get threeLayerTanks;

  /// Four layer tanks subcategory
  ///
  /// In en, this message translates to:
  /// **'Four Layer Tanks'**
  String get fourLayerTanks;

  /// Medical tanks subcategory
  ///
  /// In en, this message translates to:
  /// **'Medical Tanks'**
  String get medicalTanks;

  /// GRP tanks subcategory
  ///
  /// In en, this message translates to:
  /// **'GRP Tanks'**
  String get grpTanks;

  /// Title for water tanks category used in CategoryDetailScreen
  ///
  /// In en, this message translates to:
  /// **'Water Tanks'**
  String get waterTanksCategoryTitle;

  /// No description provided for @tank300L.
  ///
  /// In en, this message translates to:
  /// **'300 Litre'**
  String get tank300L;

  /// No description provided for @tank300LLong.
  ///
  /// In en, this message translates to:
  /// **'300 Litre Long'**
  String get tank300LLong;

  /// No description provided for @tank100L.
  ///
  /// In en, this message translates to:
  /// **'100 Litre'**
  String get tank100L;

  /// No description provided for @tank150L.
  ///
  /// In en, this message translates to:
  /// **'150 Litre'**
  String get tank150L;

  /// No description provided for @tank250L.
  ///
  /// In en, this message translates to:
  /// **'250 Litre'**
  String get tank250L;

  /// No description provided for @tank500L.
  ///
  /// In en, this message translates to:
  /// **'500 Litre'**
  String get tank500L;

  /// Title for the news page
  ///
  /// In en, this message translates to:
  /// **'News'**
  String get newsPageTitle;

  /// Title for the first news item on the news page
  ///
  /// In en, this message translates to:
  /// **'Royal Industrial Trading Company hosted Mr. Mazen Zghair, Public Relations Manager, and Mr.'**
  String get news1Title;

  /// Title for the second news item on the news page
  ///
  /// In en, this message translates to:
  /// **'Royal Industrial Trading Company hosted Mr. Mazen Zghair, Public Relations Manager, and Mr.'**
  String get news2Title;

  /// Title for the third news item on the news page
  ///
  /// In en, this message translates to:
  /// **'Royal Industrial Trading Company hosted Mr. Mazen Zghair, Public Relations Manager, and Mr.'**
  String get news3Title;

  /// No description provided for @news1Subtitle.
  ///
  /// In en, this message translates to:
  /// **'Royal hosts a delegation from the Civil Defense Directorate'**
  String get news1Subtitle;

  /// No description provided for @news2Subtitle.
  ///
  /// In en, this message translates to:
  /// **'Royal hosts a delegation from the Civil Defense Directorate'**
  String get news2Subtitle;

  /// No description provided for @news3Subtitle.
  ///
  /// In en, this message translates to:
  /// **'Royal hosts a delegation from the Civil Defense Directorate'**
  String get news3Subtitle;

  /// No description provided for @news1Content.
  ///
  /// In en, this message translates to:
  /// **'Royal Industrial Trading Company hosted Mr. Mazen Zghair, Public Relations Manager, and Mr. Ghassan Ghaith, HR Manager...\n\nThis visit included a meeting with the company\'s management, during which the Civil Defense Shield was presented in appreciation of the company\'s efforts in supporting the Civil Defense. The company management thanked the Civil Defense for their efforts.'**
  String get news1Content;

  /// No description provided for @news2Content.
  ///
  /// In en, this message translates to:
  /// **'Royal Industrial Trading Company hosted Mr. Mazen Zghair, Public Relations Manager, and Mr. Ghassan Ghaith, HR Manager...\n\nThis visit included a meeting with the company\'s management, during which the Civil Defense Shield was presented in appreciation of the company\'s efforts in supporting the Civil Defense. The company management thanked the Civil Defense for their efforts.'**
  String get news2Content;

  /// No description provided for @news3Content.
  ///
  /// In en, this message translates to:
  /// **'Royal Industrial Trading Company hosted Mr. Mazen Zghair, Public Relations Manager, and Mr. Ghassan Ghaith, HR Manager...\n\nThis visit included a meeting with the company\'s management, during which the Civil Defense Shield was presented in appreciation of the company\'s efforts in supporting the Civil Defense. The company management thanked the Civil Defense for their efforts.'**
  String get news3Content;

  /// Title for the news section or page
  ///
  /// In en, this message translates to:
  /// **'News'**
  String get newsTitle;

  /// Label for previous news button in details page
  ///
  /// In en, this message translates to:
  /// **'Previous News'**
  String get previousNews;

  /// Label for next news button in details page
  ///
  /// In en, this message translates to:
  /// **'Next News'**
  String get nextNews;

  /// No description provided for @itemKitchenSinkTitle.
  ///
  /// In en, this message translates to:
  /// **'Kitchen Sink'**
  String get itemKitchenSinkTitle;

  /// No description provided for @itemKitchenSinkCode.
  ///
  /// In en, this message translates to:
  /// **'71-8533'**
  String get itemKitchenSinkCode;

  /// No description provided for @itemKitchenSinkUnitDetails.
  ///
  /// In en, this message translates to:
  /// **'Box = 12 pieces'**
  String get itemKitchenSinkUnitDetails;

  /// No description provided for @itemKitchenSinkUnitCTN.
  ///
  /// In en, this message translates to:
  /// **'CTN'**
  String get itemKitchenSinkUnitCTN;

  /// No description provided for @itemKitchenSinkUnitPACK.
  ///
  /// In en, this message translates to:
  /// **'PACK'**
  String get itemKitchenSinkUnitPACK;

  /// No description provided for @itemOrderNumber.
  ///
  /// In en, this message translates to:
  /// **'#5022201'**
  String get itemOrderNumber;

  /// No description provided for @itemOrderTitle.
  ///
  /// In en, this message translates to:
  /// **'Order'**
  String get itemOrderTitle;

  /// No description provided for @itemSave.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get itemSave;

  /// No description provided for @ordersCurrent.
  ///
  /// In en, this message translates to:
  /// **'Current Orders'**
  String get ordersCurrent;

  /// No description provided for @ordersArchive.
  ///
  /// In en, this message translates to:
  /// **'Order Archive'**
  String get ordersArchive;

  /// No description provided for @orderDate.
  ///
  /// In en, this message translates to:
  /// **'Order Date'**
  String get orderDate;

  /// No description provided for @orderNumber.
  ///
  /// In en, this message translates to:
  /// **'Order Number'**
  String get orderNumber;

  /// No description provided for @orderItems.
  ///
  /// In en, this message translates to:
  /// **'Items Count'**
  String get orderItems;

  /// No description provided for @orderEdit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get orderEdit;

  /// No description provided for @orderDelete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get orderDelete;

  /// No description provided for @orderDetails.
  ///
  /// In en, this message translates to:
  /// **'Order Details'**
  String get orderDetails;

  /// No description provided for @orderStatus.
  ///
  /// In en, this message translates to:
  /// **'Order Status'**
  String get orderStatus;

  /// No description provided for @orderReady.
  ///
  /// In en, this message translates to:
  /// **'Ready'**
  String get orderReady;

  /// No description provided for @orderCancelled.
  ///
  /// In en, this message translates to:
  /// **'Cancelled'**
  String get orderCancelled;

  /// No description provided for @orderPreparing.
  ///
  /// In en, this message translates to:
  /// **'Preparing'**
  String get orderPreparing;

  /// No description provided for @orderItemsSample.
  ///
  /// In en, this message translates to:
  /// **'8 items'**
  String get orderItemsSample;

  /// No description provided for @orderNumberSample.
  ///
  /// In en, this message translates to:
  /// **'#5022201'**
  String get orderNumberSample;

  /// No description provided for @orderDateSample.
  ///
  /// In en, this message translates to:
  /// **'12/12/2022'**
  String get orderDateSample;

  /// Button text for completing the order in the cart screen
  ///
  /// In en, this message translates to:
  /// **'Complete Order'**
  String get completeOrderButton;

  /// Title for a product card in the browsing history page
  ///
  /// In en, this message translates to:
  /// **'Water Tank'**
  String get browsingHistoryProductTitle;

  /// Title for the search screen
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get searchTitle;

  /// Hint for the search details field
  ///
  /// In en, this message translates to:
  /// **'Search by item name or code'**
  String get searchHintDetails;

  /// Label for quantity selector
  ///
  /// In en, this message translates to:
  /// **'Quantity:'**
  String get quantityLabel;

  /// Confirm button label
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirmLabel;

  /// Cancel button label
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancelLabel;

  /// Label for item added to cart
  ///
  /// In en, this message translates to:
  /// **'Added to cart'**
  String get addedToCartLabel;

  /// Add to cart button label
  ///
  /// In en, this message translates to:
  /// **'Add to cart'**
  String get addToCartLabel;

  /// Add to favorites button label
  ///
  /// In en, this message translates to:
  /// **'Add to favorites'**
  String get addToFavoritesLabel;

  /// Title for 1000L tank
  ///
  /// In en, this message translates to:
  /// **'1000L Tank'**
  String get tankTitle;

  /// Description for 1000L tank
  ///
  /// In en, this message translates to:
  /// **'Water Tanks > One Layer Tanks'**
  String get tankDesc;

  /// No description provided for @aboutRoyalLabel.
  ///
  /// In en, this message translates to:
  /// **'About Royal'**
  String get aboutRoyalLabel;

  /// No description provided for @jobsLabel.
  ///
  /// In en, this message translates to:
  /// **'Jobs'**
  String get jobsLabel;

  /// No description provided for @privacyPolicyLabel.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacyPolicyLabel;

  /// Label for app version with version number
  ///
  /// In en, this message translates to:
  /// **'Version {version}'**
  String versionLabel(Object version);

  /// No description provided for @madeInPalestine.
  ///
  /// In en, this message translates to:
  /// **'Made in Palestine'**
  String get madeInPalestine;

  /// No description provided for @royalCo2022.
  ///
  /// In en, this message translates to:
  /// **'Royal Co 2022.'**
  String get royalCo2022;

  /// No description provided for @notificationCenterTitle.
  ///
  /// In en, this message translates to:
  /// **'Notification Center'**
  String get notificationCenterTitle;

  /// No description provided for @notificationNewCategory.
  ///
  /// In en, this message translates to:
  /// **'New Category'**
  String get notificationNewCategory;

  /// No description provided for @notificationNewCategoryMsg.
  ///
  /// In en, this message translates to:
  /// **'A category or group of categories has been added'**
  String get notificationNewCategoryMsg;

  /// No description provided for @notificationUpdate.
  ///
  /// In en, this message translates to:
  /// **'Update'**
  String get notificationUpdate;

  /// No description provided for @notificationUpdateMsg.
  ///
  /// In en, this message translates to:
  /// **'A catalog has been added to the downloads list'**
  String get notificationUpdateMsg;

  /// No description provided for @notificationEvent.
  ///
  /// In en, this message translates to:
  /// **'Event'**
  String get notificationEvent;

  /// No description provided for @notificationEventMsg.
  ///
  /// In en, this message translates to:
  /// **'Visit us at the construction business event'**
  String get notificationEventMsg;

  /// Title for why join royal page
  ///
  /// In en, this message translates to:
  /// **'Why Join Royal?'**
  String get whyJoinRoyalTitle;

  /// Content for why join royal page
  ///
  /// In en, this message translates to:
  /// **'Salujaan\n\nIf this book is good-natured, it will inspire you from the start. I do not seek to preach from behind its pages, but rather to pour out what is in my heart and mind, and I do not want your service or your praise, for I am writing to benefit myself before you from this experience. I have dedicated it to my special group of family and friends, for if they believed, they could create a better image of my nature and talents. They would find the lines I wrote in this book as a mirror of my soul and my talents. Even if I am not honest, I do not show my feelings, but I have worked to express myself and show my soul in a transparent area, so I do not know if I am in the midst of the images of ordinary nature without cost or embellishment, or if I am the one who paints myself with colors and allows myself to be painted by the customs and traditions.\n\nIt is clear in the introduction of Ibn al-Jawzi\'s book \'Sayd al-Khatir\' that he wrote these chapters as a way to record his thoughts and reflections, which he experienced and lived through. These thoughts are not the result of deep research and study, but rather are always the result of thoughts that are born and descend quickly if not recorded. For this reason, I tried to record them in this book and called it \'Sayd al-Khatir\' (Catching Thoughts), as Ibn Ahmad did months ago in the literary field and in the field of modern speech (Catching Thoughts), and this means that the concept of the chapters and what is in them are thoughts about what is said or that they are the experiences of the person himself and what he has reached from ideas related to life and society.'**
  String get whyJoinRoyalContent;

  /// Join button text for why join royal page
  ///
  /// In en, this message translates to:
  /// **'Join'**
  String get joinButton;

  /// Not now button text for why join royal page
  ///
  /// In en, this message translates to:
  /// **'Not now'**
  String get notNowButton;

  /// Welcome text on profile page
  ///
  /// In en, this message translates to:
  /// **'Welcome'**
  String get profileWelcome;

  /// User's name on profile page
  ///
  /// In en, this message translates to:
  /// **'Bashar'**
  String get profileName;

  /// Edit profile button text
  ///
  /// In en, this message translates to:
  /// **'Edit Profile'**
  String get profileEdit;

  /// Orders menu item on profile page
  ///
  /// In en, this message translates to:
  /// **'Orders'**
  String get profileOrders;

  /// New items menu item on profile page
  ///
  /// In en, this message translates to:
  /// **'New Items'**
  String get profileNewItems;

  /// Browsing archive menu item on profile page
  ///
  /// In en, this message translates to:
  /// **'Browsing Archive'**
  String get profileBrowsingArchive;

  /// Favorites menu item on profile page
  ///
  /// In en, this message translates to:
  /// **'Favorites'**
  String get profileFavorites;

  /// Logout button text on profile page
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get profileLogout;

  /// First name field in profile edit screen
  ///
  /// In en, this message translates to:
  /// **'First Name'**
  String get profileFirstName;

  /// Last name field in profile edit screen
  ///
  /// In en, this message translates to:
  /// **'Last Name'**
  String get profileLastName;

  /// Mobile field in profile edit screen
  ///
  /// In en, this message translates to:
  /// **'Mobile'**
  String get profileMobile;

  /// Phone field in profile edit screen
  ///
  /// In en, this message translates to:
  /// **'Phone'**
  String get profilePhone;

  /// Address field in profile edit screen
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get profileAddress;

  /// Email field in profile edit screen
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get profileEmail;

  /// Password field in profile edit screen
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get profilePassword;

  /// Save button in profile edit screen
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// Cancel button in profile edit screen
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// Title for the downloads center screen
  ///
  /// In en, this message translates to:
  /// **'Downloads Center'**
  String get downloadsCenterTitle;

  /// Label for furniture category in downloads
  ///
  /// In en, this message translates to:
  /// **'Furniture'**
  String get downloadsCategoryFurniture;

  /// Label for sanitary ware category in downloads
  ///
  /// In en, this message translates to:
  /// **'Sanitary Ware'**
  String get downloadsCategorySanitary;

  /// Label for food category in downloads
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get downloadsCategoryAll;

  /// Label for catalog name in downloads grid
  ///
  /// In en, this message translates to:
  /// **'Catalog Name'**
  String get downloadsCatalogName;

  /// Preview button in downloads popup
  ///
  /// In en, this message translates to:
  /// **'Preview'**
  String get downloadsPreview;

  /// Download button in downloads popup
  ///
  /// In en, this message translates to:
  /// **'Download'**
  String get downloadsDownload;

  /// Subtitle under contact us title in info screen
  ///
  /// In en, this message translates to:
  /// **'At Royal, your satisfaction is our goal'**
  String get contactSubtitle;

  /// FAQ card label in info screen
  ///
  /// In en, this message translates to:
  /// **'FAQ'**
  String get faqLabel;

  /// Support card label in info screen
  ///
  /// In en, this message translates to:
  /// **'Support'**
  String get supportLabel;

  /// Main office card label in info screen
  ///
  /// In en, this message translates to:
  /// **'Main Office'**
  String get mainOfficeLabel;

  /// Working hours label in info screen
  ///
  /// In en, this message translates to:
  /// **'Working Hours'**
  String get workingHoursLabel;

  /// Working days label in info screen
  ///
  /// In en, this message translates to:
  /// **'Everyday except official holidays'**
  String get workingDaysLabel;

  /// Address label in info screen
  ///
  /// In en, this message translates to:
  /// **'258m Haram Al-Rama, Hebron, Palestine 90000'**
  String get addressLabel;

  /// No description provided for @royalTitle.
  ///
  /// In en, this message translates to:
  /// **'Royal'**
  String get royalTitle;

  /// No description provided for @royalSlogan.
  ///
  /// In en, this message translates to:
  /// **'Your satisfaction is our goal'**
  String get royalSlogan;

  /// No description provided for @contactRoyalLabel.
  ///
  /// In en, this message translates to:
  /// **'Contact Royal'**
  String get contactRoyalLabel;

  /// No description provided for @workingHoursTime.
  ///
  /// In en, this message translates to:
  /// **'8:00AM - 16:00PM'**
  String get workingHoursTime;

  /// No description provided for @workingHoursNote.
  ///
  /// In en, this message translates to:
  /// **'Daily except official holidays'**
  String get workingHoursNote;

  /// No description provided for @phone1.
  ///
  /// In en, this message translates to:
  /// **'+970 2 2219800'**
  String get phone1;

  /// No description provided for @phone2.
  ///
  /// In en, this message translates to:
  /// **'+970 2 2220127'**
  String get phone2;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'info@royal.ps'**
  String get email;

  /// No description provided for @website.
  ///
  /// In en, this message translates to:
  /// **'www.royal.ps'**
  String get website;

  /// No description provided for @addressLine1.
  ///
  /// In en, this message translates to:
  /// **'258 Bir Haram Al-Rama'**
  String get addressLine1;

  /// No description provided for @addressLine2.
  ///
  /// In en, this message translates to:
  /// **'Hebron, Palestine 90000'**
  String get addressLine2;

  /// No description provided for @contactUsLabelMini.
  ///
  /// In en, this message translates to:
  /// **'Contact Us'**
  String get contactUsLabelMini;

  /// No description provided for @beyondCreativity.
  ///
  /// In en, this message translates to:
  /// **'Beyond Creativity'**
  String get beyondCreativity;

  /// No description provided for @beyondCreativityDesc.
  ///
  /// In en, this message translates to:
  /// **'Stylish, Elegant, Innovation'**
  String get beyondCreativityDesc;

  /// Contact phone number for info screen
  ///
  /// In en, this message translates to:
  /// **'+970 2 2219800'**
  String get contactPhone;

  /// Contact fax number for info screen
  ///
  /// In en, this message translates to:
  /// **'+970 2 2220127'**
  String get contactFax;

  /// Contact email for info screen
  ///
  /// In en, this message translates to:
  /// **'info@royal.ps'**
  String get contactEmail;

  /// Contact website for info screen
  ///
  /// In en, this message translates to:
  /// **'www.royal.ps'**
  String get contactWebsite;

  /// No description provided for @faqProductionProcessQ.
  ///
  /// In en, this message translates to:
  /// **'What are the production processes carried out in your factory?'**
  String get faqProductionProcessQ;

  /// No description provided for @faqProductionProcessA.
  ///
  /// In en, this message translates to:
  /// **'At Royal factory, we use various production processes such as rotational molding, blow molding, injection molding, and many other processes that allow us to control the quality and production time of our products.'**
  String get faqProductionProcessA;

  /// No description provided for @faqWorkingHoursQ.
  ///
  /// In en, this message translates to:
  /// **'What are the working hours at the factory?'**
  String get faqWorkingHoursQ;

  /// No description provided for @faqWorkingHoursA.
  ///
  /// In en, this message translates to:
  /// **''**
  String get faqWorkingHoursA;

  /// No description provided for @faqFactoryLocationQ.
  ///
  /// In en, this message translates to:
  /// **'Where is the factory located? Can I visit the factory?'**
  String get faqFactoryLocationQ;

  /// No description provided for @faqFactoryLocationA.
  ///
  /// In en, this message translates to:
  /// **''**
  String get faqFactoryLocationA;

  /// No description provided for @faqExperienceQ.
  ///
  /// In en, this message translates to:
  /// **'Do you have enough experience in manufacturing and exporting?'**
  String get faqExperienceQ;

  /// No description provided for @faqExperienceA.
  ///
  /// In en, this message translates to:
  /// **''**
  String get faqExperienceA;

  /// No description provided for @faqMainMarketQ.
  ///
  /// In en, this message translates to:
  /// **'Where do you mainly sell your products?'**
  String get faqMainMarketQ;

  /// No description provided for @faqMainMarketA.
  ///
  /// In en, this message translates to:
  /// **''**
  String get faqMainMarketA;

  /// No description provided for @hereToHelpTitle.
  ///
  /// In en, this message translates to:
  /// **'Here to help you'**
  String get hereToHelpTitle;

  /// No description provided for @supportPhone.
  ///
  /// In en, this message translates to:
  /// **'1700 900 300'**
  String get supportPhone;

  /// No description provided for @supportEmail.
  ///
  /// In en, this message translates to:
  /// **'Support@royal.ps'**
  String get supportEmail;

  /// No description provided for @supportPOBox.
  ///
  /// In en, this message translates to:
  /// **'P.O Box 51841'**
  String get supportPOBox;

  /// No description provided for @supportJerusalem.
  ///
  /// In en, this message translates to:
  /// **'Jerusalem, IL 9711025'**
  String get supportJerusalem;

  /// No description provided for @faqNeedHelpTitle.
  ///
  /// In en, this message translates to:
  /// **'Need help?'**
  String get faqNeedHelpTitle;

  /// No description provided for @faqBrowseSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Browse the FAQ.'**
  String get faqBrowseSubtitle;

  /// No description provided for @badge99plus.
  ///
  /// In en, this message translates to:
  /// **'99+'**
  String get badge99plus;

  /// Shown when user presses back once on home page
  ///
  /// In en, this message translates to:
  /// **'Press back again to exit'**
  String get pressBackAgainToExit;

  /// No description provided for @statusReady.
  ///
  /// In en, this message translates to:
  /// **'Ready'**
  String get statusReady;

  /// No description provided for @statusCancelled.
  ///
  /// In en, this message translates to:
  /// **'Cancelled'**
  String get statusCancelled;

  /// No description provided for @statusPreparing.
  ///
  /// In en, this message translates to:
  /// **'Preparing'**
  String get statusPreparing;

  /// Hint for last name field in profile edit screen
  ///
  /// In en, this message translates to:
  /// **'Bashar'**
  String get profileLastNameHint;

  /// Hint for first name field in profile edit screen
  ///
  /// In en, this message translates to:
  /// **'Hjooj'**
  String get profileFirstNameHint;

  /// Hint for phone field in profile edit screen
  ///
  /// In en, this message translates to:
  /// **'0599 123 123'**
  String get profilePhoneHint;

  /// Hint for mobile field in profile edit screen
  ///
  /// In en, this message translates to:
  /// **'02 22 22222'**
  String get profileMobileHint;

  /// Hint for address field in profile edit screen
  ///
  /// In en, this message translates to:
  /// **'Sample address'**
  String get profileAddressHint;

  /// Hint for email field in profile edit screen
  ///
  /// In en, this message translates to:
  /// **'Bashar@royal.ps'**
  String get profileEmailHint;

  /// Hint for password field in profile edit screen
  ///
  /// In en, this message translates to:
  /// **'**********'**
  String get profilePasswordHint;

  /// Label for package unit selector
  ///
  /// In en, this message translates to:
  /// **'Package'**
  String get packageLabel;

  /// Label for pieces unit selector
  ///
  /// In en, this message translates to:
  /// **'Pieces'**
  String get piecesLabel;

  /// Label for quantity selector in search screen
  ///
  /// In en, this message translates to:
  /// **'Quantity:'**
  String get searchQuantityLabel;

  /// Label for pack unit in search screen
  ///
  /// In en, this message translates to:
  /// **'PACK'**
  String get searchPackLabel;

  /// Pack details in search screen
  ///
  /// In en, this message translates to:
  /// **'Pack = 12 pieces'**
  String get searchPackDetails;

  /// Done button in search screen
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get searchDoneButton;

  /// Cancel button in search screen
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get searchCancelButton;

  /// No description provided for @workingHours.
  ///
  /// In en, this message translates to:
  /// **'Working Hours'**
  String get workingHours;

  /// No description provided for @workingHoursDetails.
  ///
  /// In en, this message translates to:
  /// **'Details about working hours'**
  String get workingHoursDetails;

  /// No description provided for @contactInfo.
  ///
  /// In en, this message translates to:
  /// **'Contact Information'**
  String get contactInfo;

  /// No description provided for @contactDetails.
  ///
  /// In en, this message translates to:
  /// **'Details about contact information'**
  String get contactDetails;

  /// Subtitle for beyond creativity section
  ///
  /// In en, this message translates to:
  /// **'Beyond Creativity'**
  String get beyondCreativitySubtitle;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar': return AppLocalizationsAr();
    case 'en': return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
