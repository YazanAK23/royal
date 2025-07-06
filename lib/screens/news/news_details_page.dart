import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.content,
    this.onNext,
    this.onPrev,
  });

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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        child: Column(
          children: [
            Row(
              children: [
                const Spacer(),
                IconButton(
                  icon: Icon(Icons.arrow_back_ios_new, color: const Color(0xFF00B4D8), size: 24.sp),
                  onPressed: () {
                    Navigator.of(context).pushNamedAndRemoveUntil(AppRoutes.news, (route) => false);
                  },
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 12.h),
              child: Center(
                child: Text(
                  S.of(context).newsTitle,
                  style: TextStyle(
                    color: const Color(0xFF00B4D8),
                    fontWeight: FontWeight.bold,
                    fontSize: 20.sp,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              textDirection: Directionality.of(context),
              children: [
                TextButton.icon(
                  onPressed: onPrev,
                  icon: Icon(Icons.arrow_back_ios_new, color: const Color(0xFF00B4D8), size: 18.sp),
                  label: Text(s.previousNews, style: TextStyle(color: const Color(0xFF00B4D8), fontSize: 14.sp)),
                ),
                TextButton.icon(
                  onPressed: onNext,
                  label: Text(s.nextNews, style: TextStyle(color: const Color(0xFF00B4D8), fontSize: 14.sp)),
                  icon: Icon(Icons.arrow_forward_ios, color: const Color(0xFF00B4D8), size: 18.sp),
                ),
              ],
            ),
            SizedBox(height: 8.h),
            ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: Image.asset(
                image,
                height: 180.h,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 12.h),
            Align(
              alignment: AlignmentDirectional.centerEnd,
              child: Text(
                title,
                style: TextStyle(
                  color: const Color(0xFF00B4D8),
                  fontWeight: FontWeight.bold,
                  fontSize: 16.sp,
                ),
              ),
            ),
            SizedBox(height: 8.h),
            Align(
              alignment: AlignmentDirectional.centerEnd,
              child: Text(
                subtitle,
                style: TextStyle(
                  color: const Color(0xFF222222),
                  fontSize: 14.sp,
                ),
              ),
            ),
            SizedBox(height: 12.h),
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  content,
                  style: TextStyle(
                    color: const Color(0xFF222222),
                    fontSize: 14.sp,
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
