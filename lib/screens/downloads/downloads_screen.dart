import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:royal/generated/l10n.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_bottom_nav_bar.dart';

class DownloadsScreen extends StatefulWidget {
  const DownloadsScreen({Key? key}) : super(key: key);

  @override
  State<DownloadsScreen> createState() => _DownloadsScreenState();
}

class _DownloadsScreenState extends State<DownloadsScreen> {
  int selectedIndex = 0; // 0: Furniture, 1: Sanitary, 2: All (default)

  final List<_CategoryData> categories = [
    _CategoryData(
      labelBuilder: (context) => S.of(context).downloadsCategoryAll, // Or use 'الكل'
      asset: 'assets/icons/home_logo_unselected.svg',
    ),
    _CategoryData(
      labelBuilder: (context) => S.of(context).downloadsCategoryFurniture,
      asset: 'assets/icons/furniture.svg',
    ),
    _CategoryData(
      labelBuilder: (context) => S.of(context).downloadsCategorySanitary,
      asset: 'assets/icons/saintary.svg',
    ),
  ];

  void _selectCategory(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  void _goLeft() {
    setState(() {
      selectedIndex = (selectedIndex - 1 + categories.length) % categories.length;
    });
  }

  void _goRight() {
    setState(() {
      selectedIndex = (selectedIndex + 1) % categories.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                S.of(context).downloadsCenterTitle,
                style: Theme.of(context).textTheme.displayMedium?.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          // Category selector row matching the design
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // Left chevron
                IconButton(
                  icon: const Icon(Icons.chevron_left, size: 36, color: Color(0xFF17375E)),
                  onPressed: _goLeft,
                  splashRadius: 24,
                ),
                const SizedBox(width: 8),
                // Categories
                ...List.generate(categories.length, (i) => _CategoryIcon(
                  label: categories[i].labelBuilder(context),
                  asset: categories[i].asset,
                  selected: selectedIndex == i,
                  onTap: () => _selectCategory(i),
                )),
                const SizedBox(width: 8),
                // Right chevron
                IconButton(
                  icon: const Icon(Icons.chevron_right, size: 36, color: Color(0xFF17375E)),
                  onPressed: _goRight,
                  splashRadius: 24,
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 0.7,
              ),
              itemCount: 12,
              itemBuilder: (context, index) {
                return _DownloadItem();
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: 3, // Downloads tab index
        onTap: (index) {
          // Handle navigation
        },
      ),
    );
  }
}

class _CategoryData {
  final String Function(BuildContext) labelBuilder;
  final String asset;
  _CategoryData({required this.labelBuilder, required this.asset});
}

class _CategoryIcon extends StatelessWidget {
  final String label;
  final String asset;
  final bool selected;
  final VoidCallback? onTap;
  const _CategoryIcon({required this.label, required this.asset, this.selected = false, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: selected ? 28 : 24,
              backgroundColor: selected ? Theme.of(context).primaryColor : Colors.grey[200],
              child: SvgPicture.asset(asset, width: 32, height: 32),
            ),
            const SizedBox(height: 8),
            Text(
              label,
              style: TextStyle(
                fontWeight: selected ? FontWeight.bold : FontWeight.normal,
                color: selected ? Theme.of(context).primaryColor : Colors.black,
                fontSize: 13,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DownloadItem extends StatelessWidget {
  void _showDownloadDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
          backgroundColor: Colors.white,
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 28),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Preview
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.menu_book_outlined, size: 56, color: Color(0xFF17375E)),
                        const SizedBox(height: 8),
                        Text(S.of(context).downloadsPreview, style: TextStyle(fontSize: 16, color: Colors.black)),
                      ],
                    ),
                    // Download
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.picture_as_pdf, size: 56, color: Color(0xFFD32F2F)),
                        const SizedBox(height: 8),
                        Text(S.of(context).downloadsDownload, style: TextStyle(fontSize: 16, color: Colors.black)),
                      ],
                    ),
                  ],
                ),
              ),
              // Close button (top right)
              Positioned(
                top: 8,
                right: 8,
                child: GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blue[100],
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.close, color: Colors.blue, size: 24),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showDownloadDialog(context),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    'assets/images/catalog.png',
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                S.of(context).downloadsCatalogName,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  // Removed underline
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
