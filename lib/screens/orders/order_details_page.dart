import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:royal/generated/l10n.dart';
import '../../../widgets/custom_app_bar.dart';
import '../../../widgets/custom_bottom_nav_bar.dart';
import '../../../widgets/item_card.dart';
import '../../../core/routes/app_routes.dart';

class OrderDetailsPage extends StatelessWidget {
  const OrderDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xFFF9F9F9),
        appBar: CustomAppBar(
          onMenuTap: () => AppRoutes.navigateTo(context, AppRoutes.customDrawer),
        ),
        body: Column(
          children: [
            SizedBox(height: 8.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              textDirection: TextDirection.ltr,
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back_ios_new, color: Colors.blue, size: 24.sp),
                  onPressed: () => Navigator.of(context).pushReplacementNamed(AppRoutes.orders),
                ),
              ],
            ),
            SizedBox(height: 8.h),
            Text(
              s.itemOrderTitle,
              style: TextStyle(fontSize: 22.sp, color: Colors.blue, fontWeight: FontWeight.bold),
            ),
            Text(
              s.itemOrderNumber,
              style: TextStyle(fontSize: 16.sp, color: Colors.blue),
            ),
            SizedBox(height: 16.h),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                itemCount: 5,
                itemBuilder: (context, index) => ItemCard(
                  imagePath: 'assets/images/kitchen_sink.png',
                  title: s.itemKitchenSinkTitle,
                  code: s.itemKitchenSinkCode,
                  quantity: 12,
                  unit: s.itemKitchenSinkUnitCTN,
                  unitDetails: s.itemKitchenSinkUnitDetails,
                  onDelete: () {},
                  onAdd: () {},
                  onRemove: () {},
                  onUnitChanged: (value) {},
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.h),
              child: SizedBox(
                width: 220.w,
                height: 48.h,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2ECC40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                  ),
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(s.itemSave, style: TextStyle(fontSize: 20.sp, color: Colors.white)),
                      SizedBox(width: 8.w),
                      Icon(Icons.check, color: Colors.white, size: 24.sp),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: CustomBottomNavBar(
          currentIndex: -1,
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
