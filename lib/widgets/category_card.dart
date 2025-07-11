import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../core/constants/app_text_styles.dart';

class CategoryCard extends StatelessWidget {
  final String iconPath;
  final String title;
  final VoidCallback? onTap;

  const CategoryCard({
    super.key,
    required this.iconPath,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 170.w, // Make the card larger and more square
        height: 170.h,
        decoration: BoxDecoration(
          color: const Color(0xFFF5F6F8), // Very light gray background
          borderRadius: BorderRadius.circular(20.r), // More rounded corners
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              iconPath,
              width: 110.w,
              height: 110.h,
              fit: BoxFit.contain,
            ),
            SizedBox(height: 16.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: Text(
                title,
                style: AppTextStyles.categoryTitle.copyWith(
                  color: Colors.black,
                  fontSize: 14.sp,
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
