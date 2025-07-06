// lib/screens/info_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:royal/generated/l10n.dart';
import '../../core/routes/app_routes.dart';
import '../../widgets/custom_bottom_nav_bar.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({super.key});

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  int selectedCardIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Custom AppBar with background image and icons
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(220),
        child: Stack(
          children: [
            // Background image (cover all width, no border radius)
            Positioned.fill(
              child: Image.asset(
                'assets/images/appbar.png',
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
              ),
            ),
            // Top icons (back, search)
            Positioned(
              top: 32,  
              left: 16,
              child: Row(
                children: [
                  _AppBarIcon(
                    icon: Icons.arrow_back_ios_new,
                    onTap: () => Navigator.of(context).pop(),
                  ),
                  const SizedBox(width: 16),
                  _AppBarIcon(
                    icon: Icons.search,
                    onTap: () =>  Navigator.of(context).pushNamed(AppRoutes.search),

                  ),
                ],
              ),
            ),
            // Right icons (cart, notification, menu)
            Positioned(
              top: 32,
              right: 16,
              child: Row(
                children: [
                  _AppBarSvgIcon(
                    asset: 'assets/icons/cart.svg',
                    badge: true,
                    onTap: () => Navigator.of(context).pushNamed(AppRoutes.cart), // Use AppRoutes for consistency

                  ),
                  const SizedBox(width: 16),
                  _AppBarSvgIcon(
                    asset: 'assets/icons/notification_icon.svg',
                    badge: true,
                    onTap: () =>  Navigator.of(context).pushNamed(AppRoutes.notificationCenter),

                  ),
                  const SizedBox(width: 16),
                  _AppBarIcon(
                    icon: Icons.menu,
                    onTap: () => Navigator.of(context).pushNamed(AppRoutes.customDrawer),

                  ),
                ],
              ),
            ),
            // Centered title
            Positioned(
              left: 0,
              right: 0,
              bottom: 24,
              child: Center(
                child: Text(
                  S.of(context).contactUsLabel,
                  style: Theme.of(context)
                      .textTheme
                      .displayMedium
                      ?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                      ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 0), // Remove extra bottom padding
            child: Column(
              children: [
                const SizedBox(height: 16),
                // Subtitle (centered, two lines, dark blue, large)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Column(
                    children: [
                      Text(
                        S.of(context).royalTitle,
                        style: const TextStyle(
                          color: Color(0xFF153A5B),
                          fontWeight: FontWeight.bold,
                          fontSize: 32,
                          fontFamily: 'Cairo',
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        S.of(context).royalSlogan,
                        style: const TextStyle(
                          color: Color(0xFF153A5B),
                          fontWeight: FontWeight.bold,
                          fontSize: 28,
                          fontFamily: 'Cairo',
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                // Top 3 cards (FAQ, Support, Main Office) redesigned and responsive
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      double cardWidth = (constraints.maxWidth - 32) / 3;
                      cardWidth = cardWidth.clamp(90, 130); // min 90, max 130
                      final isArabic = Localizations.localeOf(context).languageCode == 'ar';
                      final cards = isArabic
                          ? [
                              _InfoCard(
                                icon: 'assets/icons/Headquarter_icon.svg',
                                label: S.of(context).mainOfficeLabel,
                                circleColor: selectedCardIndex == 0 ? const Color(0xFF1CA9E5) : const Color(0xFF153A5B),
                                width: cardWidth,
                              ),
                              _InfoCard(
                                icon: 'assets/icons/support_icon.svg',
                                label: S.of(context).supportLabel,
                                circleColor: selectedCardIndex == 1 ? const Color(0xFF1CA9E5) : const Color(0xFF153A5B),
                                width: cardWidth,
                              ),
                              _InfoCard(
                                icon: 'assets/icons/questions_icon.svg',
                                label: S.of(context).faqLabel,
                                circleColor: selectedCardIndex == 2 ? const Color(0xFF1CA9E5) : const Color(0xFF153A5B),
                                width: cardWidth,
                              ),
                            ]
                          : [
                              _InfoCard(
                                icon: 'assets/icons/Headquarter_icon.svg',
                                label: S.of(context).mainOfficeLabel,
                                circleColor: selectedCardIndex == 0 ? const Color(0xFF1CA9E5) : const Color(0xFF153A5B),
                                width: cardWidth,
                              ),
                              _InfoCard(
                                icon: 'assets/icons/support_icon.svg',
                                label: S.of(context).supportLabel,
                                circleColor: selectedCardIndex == 1 ? const Color(0xFF1CA9E5) : const Color(0xFF153A5B),
                                width: cardWidth,
                              ),
                              _InfoCard(
                                icon: 'assets/icons/questions_icon.svg',
                                label: S.of(context).faqLabel,
                                circleColor: selectedCardIndex == 2 ? const Color(0xFF1CA9E5) : const Color(0xFF153A5B),
                                width: cardWidth,
                              ),
                            ];
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: List.generate(3, (i) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedCardIndex = i;
                              });
                            },
                            child: cards[i],
                          );
                        }),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 16),
                // Conditionally render content based on selectedCardIndex
                if (selectedCardIndex == 1)
                  // Support content (match provided image)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF8F8F8),
                        borderRadius: BorderRadius.circular(28),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 8),
                      child: Column(
                        children: [
                          // Section title above the icon, not overlapped
                          Text(
                            S.of(context).hereToHelpTitle,
                            style: const TextStyle(
                              color: Color(0xFF153A5B),
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                              fontFamily: 'Cairo',
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 50),
                          // First card: phone/email
                          _SupportCard(
                            svgIcon: 'assets/icons/support_icon.svg', // headset icon
                            iconBg: const Color(0xFF1CA9E5),
                            title: S.of(context).supportPhone,
                            subtitle: S.of(context).supportEmail,
                          ),
                          const SizedBox(height: 50),
                          // Second card: address
                          _SupportCard(
                            svgIcon: 'assets/icons/mail_icon.svg', // mail icon
                            iconBg: const Color(0xFF1CA9E5),
                            title: S.of(context).supportPOBox,
                            subtitle: S.of(context).supportJerusalem,
                          ),
                          const SizedBox(height: 24),
                          // Dots indicator (optional, for consistency)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(3, (index) {
                              return AnimatedContainer(
                                duration: const Duration(milliseconds: 200),
                                margin: const EdgeInsets.symmetric(horizontal: 4),
                                width: selectedCardIndex == index ? 12 : 8,
                                height: selectedCardIndex == index ? 12 : 8,
                                decoration: BoxDecoration(
                                  color: selectedCardIndex == index ? const Color(0xFF1CA9E5) : const Color(0xFFD6EAF8),
                                  shape: BoxShape.circle,
                                ),
                              );
                            }),
                          ),
                          const SizedBox(height: 12),
                        ],
                      ),
                    ),
                  )
                else if (selectedCardIndex == 2)
                  // FAQ content (newly added)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF8F8F8),
                        borderRadius: BorderRadius.circular(28),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 8),
                      child: Column(
                        children: [
                          Text(
                            S.of(context).faqNeedHelpTitle,
                            style: const TextStyle(
                              color: Color(0xFF153A5B),
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                              fontFamily: 'Cairo',
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            S.of(context).faqBrowseSubtitle,
                            style: const TextStyle(
                              color: Color(0xFF153A5B),
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              fontFamily: 'Cairo',
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 24),
                          _FaqList(),
                        ],
                      ),
                    ),
                  )
                else
                  // Default content (contact, address, etc.)
                  Column(
                    children: [
                      // Contact & Address Section Title + Cards + Dots with background and shadow
                      Container(
                        color: const Color(0xFFF8F8F8),
                        width: double.infinity,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 24, bottom: 0),
                              child: Text(
                                S.of(context).contactRoyalLabel,
                                style: const TextStyle(
                                  color: Color(0xFF153A5B),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 26,
                                  fontFamily: 'Cairo',
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            const SizedBox(height: 36),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
                              child: _ContactCardRedesigned(),
                            ),
                            const SizedBox(height: 32),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
                              child: _AddressCardRedesigned(),
                            ),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(3, (index) {
                                return AnimatedContainer(
                                  duration: const Duration(milliseconds: 200),
                                  margin: const EdgeInsets.symmetric(horizontal: 4),
                                  width: selectedCardIndex == index ? 12 : 8,
                                  height: selectedCardIndex == index ? 12 : 8,
                                  decoration: BoxDecoration(
                                    color: selectedCardIndex == index ? const Color(0xFF1CA9E5) : const Color(0xFFD6EAF8),
                                    shape: BoxShape.circle,
                                  ),
                                );
                              }),
                            ),
                            const SizedBox(height: 12),
                          ],
                        ),
                      ),
                      const SizedBox(height: 12),
                    ],
                  ),
                // Social Media Row and Beyond Creativity section (always visible)
                const SizedBox(height: 12),
                Text(
                  S.of(context).contactUsLabelMini,
                  style: const TextStyle(
                    color: Color(0xFF1CA9E5),
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                    fontFamily: 'Cairo',
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 4),
                const Directionality(
                  textDirection: TextDirection.rtl,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _SocialIcon(
                        icon: 'assets/icons/facebook_icon.svg',
                        bgColor: Color(0xFF153A5B),
                        border: false,
                        size: 32,
                        iconSize: 18,
                      ),
                      SizedBox(width: 8),
                      _SocialIcon(
                        icon: 'assets/icons/instagram_icon.svg',
                        bgColor: Color(0xFF153A5B),
                        border: false,
                        size: 32,
                        iconSize: 18,
                      ),
                      SizedBox(width: 8),
                      _SocialIcon(
                        icon: 'assets/icons/youtube_icon.svg',
                        bgColor: Color(0xFF153A5B),
                        border: false,
                        size: 32,
                        iconSize: 18,
                      ),
                      SizedBox(width: 8),
                      _SocialIcon(
                        icon: 'assets/icons/whatsapp_icon.svg',
                        bgColor: Color(0xFF153A5B),
                        border: false,
                        size: 32,
                        iconSize: 18,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  width: double.infinity,
                  height: 120,
                  margin: const EdgeInsets.only(bottom: 0),
                  padding: EdgeInsets.zero,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      SvgPicture.asset(
                        'assets/images/bottom_nav_bar_image_info.svg',
                        fit: BoxFit.fill,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            S.of(context).beyondCreativity,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 28,
                              fontFamily: 'Cairo',
                              shadows: [
                                Shadow(
                                  blurRadius: 8,
                                  color: Colors.black.withAlpha(51), // 0.2 * 255 ≈ 51
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            S.of(context).beyondCreativityDesc,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontFamily: 'Cairo',
                              fontWeight: FontWeight.w400,
                              shadows: [
                                Shadow(
                                  blurRadius: 6,
                                  color: Colors.black.withAlpha(38), // 0.15 * 255 ≈ 38
                                  offset: const Offset(0, 1),
                                ),
                              ],
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: 4,
        onTap: (index) {
          // Handle navigation based on index
          if (index == 0) {
            Navigator.of(context).pushReplacementNamed('/home');
          } else if (index == 1) {
            Navigator.of(context).pushReplacementNamed('/favorite');
          } else if (index == 2) {
            Navigator.of(context).pushReplacementNamed('/profile');
          } else if (index == 3) {
            Navigator.of(context).pushReplacementNamed('/downloads');
          } else if (index == 4) {
            // Already on InfoScreen, do nothing
          }
        },
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  final String icon;
  final String label;
  final Color circleColor;
  final double width;
  const _InfoCard({required this.icon, required this.label, required this.circleColor, required this.width});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        width: width,
        height: width * 1.2,
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 2),
        decoration: BoxDecoration(
          color: const Color(0xFFF6F7F9),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: width * 0.6,
              height: width * 0.6,
              decoration: BoxDecoration(
                color: circleColor,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: SvgPicture.asset(
                  icon,
                  width: width * 0.33,
                  height: width * 0.33,
                  colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                ),
              ),
            ),
            SizedBox(height: width * 0.13),
            FittedBox(
              child: Text(
                label,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF153A5B),
                  fontFamily: 'Cairo',
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Redesigned Contact Card (RTL, pixel-perfect to provided image)
class _ContactCardRedesigned extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isArabic = Localizations.localeOf(context).languageCode == 'ar';
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 18),
          decoration: BoxDecoration(
            color: const Color(0xFF1CA9E5),
            borderRadius: BorderRadius.circular(22),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha(33), // 0.13 * 255 ≈ 33
                blurRadius: 14,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Working hours (always left in LTR, right in RTL)
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: isArabic ? CrossAxisAlignment.start : CrossAxisAlignment.end,
                  children: [
                    Text(
                      S.of(context).workingHoursLabel,
                      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18, fontFamily: 'Cairo'),
                      textAlign: isArabic ? TextAlign.left : TextAlign.right,
                    ),
                    const SizedBox(height: 6),
                    Text(
                      S.of(context).workingHoursTime,
                      style: const TextStyle(color: Colors.white, fontSize: 16, fontFamily: 'Cairo', fontWeight: FontWeight.w500),
                      textAlign: isArabic ? TextAlign.left : TextAlign.right,
                    ),
                    const SizedBox(height: 6),
                    Text(
                      S.of(context).workingHoursNote,
                      style: const TextStyle(color: Colors.white, fontSize: 15, fontFamily: 'Cairo', fontWeight: FontWeight.w400),
                      textAlign: isArabic ? TextAlign.left : TextAlign.right,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 18),
              // Contact info (always right in LTR, left in RTL)
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: isArabic ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                  children: [
                    _ContactRow(icon: 'assets/icons/mobile_icon.svg', text: S.of(context).contactPhone, textColor: Colors.white, iconColor: Colors.white, alignEnd: isArabic),
                    const SizedBox(height: 14),
                    _ContactRow(icon: 'assets/icons/printer_icon.svg', text: S.of(context).contactFax, textColor: Colors.white, iconColor: Colors.white, alignEnd: isArabic),
                    const SizedBox(height: 14),
                    _ContactRow(icon: 'assets/icons/mail_icon.svg', text: S.of(context).contactEmail, textColor: Colors.white, iconColor: Colors.white, alignEnd: isArabic),
                    const SizedBox(height: 14),
                    _ContactRow(icon: 'assets/icons/web_icon.svg', text: S.of(context).contactWebsite, textColor: Colors.white, iconColor: Colors.white, alignEnd: isArabic),
                  ],
                ),
              ),
            ],
          ),
        ),
        // Phone icon above card
        Positioned(
          top: -32,
          left: 0,
          right: 0,
          child: Center(
            child: Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(color: const Color(0xFF1CA9E5), width: 4),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withAlpha(33), // 0.13 * 255 ≈ 33
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: const Center(
                child: Icon(Icons.phone, color: Color(0xFF1CA9E5), size: 32),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _ContactRow extends StatelessWidget {
  final String icon;
  final String text;
  final Color textColor;
  final Color iconColor;
  final bool alignEnd;
  const _ContactRow({required this.icon, required this.text, this.textColor = Colors.white, this.iconColor = Colors.white, this.alignEnd = false});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: alignEnd ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: alignEnd
          ? [
              Flexible(
                child: Text(
                  text,
                  style: TextStyle(color: textColor, fontSize: 16, fontFamily: 'Cairo', fontWeight: FontWeight.w500),
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.right,
                ),
              ),
              const SizedBox(width: 8),
              SvgPicture.asset(icon, width: 22, colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn)),
            ]
          : [
              SvgPicture.asset(icon, width: 22, colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn)),
              const SizedBox(width: 8),
              Flexible(
                child: Text(
                  text,
                  style: TextStyle(color: textColor, fontSize: 16, fontFamily: 'Cairo', fontWeight: FontWeight.w500),
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                ),
              ),
            ],
    );
  }
}

