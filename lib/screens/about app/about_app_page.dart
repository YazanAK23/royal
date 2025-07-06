import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:royal/core/routes/app_routes.dart';
import 'package:royal/generated/l10n.dart';
import 'package:royal/core/constants/app_colors.dart';
import 'package:royal/core/constants/app_text_styles.dart';
import 'package:royal/core/constants/app_dimensions.dart';

class AboutAppPage extends StatelessWidget {
  const AboutAppPage({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pushReplacementNamed(AppRoutes.customDrawer);
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.appBarBackground,
          elevation: AppDimensions.appBarElevation,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, size: 24.sp, color: AppColors.primary),
            onPressed: () {
              Navigator.of(context).pushReplacementNamed(AppRoutes.customDrawer);
            },
          ),
          title: Text(
            S.of(context).appInfoLabel,
            style: AppTextStyles.appBarTitle.copyWith(fontSize: 18.sp),
          ),
          centerTitle: true,
          actions: const [],
        ),
        body: Column(
          children: [
            SizedBox(height: AppDimensions.menuItemSpacing.h),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.menuItemBackground,
                borderRadius: BorderRadius.circular(AppDimensions.menuItemBorderRadius.r),
              ),
              padding: EdgeInsets.symmetric(vertical: AppDimensions.menuItemPaddingVertical.h),
              margin: EdgeInsets.symmetric(horizontal: 0.w),
              child: Column(
                children: [
                  _buildMenuItem(S.of(context).aboutRoyalLabel),
                  Divider(height: 0.h, color: AppColors.menuItemDivider),
                  _buildMenuItem(S.of(context).jobsLabel),
                  Divider(height: 0.h, color: AppColors.menuItemDivider),
                  _buildMenuItem(S.of(context).privacyPolicyLabel),
                ],
              ),
            ),
            SizedBox(height: AppDimensions.versionSpacing.h),
            Column(
              children: [
                Text(
                  S.of(context).versionLabel("2.1"),
                  style: AppTextStyles.versionText.copyWith(fontSize: 16.sp),
                ),
                SizedBox(height: AppDimensions.madeInSpacing.h),
                Text(
                  S.of(context).madeInPalestine,
                  style: AppTextStyles.madeInText.copyWith(fontSize: 14.sp),
                ),
                SizedBox(height: AppDimensions.madeInSpacing.h),
                Text(
                  S.of(context).royalCo2022,
                  style: AppTextStyles.madeInText.copyWith(fontSize: 14.sp),
                ),
              ],
            ),
            SizedBox(height: AppDimensions.bottomSpacing.h),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(String title) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 12.w),
      title: Text(
        title,
        style: TextStyle(fontSize: 16.sp, color: Colors.grey),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        color: Colors.grey,
        size: 14.sp,
      ),
      onTap: () {},
    );
  }
}
