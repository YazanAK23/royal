import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:royal/core/routes/app_routes.dart';
import 'package:royal/generated/l10n.dart';
import 'package:royal/widgets/custom_app_bar.dart';
import 'package:royal/widgets/custom_bottom_nav_bar.dart';
import 'package:royal/widgets/notification_card.dart';

class NotificationCenterPage extends StatelessWidget {
  const NotificationCenterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          onMenuTap: () => AppRoutes.navigateTo(context, AppRoutes.customDrawer),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 24.h),
            Text(
              S.of(context).notificationCenterTitle,
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 12.h),
            // Directionality is now handled by Flutter's localization system (MaterialApp/CupertinoApp)
            // No need to wrap with Directionality here; text direction will follow the app's locale automatically.
            Expanded(
              child: ListView(
                children: [
                  NotificationCard(
                    title: S.of(context).notificationNewCategory,
                    message: S.of(context).notificationNewCategoryMsg,
                    date: '11/01/2022 03:00 PM',
                    icon: 'assets/images/Notifications1.png',
                  ),
                  SizedBox(height: 12.h),
                  NotificationCard(
                    title: S.of(context).notificationUpdate,
                    message: S.of(context).notificationUpdateMsg,
                    date: '11/01/2022 03:00 PM',
                    image: 'assets/images/Notifications2.png',
                  ),
                  SizedBox(height: 12.h),
                  NotificationCard(
                    title: S.of(context).notificationEvent,
                    message: S.of(context).notificationEventMsg,
                    date: '11/01/2022 03:00 PM',
                    icon: 'assets/images/Notifications1.png',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: -1, // No index selected for notifications page
        onTap: (index) {
          // Handle navigation for all indexes
          switch (index) {
            case 0:
              Navigator.of(context).pushReplacementNamed(AppRoutes.home);
              break;
            case 1:
              Navigator.of(context).pushReplacementNamed(AppRoutes.favorite);
              break;
            case 2:
              Navigator.of(context).pushReplacementNamed(AppRoutes.profile);
              break;
            case 3:
              Navigator.of(context).pushReplacementNamed(AppRoutes.history);
              break;
            case 4:
              Navigator.of(context).pushReplacementNamed(AppRoutes.info);
              break;
          }
        },
      ),
    );
  }
}