// Redesigned Address Card (centered, correct spacing and icon overlap)
class _AddressCardRedesigned extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
          decoration: BoxDecoration(
            color: const Color(0xFF1CA9E5),
            borderRadius: BorderRadius.circular(28),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha(33), // 0.13 * 255 ≈ 33
                blurRadius: 14,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Column(
            children: [
              const SizedBox(height: 10),
              Text(
                S.of(context).addressLine1,
                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20, fontFamily: 'Cairo'),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                S.of(context).addressLine2,
                style: const TextStyle(color: Colors.white, fontSize: 18, fontFamily: 'Cairo'),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        // Location icon above card
        Positioned(
          top: -32,
          left: 0,
          right: 0,
          child: Center(
            child: Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(color: const Color(0xFF1CA9E5), width: 4),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withAlpha(33), // 0.13 * 255 ≈ 33
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: const Center(
                child: Icon(Icons.location_on, color: Color(0xFF1CA9E5), size: 32),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _SocialIcon extends StatelessWidget {
  final String icon;
  final Color bgColor;
  final bool border;
  final double size;
  final double iconSize;
  const _SocialIcon({
    required this.icon,
    this.bgColor = const Color(0xFF1CA9E5),
    this.border = false,
    this.size = 48,
    this.iconSize = 26,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: bgColor,
        shape: BoxShape.circle,
        border: border ? Border.all(color: Colors.white, width: 2) : null,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(26), // 0.10 * 255 ≈ 26
            blurRadius: 4,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Center(
        child: SvgPicture.asset(
          icon,
          width: iconSize,
          height: iconSize,
          colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
        ),
      ),
    );
  }
}

// Helper widget for material icon in app bar
class _AppBarIcon extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onTap;
  const _AppBarIcon({required this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.white.withAlpha(179), // 0.7 * 255 ≈ 179
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: Colors.black, size: 22),
      ),
    );
  }
}

// Helper widget for SVG icon in app bar with optional badge
class _AppBarSvgIcon extends StatelessWidget {
  final String asset;
  final bool badge;
  final VoidCallback? onTap;
  const _AppBarSvgIcon({required this.asset, this.badge = false, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.white.withAlpha(179), // 0.7 * 255 ≈ 179
              shape: BoxShape.circle,
            ),
            child: Center(
              child: SvgPicture.asset(
                asset,
                width: 22,
                height: 22,
                colorFilter: const ColorFilter.mode(Colors.black, BlendMode.srcIn),
              ),
            ),
          ),
          if (badge)
            Positioned(
              top: 2,
              right: 2,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 1),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  S.of(context).badge99plus,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

// Add this widget at the bottom of the file:
class _SupportCard extends StatelessWidget {
  final String svgIcon; // Use SVG asset path instead of IconData
  final Color iconBg;
  final String title;
  final String subtitle;
  const _SupportCard({required this.svgIcon, required this.iconBg, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    final double cardWidth = MediaQuery.of(context).size.width * 0.93;
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: cardWidth,
          margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
          padding: const EdgeInsets.only(top: 54, bottom: 32, left: 18, right: 18),
          decoration: BoxDecoration(
            color: const Color(0xFF1CA9E5),
            borderRadius: BorderRadius.circular(28),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha(33), // 0.13 * 255 ≈ 33
                blurRadius: 14,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 22,
                  fontFamily: 'Cairo',
                  letterSpacing: 0.5,
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 10),
              Text(
                subtitle,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontFamily: 'Cairo',
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
        Positioned(
          top: -40,
          left: 0,
          right: 0,
          child: Center(
            child: Container(
              width: 72,
              height: 72,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(color: iconBg, width: 4),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withAlpha(33), // 0.13 * 255 ≈ 33
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SvgPicture.asset(
                    svgIcon,
                    width: 36,
                    height: 36,
                    colorFilter: ColorFilter.mode(iconBg, BlendMode.srcIn),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// Add this widget for FAQ list
class _FaqList extends StatefulWidget {
  @override
  State<_FaqList> createState() => _FaqListState();
}

class _FaqListState extends State<_FaqList> {
  int? expandedIndex;

  @override
  Widget build(BuildContext context) {
    final faqs = [
      {
        'q': S.of(context).faqProductionProcessQ,
        'a': S.of(context).faqProductionProcessA,
      },
      {
        'q': S.of(context).faqWorkingHoursQ,
        'a': S.of(context).faqWorkingHoursA,
      },
      {
        'q': S.of(context).faqFactoryLocationQ,
        'a': S.of(context).faqFactoryLocationA,
      },
      {
        'q': S.of(context).faqExperienceQ,
        'a': S.of(context).faqExperienceA,
      },
      {
        'q': S.of(context).faqMainMarketQ,
        'a': S.of(context).faqMainMarketA,
      },
    ];
    return Column(
      children: List.generate(faqs.length, (i) {
        final isExpanded = expandedIndex == i;
        return Column(
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  expandedIndex = isExpanded ? null : i;
                });
              },
              child: Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 0),
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 18),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withAlpha(18), // 0.07 * 255 ≈ 18
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        faqs[i]['q']!,
                        style: const TextStyle(
                          color: Color(0xFF153A5B),
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          fontFamily: 'Cairo',
                        ),
                        textAlign: TextAlign.right,
                      ),
                    ),
                    Icon(
                      isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_left,
                      color: const Color(0xFF153A5B),
                      size: 28,
                    ),
                  ],
                ),
              ),
            ),
            if (isExpanded && faqs[i]['a']!.isNotEmpty)
              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(top: 0, bottom: 6, left: 0, right: 0),
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 18),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withAlpha(18), // 0.07 * 255 ≈ 18
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Text(
                  faqs[i]['a']!,
                  style: const TextStyle(
                    color: Color(0xFF153A5B),
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                    fontFamily: 'Cairo',
                  ),
                  textAlign: TextAlign.right,
                ),
              ),
          ],
        );
      }),
    );
  }
}