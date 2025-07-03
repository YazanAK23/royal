import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:royal/generated/l10n.dart';
import '../../widgets/royal_scaffold.dart';

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
    return RoyalScaffold(
      currentIndex: 3, // Downloads tab index
      onNavTap: (index) {
        if (index == 0) {
          Navigator.of(context).pushReplacementNamed('/home');
        } else if (index == 1) {
          Navigator.of(context).pushReplacementNamed('/favorite');
        } else if (index == 2) {
          Navigator.of(context).pushReplacementNamed('/profile');
        } else if (index == 3) {
          // Already on downloads
        } else if (index == 4) {
          Navigator.of(context).pushReplacementNamed('/info');
        }
      },
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
            child: Align(
              alignment: Directionality.of(context) == TextDirection.rtl
                  ? Alignment.centerRight
                  : Alignment.centerLeft,
              child: Text(
                S.of(context).downloadsCenterTitle,
                style: Theme.of(context).textTheme.displayMedium?.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          // Category selector row matching the design
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
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
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: selected ? 96 : 84, // Increased size
              height: selected ? 96 : 84,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: selected
                    ? Color(0xFF0faeef)
                    : Color(0xFFF5F6F8),
              ),
              child: Center(
                child: Container(
                  width: selected ? 80 : 70, // Increased inner circle
                  height: selected ? 80 : 70,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: selected
                        ? Color(0xFF0faeef)
                        : Color(0xFFF3F4F6),
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      asset,
                      width: selected ? 56 : 46, // Increased icon size
                      height: selected ? 56 : 46,
                      color: selected ? Colors.white : Color(0xFF222222),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16), // Slightly more spacing
            Text(
              label,
              style: TextStyle(
                fontWeight: selected ? FontWeight.bold : FontWeight.normal,
                color: selected ? Color(0xFF0faeef) : Color(0xFF222222),
                fontSize: selected ? 18 : 16, // Slightly larger font
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
            clipBehavior: Clip.none,
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
                        SvgPicture.asset(
                          'assets/icons/previw_icon.svg',
                          width: 56,
                          height: 56,
                          color: const Color(0xFF17375E),
                        ),
                        const SizedBox(height: 8),
                        Text(S.of(context).downloadsPreview, style: TextStyle(fontSize: 16, color: Colors.black)),
                      ],
                    ),
                    // Download
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(
                          'assets/icons/pdf_icons.svg',
                          width: 56,
                          height: 56,
                        ),
                        const SizedBox(height: 8),
                        Text(S.of(context).downloadsDownload, style: TextStyle(fontSize: 16, color: Colors.black)),
                      ],
                    ),
                  ],
                ),
              ),
              // Close button (top right, floating and styled, smaller)
              Positioned(
                top: -18, // Adjusted for smaller size
                right: -18, // Adjusted for smaller size
                child: GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: Color(0xFF0faeef), // Solid blue
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.08),
                          blurRadius: 8,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: const Center(
                      child: Icon(Icons.close, color: Colors.white, size: 24),
                    ),
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
        color: Colors.white, // Set card background to #ffffff
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(3.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 0,
                child: Container(
                  
                  height: 74, // Increased image height
                  width: 110,  // Increased image width
                  decoration: BoxDecoration(
                    color: Color(0xFF0faeef), // Set background color around the image
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      'assets/images/catalog.png',
                      fit: BoxFit.cover,
                      width: 125, // Match container width
                      height: 125, // Match container height
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                S.of(context).downloadsCatalogName,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Color(0xFF656565), // Changed to #656565
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
