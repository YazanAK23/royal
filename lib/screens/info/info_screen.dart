// lib/screens/info_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:royal/generated/l10n.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_bottom_nav_bar.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.only(bottom: 90),
                  child: Column(
                    children: [
                      // Header image with overlay and title
                      Stack(
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(32),
                              bottomRight: Radius.circular(32),
                            ),
                            child: Image.asset(
                              'assets/images/appbar.png',
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: 180,
                            ),
                          ),
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

                      const SizedBox(height: 16),

                      // Subtitle
                      Text(
                        S.of(context).contactSubtitle,
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),

                      const SizedBox(height: 8),

                      // Top 3 cards (FAQ, Support, Main Office)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _InfoCard(
                              icon: 'assets/icons/questions_icon.svg',
                              label: S.of(context).faqLabel,
                            ),
                            _InfoCard(
                              icon: 'assets/icons/support_icon.svg',
                              label: S.of(context).supportLabel,
                            ),
                            _InfoCard(
                              icon: 'assets/icons/Headquarter_icon.svg',
                              label: S.of(context).mainOfficeLabel,
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 16),

                      // Contact Card
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: _ContactCard(),
                      ),

                      const SizedBox(height: 12),

                      // Address Card
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: _AddressCard(),
                      ),

                      const SizedBox(height: 16),

                      // Remove social media section from here

                      const SizedBox(height: 48),
                    ],
                  ),
                ),
              ),
            ],
          ),
          // Social Media Row positioned above the SVG
          Positioned(
            left: 0,
            right: 0,
            bottom: 120, // Height of SVG
            child: Center(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.08),
                      blurRadius: 12,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 0),
                      child: Text(
                        'تواصل معنا',
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge
                            ?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFF1CA9E5),
                              fontSize: 22, // Minimized
                              fontFamily: 'Cairo',
                            ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Directionality(
                      textDirection: TextDirection.rtl,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _SocialIcon(
                            icon: 'assets/icons/facebook_icon.svg',
                            bgColor: Color(0xFF153A5B),
                            border: true,
                            size: 32, // Minimized
                            iconSize: 18, // Minimized
                          ),
                          const SizedBox(width: 12),
                          _SocialIcon(
                            icon: 'assets/icons/instagram_icon.svg',
                            bgColor: Color(0xFF153A5B),
                            border: true,
                            size: 32,
                            iconSize: 18,
                          ),
                          const SizedBox(width: 12),
                          _SocialIcon(
                            icon: 'assets/icons/youtube_icon.svg',
                            bgColor: Color(0xFF153A5B),
                            border: true,
                            size: 32,
                            iconSize: 18,
                          ),
                          const SizedBox(width: 12),
                          _SocialIcon(
                            icon: 'assets/icons/whatsapp_icon.svg',
                            bgColor: Color(0xFF153A5B),
                            border: true,
                            size: 32,
                            iconSize: 18,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // SVG positioned above the navbar
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: SvgPicture.asset(
              'assets/images/bottom_nav_bar_image_info.svg',
              width: double.infinity,
              height: 120,
              fit: BoxFit.fill,
            ),
          ),
          // Text inside the SVG image area (now above the SVG in the stack)
          Positioned(
            left: 0,
            right: 0,
            bottom: 40, // Adjust as needed for vertical placement
            child: Column(
              children: [
                Text(
                  'Beyond Creativity',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 28, // Minimized
                    fontFamily: 'Cairo',
                    shadows: [
                      Shadow(
                        blurRadius: 8,
                        color: Colors.black.withOpacity(0.2),
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 4),
                Text(
                  'Stylish, Elegant, Innovation',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14, // Minimized
                    fontFamily: 'Cairo',
                    fontWeight: FontWeight.w400,
                    shadows: [
                      Shadow(
                        blurRadius: 6,
                        color: Colors.black.withOpacity(0.15),
                        offset: Offset(0, 1),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: 4,
        onTap: (index) {
          // handle tab taps if needed
        },
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  final String icon;
  final String label;
  const _InfoCard({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        width: 90,
        height: 90,
        decoration: BoxDecoration(
          color: const Color(0xFF1CA9E5),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(icon, width: 36, height: 36, color: Colors.white),
            const SizedBox(height: 8),
            Text(
              label,
              style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class _ContactCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFF1CA9E5),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Working hours (right side in RTL)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  S.of(context).workingHoursLabel,
                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
                const Text('8:00AM - 4:00PM', style: TextStyle(color: Colors.white)),
                Text(
                  S.of(context).workingDaysLabel,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
            const SizedBox(width: 16),
            // Contact info (left side in RTL)
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text('+970 2 2219800', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                      const SizedBox(width: 8),
                      SvgPicture.asset('assets/icons/mobile_icon.svg', width: 20, color: Colors.white),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text('+970 2 2220127', style: TextStyle(color: Colors.white)),
                      const SizedBox(width: 8),
                      SvgPicture.asset('assets/icons/printer_icon.svg', width: 20, color: Colors.white),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text('info@royal.ps', style: TextStyle(color: Colors.white)),
                      const SizedBox(width: 8),
                      SvgPicture.asset('assets/icons/mail_icon.svg', width: 20, color: Colors.white),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text('www.royal.ps', style: TextStyle(color: Colors.white)),
                      const SizedBox(width: 8),
                      SvgPicture.asset('assets/icons/web_icon.svg', width: 20, color: Colors.white),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AddressCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFF1CA9E5),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            SvgPicture.asset('assets/icons/Headquarter_icon.svg', width: 28, color: Colors.white),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                '258 Bir Haram, Al-Khalil, Palestine 90000',
                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                textAlign: TextAlign.right,
              ),
            ),
          ],
        ),
      ),
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
            color: Colors.black.withOpacity(0.10),
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
          color: Colors.white,
        ),
      ),
    );
  }
}
