import 'package:flutter/material.dart';
import 'package:royal/generated/l10n.dart';
import '../../widgets/royal_scaffold.dart';
import 'package:royal/core/routes/app_routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    // Detect text direction from locale
    final isRTL = Directionality.of(context) == TextDirection.rtl || Localizations.localeOf(context).languageCode == 'ar';
    return Directionality(
      textDirection: isRTL ? TextDirection.rtl : TextDirection.ltr,
      child: RoyalScaffold(
        currentIndex: 2, // Profile tab
        onNavTap: (index) {
          if (index == 0) {
            Navigator.of(context).pushReplacementNamed('/home');
          } else if (index == 1) {
            Navigator.of(context).pushReplacementNamed('/favorite');
          } else if (index == 2) {
            // Already on profile
          } else if (index == 3) {
            Navigator.of(context).pushReplacementNamed('/downloads');
          } else if (index == 4) {
            Navigator.of(context).pushReplacementNamed('/info');
          }
        },
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 24.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  textDirection: isRTL ? TextDirection.rtl : TextDirection.ltr,
                  children: [
                    CircleAvatar(
                      radius: 60.r,
                      backgroundColor: const Color(0xFFE0E0E0),
                      child: Icon(Icons.person, size: 80.sp, color: Colors.grey),
                    ),
                  ],
                ),
                SizedBox(height: 16.h),
                Text(
                  s.profileWelcome,
                  style: TextStyle(
                    fontSize: 28.sp,
                    color: const Color(0xFF00AEEF),
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  s.profileName,
                  style: TextStyle(
                    fontSize: 24.sp,
                    color: const Color(0xFF00AEEF),
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 24.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF00AEEF),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 12.h),
                      ),
                      onPressed: () {
                        AppRoutes.navigateTo(context, AppRoutes.profileEdit);
                      },
                      child: Text(
                        s.profileEdit,
                        style: TextStyle(fontSize: 18.sp, color: Colors.white),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16.h),
                _ProfileMenuItem(
                  icon: Icons.assignment,
                  label: s.profileOrders,
                  onTap: () => Navigator.pushNamed(
                    context,
                    AppRoutes.orders,
                    arguments: {'source': 'profile'},
                  ),
                  isRTL: isRTL,
                ),
                _ProfileMenuItem(
                  icon: Icons.star,
                  label: s.profileNewItems,
                  onTap: () => Navigator.pushNamed(
                    context,
                    '/new-items',
                    arguments: {'source': 'profile'},
                  ),
                  isRTL: isRTL,
                ),
                _ProfileMenuItem(
                  icon: Icons.history,
                  label: s.profileBrowsingArchive,
                  onTap: () => Navigator.pushNamed(
                    context,
                    '/browsing-history',
                    arguments: {'source': 'profile'},
                  ),
                  isRTL: isRTL,
                ),
                _ProfileMenuItem(
                  icon: Icons.favorite_border,
                  label: s.profileFavorites,
                  onTap: () => Navigator.pushNamed(
                    context,
                    '/favorite',
                    arguments: {'source': 'profile'},
                  ),
                  isRTL: isRTL,
                ),
                SizedBox(height: 24.h),
                Center(
                  child: SizedBox(
                    width: 150.w,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFF5A5A),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 12.h),
                      ),
                      onPressed: () {},
                      child: Text(
                        s.profileLogout,
                        style: TextStyle(fontSize: 18.sp, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ProfileMenuItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback? onTap;
  final bool isRTL;
  const _ProfileMenuItem({required this.icon, required this.label, this.onTap, this.isRTL = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 6.h),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFF6F7F9),
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Directionality(
          textDirection: isRTL ? TextDirection.rtl : TextDirection.ltr,
          child: ListTile(
            leading: Icon(icon, color: Colors.grey[700]),
            title: Text(
              label,
              style: TextStyle(fontSize: 16.sp, color: Colors.black),
              textAlign: isRTL ? TextAlign.right : TextAlign.left,
            ),
            onTap: onTap,
          ),
        ),
      ),
    );
  }
}
