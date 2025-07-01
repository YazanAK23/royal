import 'package:flutter/material.dart';
import 'package:royal/generated/l10n.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_bottom_nav_bar.dart';
import '../../core/routes/app_routes.dart';

class NewsDetailsPage extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;
  final String content;
  final VoidCallback? onNext;
  final VoidCallback? onPrev;

  const NewsDetailsPage({
    Key? key,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.content,
    this.onNext,
    this.onPrev,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
          onMenuTap: () => AppRoutes.navigateTo(context, AppRoutes.customDrawer),

      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: -1, // No tab selected for NewsDetailsPage
        onTap: (index) {
          if (index == 0) {
            Navigator.of(context).pushReplacementNamed('/home');
          } else if (index == 1) {
            Navigator.of(context).pushReplacementNamed('/favorites');
          } else if (index == 2) {
            Navigator.of(context).pushReplacementNamed('/profile');
          } else if (index == 3) {
            Navigator.of(context).pushReplacementNamed('/downloads');
          } else if (index == 4) {
            Navigator.of(context).pushReplacementNamed('/info');
          }
        },
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: [
            Row(
              children: [
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios_new, color: Color(0xFF00B4D8)),
                  onPressed: () {
                    Navigator.of(context).pushNamedAndRemoveUntil(AppRoutes.news, (route) => false);
                  },
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Center(
                child: Text(
                  S.of(context).newsTitle,
                  style: const TextStyle(
                    color: Color(0xFF00B4D8),
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              textDirection: Directionality.of(context), // Let Flutter handle direction automatically
              children: [
                TextButton.icon(
                  onPressed: onPrev,
                  icon: const Icon(Icons.arrow_back_ios_new, color: Color(0xFF00B4D8), size: 18),
                  label: Text(s.previousNews, style: const TextStyle(color: Color(0xFF00B4D8))),
                ),
                TextButton.icon(
                  onPressed: onNext,
                  label: Text(s.nextNews, style: const TextStyle(color: Color(0xFF00B4D8))),
                  icon: const Icon(Icons.arrow_forward_ios, color: Color(0xFF00B4D8), size: 18),
                ),
              ],
            ),
            const SizedBox(height: 8),
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                image,
                height: 180,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 12),
            Align(
              alignment: AlignmentDirectional.centerEnd,
              child: Text(
                title,
                style: const TextStyle(
                  color: Color(0xFF00B4D8),
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Align(
              alignment: AlignmentDirectional.centerEnd,
              child: Text(
                subtitle,
                style: const TextStyle(
                  color: Color(0xFF222222),
                  fontSize: 14,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  content,
                  style: const TextStyle(
                    color: Color(0xFF222222),
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
