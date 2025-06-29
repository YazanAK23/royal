import 'package:flutter/material.dart';
import 'package:royal/generated/l10n.dart';
import 'package:royal/widgets/product_card.dart';
import '../../../widgets/custom_app_bar.dart';
import '../../../widgets/custom_bottom_nav_bar.dart';
import '../../../widgets/custom_drawer.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  int selectedCategory = 0;

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final categories = [
      s.sanitaryLabel,
      s.energyLabel,
      s.furnitureLabel,
      s.trustLabel,
    ];
    final products = [
      // Example products, you can replace with your real data
      {'image': 'assets/images/tank7.png', 'title': s.waterTanks},
      {'image': 'assets/images/tank6.png', 'title': s.waterTanks},
      {'image': 'assets/images/tank4.png', 'title': s.waterTanks},
      {'image': 'assets/images/tank3.png', 'title': s.waterTanks},
      {'image': 'assets/images/tank5.png', 'title': s.waterTanks},
      {'image': 'assets/images/tank7.png', 'title': s.waterTanks},
    ];
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      endDrawer: CustomDrawer(
        onMenuItemTap: (route) {
          Navigator.of(context).pop();
          Navigator.of(context).pushReplacementNamed(route);
        },
      ),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80.0),
        child: Builder(
          builder: (context) => CustomAppBar(
            onMenuTap: () => Scaffold.of(context).openEndDrawer(),
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 12),
          Center(
            child: Text(
              s.favoritesLabel, // Use your localized favorite label
              style: const TextStyle(
                color: Color(0xFF00AEEF),
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(height: 16),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(categories.length, (index) {
                final isSelected = index == selectedCategory;
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(height: 8),
                      TextButton(
                        onPressed: () {
                          setState(() => selectedCategory = index);
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: isSelected ? const Color(0xFF00AEEF) : Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: BorderSide(
                              color: isSelected ? const Color(0xFF00AEEF) : Colors.grey.shade300,
                              width: 1.5,
                            ),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                        ),
                        child: Text(
                          categories[index],
                          style: TextStyle(
                            color: isSelected ? Colors.white : Colors.grey[700],
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      const SizedBox(height: 4),
                    ],
                  ),
                );
              }),
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
                children: products.map((product) => ProductCard(
                  imagePath: product['image']!,
                  title: product['title']!,
                )).toList(),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: 1, // 1 for Favorite page
        onTap: (index) {
          if (index == 0) {
            Navigator.of(context).pushReplacementNamed('/home');
          } else if (index == 1) {
            // Already on favorite, do nothing
          } else if (index == 2) {
            Navigator.of(context).pushReplacementNamed('/account');
          } else if (index == 3) {
            Navigator.of(context).pushReplacementNamed('/browsing-history');
          } else if (index == 4) {
            Navigator.of(context).pushReplacementNamed('/information');
          }
        },
      ),
    );
  }
}
