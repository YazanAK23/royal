import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:royal/generated/l10n.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../widgets/royal_scaffold.dart';
import '../../core/constants/app_colors.dart';
import '../../core/routes/app_routes.dart';

class DownloadsScreen extends StatefulWidget {
  const DownloadsScreen({super.key});

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
          Navigator.of(context).pushReplacementNamed(AppRoutes.home);
        } else if (index == 1) {
          Navigator.of(context).pushReplacementNamed(AppRoutes.favorite);
        } else if (index == 2) {
          Navigator.of(context).pushReplacementNamed(AppRoutes.profile);
        } else if (index == 3) {
          // Already on downloads
        } else if (index == 4) {
          Navigator.of(context).pushReplacementNamed(AppRoutes.info);
        }
      },
      body: Column(
        children: [
          SizedBox(height: 24.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 12.0.h),
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
            padding: EdgeInsets.symmetric(vertical: 8.0.h),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  // Left chevron
                  IconButton(
                    icon: Icon(Icons.chevron_left, size: 36.w, color: const Color(0xFF17375E)),
                    onPressed: _goLeft,
                    splashRadius: 24.r,
                  ),
                  SizedBox(width: 8.w),
                  // Categories
                  ...List.generate(categories.length, (i) => _CategoryIcon(
                    label: categories[i].labelBuilder(context),
                    asset: categories[i].asset,
                    selected: selectedIndex == i,
                    onTap: () => _selectCategory(i),
                  )),
                  SizedBox(width: 8.w),
                  // Right chevron
                  IconButton(
                    icon: Icon(Icons.chevron_right, size: 36.w, color: const Color(0xFF17375E)),
                    onPressed: _goRight,
                    splashRadius: 24.r,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 8.h),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 16.w,
                crossAxisSpacing: 16.w,
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
        padding: EdgeInsets.symmetric(horizontal: 18.0.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: selected ? 96.w : 84.w, // Increased size
              height: selected ? 96.h : 84.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: selected
                    ? AppColors.downloadsSelectedCategory
                    : AppColors.downloadsUnselectedCategory,
              ),
              child: Center(
                child: Container(
                  width: selected ? 80.w : 70.w, // Increased inner circle
                  height: selected ? 80.h : 70.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: selected
                        ? AppColors.downloadsSelectedCategory
                        : AppColors.downloadsUnselectedCategory,
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      asset,
                      width: selected ? 56.w : 46.w, // Increased icon size
                      height: selected ? 56.h : 46.h,
                      colorFilter: ColorFilter.mode(
                        selected ? Colors.white : const Color(0xFF222222),
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16.h), // Slightly more spacing
            Text(
              label,
              style: TextStyle(
                fontWeight: selected ? FontWeight.bold : FontWeight.normal,
                color: selected ? AppColors.downloadsSelectedCategory : const Color(0xFF222222),
                fontSize: selected ? 18.sp : 16.sp, // Slightly larger font
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
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24.r)),
          backgroundColor: Colors.white,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 28.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Preview
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(
                          'assets/icons/previw_icon.svg',
                          width: 56.w,
                          height: 56.h,
                          colorFilter: const ColorFilter.mode(Color(0xFF17375E), BlendMode.srcIn),
                        ),
                        SizedBox(height: 8.h),
                        Text(S.of(context).downloadsPreview, style: TextStyle(fontSize: 16.sp, color: Colors.black)),
                      ],
                    ),
                    // Download
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(
                          'assets/icons/pdf_icons.svg',
                          width: 56.w,
                          height: 56.h,
                        ),
                        SizedBox(height: 8.h),
                        Text(S.of(context).downloadsDownload, style: TextStyle(fontSize: 16.sp, color: Colors.black)),
                      ],
                    ),
                  ],
                ),
              ),
              // Close button (top right, floating and styled, smaller)
              Positioned(
                top: -18.h, // Adjusted for smaller size
                right: -18.w, // Adjusted for smaller size
                child: GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: Container(
                    width: 36.w,
                    height: 36.h,
                    decoration: BoxDecoration(
                      color: const Color(0xFF0faeef), // Solid blue
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withAlpha(20), // 0.08 * 255 ≈ 20
                          blurRadius: 8.r,
                          offset: Offset(0, 2.h),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Icon(Icons.close, color: Colors.white, size: 24.sp),
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
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
        child: Padding(
          padding: EdgeInsets.all(3.0.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 0,
                child: Container(
                  height: 74.h, // Increased image height
                  width: 110.w,  // Increased image width
                  decoration: BoxDecoration(
                    color: const Color(0xFF0faeef), // Set background color around the image
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12.r),
                    child: Image.asset(
                      'assets/images/catalog.png',
                      fit: BoxFit.cover,
                      width: 125.w, // Match container width
                      height: 125.h, // Match container height
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              Text(
                S.of(context).downloadsCatalogName,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: const Color(0xFF656565), // Changed to #656565
                  fontWeight: FontWeight.bold,
                  fontSize: 16.sp,
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
