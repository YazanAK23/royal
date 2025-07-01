import 'package:flutter/material.dart';
import 'package:royal/core/routes/app_routes.dart';
import 'package:royal/generated/l10n.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_bottom_nav_bar.dart';
import '../../widgets/product_card.dart';

class BrowsingHistoryPage extends StatelessWidget {
  const BrowsingHistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      appBar: CustomAppBar(
        onMenuTap: () => AppRoutes.navigateTo(context, AppRoutes.customDrawer),
      ),
      body: Column(
        children: [
          const SizedBox(height: 4),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: IconButton(
                icon: const Icon(Icons.arrow_back_ios, color: Color(0xFF00AEEF)),
                onPressed: () =>  Navigator.of(context).pushReplacementNamed(AppRoutes.customDrawer),
                tooltip: s.browsingArchiveLabel,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Center(
            child: Text(
              s.browsingArchiveLabel,
              style: const TextStyle(
                color: Color(0xFF00AEEF),
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.95,
                children: [
                  ProductCard(
                    imagePath: 'assets/images/tank7.png',
                    title: s.waterTanks,
                  ),
                  ProductCard(
                    imagePath: 'assets/images/tank7.png',
                    title: s.waterTanks ,
                  ),
                  ProductCard(
                    imagePath: 'assets/images/tank6.png',
                    title: s.waterTanks,
                  ),
                  ProductCard(
                    imagePath: 'assets/images/tank4.png',
                    title: s.waterTanks ,
                  ),
                  ProductCard(
                    imagePath: 'assets/images/tank3.png',
                    title: s.waterTanks ,
                  ),
                  ProductCard(
                    imagePath: 'assets/images/tank5.png',
                    title: s.waterTanks,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: 0,
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
    );
  }
}
