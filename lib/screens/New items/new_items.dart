import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:royal/core/routes/app_routes.dart';
import 'package:royal/generated/l10n.dart';
import 'package:royal/widgets/product_card.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_bottom_nav_bar.dart';

class NewItemsPage extends StatefulWidget {
  const NewItemsPage({super.key});

  @override
  State<NewItemsPage> createState() => _NewItemsPageState();
}

class _NewItemsPageState extends State<NewItemsPage> {
  int selectedCategory = 0;
  String? _source;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)?.settings.arguments;
    if (args is Map && args['source'] is String) {
      _source = args['source'] as String;
    } else {
      _source = null;
    }
  }

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
    return WillPopScope(
      onWillPop: () async {
        if (_source == 'drawer') {
          AppRoutes.navigateTo(context, AppRoutes.customDrawer);
          return false;
        }
        return true;
      },
      child: Scaffold(
        backgroundColor: const Color(0xFFF7F7F7),
        appBar: CustomAppBar(
          onMenuTap: () => AppRoutes.navigateTo(context, AppRoutes.customDrawer),
        ),
        body: Column(
          children: [
            // Back button under the app bar, aligned left (will flip automatically in RTL)
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: Padding(
                padding: EdgeInsetsDirectional.only(start: 8.0.w),
                child: IconButton(
                  icon: Icon(Icons.arrow_back_ios, color: const Color(0xFF00AEEF), size: 24.sp),
                  onPressed: () {
                    if (_source == 'drawer') {
                      AppRoutes.navigateTo(context, AppRoutes.customDrawer);
                    } else {
                      Navigator.of(context).maybePop();
                    }
                  },
                  tooltip: 'Back',
                ),
              ),
            ),
            SizedBox(height: 12.h),
            Center(
              child: Text(
                s.newItemsLabel,
                style: TextStyle(
                  color: const Color(0xFF00AEEF),
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(height: 16.h),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                textDirection: Directionality.of(context), // Let Flutter handle direction automatically
                children: List.generate(categories.length, (index) {
                  final isSelected = index == selectedCategory;
                  // Show red dot above 2nd and 3rd category (index 1 and 2)
                  final showRedDot = index == 1 || index == 2;
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6.0.w),
                    child: Stack(
                      alignment: AlignmentDirectional.topCenter,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(height: 8.h), // Space for red dot
                            TextButton(
                              onPressed: () {
                                setState(() => selectedCategory = index);
                              },
                              style: TextButton.styleFrom(
                                backgroundColor: isSelected ? const Color(0xFF00AEEF) : Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.r),
                                  side: BorderSide(
                                    color: isSelected ? const Color(0xFF00AEEF) : Colors.grey.shade300,
                                    width: 1.5.w,
                                  ),
                                ),
                                padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 8.h),
                              ),
                              child: Text(
                                categories[index],
                                style: TextStyle(
                                  color: isSelected ? Colors.white : Colors.grey[700],
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15.sp,
                                ),
                              ),
                            ),
                            SizedBox(height: 4.h),
                          ],
                        ),
                        if (showRedDot)
                          Positioned(
                            top: 0.h,
                            child: Container(
                              width: 10.w,
                              height: 10.h,
                              decoration: const BoxDecoration(
                                color: Colors.red,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                      ],
                    ),
                  );
                }),
              ),
            ),
            SizedBox(height: 12.h),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.0.w, vertical: 8.0.h),
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16.w,
                  mainAxisSpacing: 16.h,
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
          currentIndex: -1, // No item selected for New Items page
          onTap: (index) {
            if (index == 0) {
              Navigator.of(context).pushReplacementNamed('/home');
            } else if (index == 1) {
              Navigator.of(context).pushReplacementNamed('/favorite');
            } else if (index == 2) {
              Navigator.of(context).pushReplacementNamed('/profile');
            } else if (index == 3) {
              Navigator.of(context).pushReplacementNamed('/downloads');
            } else if (index == 4) {
              Navigator.of(context).pushReplacementNamed('/info');
            }
          },
        ),
      ),
    );
  }
}
